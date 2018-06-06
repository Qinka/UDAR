/***************************************************************************
 *
 * Copyright (C) 2018 Johann Lee
 *
 * This file is part of UDAR.
 *
 * UDAR is free hardware design: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * UDAR is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with UDAR.  If not, see <http://www.gnu.org/licenses/>.
 *
 ***************************************************************************
 *
 * The module for controlling hold system.
 *
 */

module ctrl #(parameter PWM_LEN = 12, parameter PWM_MAX=2000, parameter POS_LEN = 8,
              parameter SER_FD_LEN = 12, parameter SER_FD_F = 250,
              parameter CAP_LEN = 16, parameter HC_TIMEOUT = 500, parameter HC_CNT_LEN = 9,
              parameter HC_FD_LEN = 6, parameter HC_FD_F = 25,
              parameter CLK_PER_BIT = 50,
              parameter SEND_BYTES = 2, parameter SEND_CNT_LEN = 4)
   (
    // Default is 50MHz
    input  clk,
    // Reset
    input  rst_i,
    // serial recv
    input  ser_rx,
    // serial send
    output ser_tx,
    // Servo 1
    output servo1,
    // Servo 2
    output servo2,
    // HC SR 04
    input  cap_sig,
    output trig
    );

   // Reset
   reg     rst_d, rst_q = 0;
   wire    rst;
   assign rst = rst_q | rst_i;

   


   // state
   localparam STATE_LEN = 4;
   localparam
     s_rst_en         = 1,  // Start to rst(rst => 1)
     s_rst_ack        = 2,  // Send ack frame
     s_rst_done       = 3,  // Ready to work
     s_frame_read     = 4,  // Read the frames
     s_servo_x_read   = 5,  // Read the servo x value
     s_servo_y_read   = 6,  // Read the servo y value
     s_servo_ack      = 7,  // Send servo ack frame
     s_servo_done     = 8,  // Setting servo done
     s_udar_trig      = 9,  // Trigger UDAR
     s_udar_trig_wait = 10, // Wait UDAR done
     s_udar_send      = 11, // UDAR send frame and data
     s_udar_wait      = 12, // UDAR wait frame and data sent done
     s_null           = 0;  // NULL
   
   localparam
     f_init      = 8'b0000_0000, // Init frame
     f_init_ack  = 8'b1010_1010, // Ack init frame
     f_servo     = 8'b0000_0011, // Servo setting frame
     f_servo_ack = 8'b1010_1011, // Servo ack frame
     f_trig      = 8'b0000_1100, // UDAR trigger frame
     f_trig_ack  = 8'b1010_1110; // UDAR trigger frame

   reg [STATE_LEN - 1 : 0] state_d, state_q = s_rst_en;


   // read
   localparam READ_LEN = 2;
   localparam
     r_wait = 0,
     r_done = 1;

   // send
   localparam SEND_LEN = 2;
   localparam
     t_busy = 0,
     t_send = 1;


   // servo
   reg [POS_LEN - 1 : 0]   ser_x_d, ser_x_q = 150;
   reg [POS_LEN - 1 : 0]   ser_y_d, ser_y_q = 150;
   wire                    pwm_x;
   wire                    pwm_y;
   assign servo1 = pwm_x;
   assign servo2 = pwm_y;

   // servo instance for x
   servo #(.PWM_LEN(PWM_LEN), .PWM_MAX(PWM_MAX), .POS_LEN(POS_LEN),
           .FD_LEN(SER_FD_LEN), .FD_F(SER_FD_F)) u_ser_x
     ( .clk(clk),
       .rst(rst),
       .pos(ser_x_q),
       .pwm(pwm_x)
       );

   // servo instance for y
   servo #(.PWM_LEN(PWM_LEN), .PWM_MAX(PWM_MAX), .POS_LEN(POS_LEN),
           .FD_LEN(SER_FD_LEN), .FD_F(SER_FD_F)) u_ser_y
     ( .clk(clk),
       .rst(rst),
       .pos(ser_y_q),
       .pwm(pwm_y)
       );


   // hc sr04
   reg [SEND_CNT_LEN - 1 : 0] cnt_d, cnt_q = 0;
   reg [CAP_LEN - 1 : 0]      len_d, len_q = 0;
   reg                        en_d, en_q;
   wire [CAP_LEN - 1 : 0]     len_w;
   wire                       trig_sig;
   wire                       hcsr04_done;

   assign trig = trig_sig;

   // hc sr 04 instance
   hcsr04 #(.CAP_LEN(CAP_LEN), .TIMEOUT(HC_TIMEOUT), .CNT_LEN(HC_CNT_LEN),
            .FD_LEN(HC_FD_LEN), .FD_F(HC_FD_F)) u_hcsr04
     ( .clk50M(clk),
       .rst(rst),
       .en(en_q),
       .sig_len(cap_sig),
       .sig_trig(trig_sig),
       .len(len_w),
       .done(hcsr04_done)
       );


   // serial receive
   wire [7 : 0]               rx_data;
   wire                       rx_done;
   reg                        rxd_d, rxd_q = 0;


   // serial_r instance
   serial_r #(.CLK_PER_BIT(CLK_PER_BIT)) u_sr
     ( .clk(clk),
       .rst(rst),
       .rx(ser_rx),
       .data(rx_data),
       .done(rx_done)
       );


   // serial send
   wire                       tx_data;
   wire                       tx_busy;
   reg [7 : 0]                tx_data_d, tx_data_q;
   reg                        tx_send_d, tx_send_q;
   assign ser_tx = tx_data;

   // serial_t instance
   serial_t #(.CLK_PER_BIT(CLK_PER_BIT)) u_st
     ( .clk(clk),
       .rst(rst),
       .tx(tx_data),
       .block(0),
       .busy(tx_busy),
       .data(tx_data_q),
       .send(tx_send_q)
       );


   // Timeout
   reg                        to_en_d, to_en_q;
   reg [9 : 0]                time_d, time_q = 0;
   wire                       to_done;

   // Timeout instance
   timeout #(.CNT_LEN(9)) u_rst_to
     ( .rst(rst),
       .clk(clk),
       .timeout(time_q),
       .enable(to_en_q),
       .done(to_done)
       );

   // State machine

   always @(*) begin
      rxd_d = 0;
      state_d = state_q;
      to_en_d = 0;
      rst_d = 0;
      time_d = 0;
      ser_x_d = ser_x_q;
      ser_y_d = ser_y_q;
      en_d = 0;
      len_d = len_q;
      tx_data_d = tx_data_q;
      tx_send_d = 0;
      cnt_d = cnt_q;

      case (state_q)
        s_rst_en: begin
           to_en_d = 1;
           rst_d = 1;
           time_d = 500;
           ser_x_d = 150;
           ser_y_d = 150;
           len_d = 0;
           cnt_d = 0;
           state_d = s_rst_ack;
        end

        s_rst_ack:
          if(to_done) begin
             tx_data_d = f_init_ack;
             tx_send_d = 1;
             if(tx_busy)
               state_d = s_rst_done;
          end

        s_rst_done:
          if(! tx_busy)
            state_d = s_frame_read;

        s_frame_read:
          if(rxd_q)
            case (rx_data)
              f_init:
                state_d = s_rst_en;
              f_servo:
                state_d = s_servo_x_read;
              f_trig:
                state_d = s_udar_trig;
              default:
                state_d = s_rst_en;
            endcase // case (rx_data)

        s_servo_x_read:
          if(rxd_q) begin
             ser_x_d = rx_data;
             state_d = s_servo_y_read;
          end

        s_servo_y_read:
          if(rxd_q) begin
             ser_y_d = rx_data;
             state_d = s_servo_ack;
          end

        s_servo_ack: begin
           tx_data_d = f_servo_ack;
           tx_send_d = 1;
           state_d = s_servo_done;
        end

        s_servo_done:
          if(! tx_busy)
            state_d = s_frame_read;
        
        s_udar_trig:
          if(!hcsr04_done)
            state_d = s_udar_trig_wait;
          else
            en_d = 1;

        s_udar_trig_wait:
          if(hcsr04_done) begin
             state_d = s_udar_send;
             len_d = len_w;
             cnt_d = SEND_BYTES + 1;
          end

        s_udar_send:
          if(cnt_q <= 0) begin
             state_d = s_frame_read;
          end
          else if (tx_busy)
            state_d = s_udar_wait;
          else begin
             if (cnt_q == SEND_BYTES + 1)
               tx_data_d = f_trig_ack;
             else
               tx_data_d = len_q[cnt_q * 8 - 1 -: 8];
             tx_send_d = 1;
			 end

        s_udar_wait:
          if(! tx_busy) begin
             state_d = s_udar_send;
             cnt_d = cnt_q - 1;
          end
        default:
          state_d = s_rst_en;
      endcase // case (state_q)
   end // always @ (*)

   always @(posedge clk or posedge rx_done or posedge rst_i) begin
      if (rst_i) begin
         rst_q <= 0;
         ser_x_q <= 150;
         ser_y_q <= 150;
         en_q <=  0;
         len_q <= 0;
         cnt_q <= 0;
         rxd_q <= 0;
         tx_data_q <= 0;
         tx_send_q <= 0;
         to_en_q <= 0;
         time_q <= 0;
         state_q <= s_rst_en;
      end
      else if(rx_done) begin
         rst_q <= rst_q;
         ser_x_q <= ser_x_q;
         ser_y_q <= ser_y_q;
         en_q <= en_q;
         len_q <= len_q;
         cnt_q <= cnt_q;
         tx_data_q <= tx_data_q;
         tx_send_q <= tx_send_q;
         to_en_q <= to_en_q;
         time_q <= time_q;
         state_q <= state_q;
         rxd_q <= 1;
      end
      else begin
         rst_q <= rst_d;
         ser_x_q <= ser_x_d;
         ser_y_q <= ser_y_d;
         en_q <= en_d;
         len_q <= len_d;
         cnt_q <= cnt_d;
         rxd_q <= rxd_d;
         tx_data_q <= tx_data_d;
         tx_send_q <= tx_send_d;
         to_en_q <= to_en_d;
         time_q <= time_d;
         state_q <= state_d;
      end
   end

endmodule
