

module UDAR.SendRecv
  (
  ) where


import qualified Data.ByteString as B 
import System.Hardware.Serialport
import Control.Monad
import Control.Concurrent
import Data.Word

fetchPoint :: SerialPort -- ^ serialport
           -> Int -- ^ X servo position
           -> Int -- ^ Y servo position
           -> IO (Float, Float, Float) -- ^ (x,y,z)
fetchPoint s x y = do
  when (x > 250 || x < 50) $ error $
    "X servo position[50,250] can not be " ++ show x
  when (y > 250 || y < 50) $ error $
    "Y servo position[50,250] can not be " ++ show y

  let sendFrame = B.pack [0xF0, fromIntegral x, fromIntegral y]
  sendRecv s sendFrame
  threadDelay 400
  len <- sendRecv s sendFrame
  --
  -- Translate the Depth X-srv Y-srv format to X Y Z (euclidean space)
  -- FRIST  STEP: translates X-srv Y-srv to angle(radian)
  --        e.g.: (X-srv - 150) / 200 * pi
  -- SECOND STEP: translates angle to spherical coordinate system
  --        e.g.: \phi   = pi/2 - x_radian
  --              \theta = pi/2 - y_radian
  --              \rho   = depth
  -- THIRD  STEP: translates spherical coordinate to euclidean coordinate
  --        e.g.: x = \rho * sin \phi * cos \theta
  --              y = \rho * sin \phi * sin \theta
  --              z = \rho * cos \phi
  --
  let xAg = (fromIntegral x - 150) / 200 * pi :: Float
      yAg = (fromIntegral y - 150) / 200 * pi :: Float
      xP = len * sin xAg * cos yAg
      yP = len * sin xAg * sin yAg
      zP = len * cos xAg
  return (xP, yP, zP)

sendRecvStep :: SerialPort -- ^
             -> B.ByteString -- ^ frame
             -> IO (Int, [Word8]) -- ^ len_d
sendRecvStep s f = do
  n  <- send s f
  rt <- recvFrame s []
  return (n,rt)

sendRecv :: SerialPort -- ^
         -> B.ByteString -- ^ frame
         -> IO Float -- ^ len_d
sendRecv s f = do
  (n, rt) <- sendRecvStep s f
  print (n,rt)
  case (n, rvFrame rt) of
    (3,0x0F) -> let (_:h:l:_) = rt
                in return $ fromIntegral h * 0x100 + fromIntegral l
    _ -> threadDelay 300 >> sendRecv s f


recvFrame :: SerialPort
          -> [Word8]
          -> IO [Word8]
recvFrame s [] = do
  b <- B.unpack <$> recv s 1
  print b
  case b of
    [0x0f] -> recvFrame s [0x0f]
    [] -> return []
    _ -> recvFrame s []
recvFrame s xs = do
  b <- B.unpack <$> recv s 1
  print b
  let rt = xs ++ b
  print rt
  if length rt < 3
    then recvFrame s rt
    else return rt
   

rvFrame :: [Word8] -> Word8
rvFrame (x:_:_:_) = x
rvFrame _       = 0xFC
  
sendInit :: SerialPort -- ^ serialport
         -> IO ()
sendInit s = void $ send s $ B.pack [0x00]


getFace :: SerialPort -- ^ serialport
        -> (Int, Int) -- ^ X(range)
        -> (Int, Int) -- ^ Y(range)
        -> IO [(Float, Float, Float)]
getFace s (xB,xE) (yB, yE) =
  let lst = [(x,y) | x <- [xB..xE], y <- [yB..yE]]
  in mapM (\(x,y) -> do
              rt <- fetchPoint s x y
              putStrLn $ "\t\t\t\t" ++ show x ++ "\t" ++ show y ++ "\t " ++ show rt
              threadDelay 500
              return rt
          ) lst
