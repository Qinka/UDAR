{-# LANGUAGE MultiWayIf #-}

module UDAR.SendRecv where


import qualified Data.ByteString.Lazy as BL
import System.Hardware.Serialport
import Control.Monad
import Control.Concurrent
import Data.Word
import Control.Concurrent
import Data.Binary
import Data.Binary.Get
import Data.Binary.Put
import Text.Printf

data Frame
  = Init
  | InitAck
  | Servo Word8 Word8
  | ServoAck
  | Trig
  | TrigAck Word16
  deriving (Eq,Show)

instance Binary Frame where
  put Init          = putWord8 0x00
  put InitAck       = putWord8 0xAA
  put (Servo x y)   = putWord8 0x03 >> putWord8 x >> putWord8 y
  put ServoAck      = putWord8 0xAB
  put Trig          = putWord8 0x0C
  put (TrigAck len) = putWord8 0xAE >> putWord16be len
  get = do
    frame <- getWord8
    case frame of
      0x00 -> return Init
      0xAA -> return InitAck
      0x03 -> do
        x <- getWord8
        y <- getWord8
        return $ Servo x y
      0xAB -> return ServoAck
      0x0C -> return Trig
      0xAE -> do
        len <- getWord16be
        return $ TrigAck len
      _ -> fail $ "Error frame" ++ show frame
    
  


sendRecvFrame :: SerialPort        -- ^ Serial Port
              -> Frame             -- ^ The frame to be send
              -> (Word8 -> Bool)   -- ^ Check the frame
              -> Int               -- ^ Frame size
              -> IO Frame
sendRecvFrame s frm isFrame len = sr
  where sr = sendStep >> recvStep []
        sendStep = send s $ BL.toStrict (encode frm)
        recvStep [] = do
          b <- BL.unpack . BL.fromStrict <$> recv s 1
          if | null b           -> sr
             | isFrame (head b) -> recvStep b
             | otherwise        -> recvStep []
        recvStep bs =
          if length bs == len
          then do
            let rt = decodeOrFail $ BL.pack bs
            case rt of
              Left   _      -> recvStep $ tail bs
              Right (_,_,f) -> return f
          else do
            b <- BL.unpack . BL.fromStrict <$> recv s 1
            if null b
              then sr 
              else recvStep $ bs ++ b


getDistance :: SerialPort -- ^ Serial Port
            -> Word8      -- ^ X
            -> Word8      -- ^ Y
            -> Int        -- ^ Times
            -> IO (Word8, Word8, Word16, Word16)
getDistance s x y t = do
  when (x > 250 || x < 50) $ error $
    "X servo position[50,250] can not be " ++ show x
  when (y > 250 || y < 50) $ error $
    "Y servo position[50,250] can not be " ++ show y
  sendRecvFrame s (Servo x y) (==0xAB) 1
  threadDelay 400
  (disA,disB) <- avg t []
  printf "At %d %d, distance = (%d,%d) \n" x y disA disB
  return (x,y,disA, disB)
  where avg 0 xs = return $ (minimum xs, maximum xs) 
        avg n xs = do
          TrigAck dis <- sendRecvFrame s Trig (==0xAE) 3
          printf "Distance = %d\n" dis
          threadDelay 400
          avg (n - 1) (dis:xs)
