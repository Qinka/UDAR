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
     s_rst        = 0,
     s_frame_read = 1,
     s_read_x     = 2,
     s_read_y     = 3,
     s_wait_ser   = 4,
     s_trig       = 5,
     s_frame_send = 6,
     s_distn_send = 7,
     s_rst_done   = 8,
     s_frame_wait = 9,
     s_distn_wait = 10,
     s_trig_wait  = 11;


   reg [STATE_LEN - 1 : 0] state_d, state_q = s_rst;


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
        s_rst: begin
           to_en_d = 1;
           rst_d = 1;
           time_d = 500;
           state_d = s_rst_done;
        end

        s_rst_done: begin
           to_en_d = 0;
           if(to_done)
             state_d = s_frame_read;
           else
             state_d = state_q;
        end

        s_frame_read: begin
           if(rxd_q) begin
              case (rx_data)
                8'b0000_0000:
                  state_d = s_rst;
                8'b1111_0000:
                  state_d = s_read_x;
              endcase // case (rx_data)
           end
        end // case: s_frame_read

        s_read_x: begin
           if(rxd_q) begin
              ser_x_d = rx_data;
              state_d = s_read_y;
           end
        end


        s_read_y: begin
           if(rxd_q) begin
              ser_y_d = rx_data;
              // timeout wait
              state_d = s_wait_ser;
              time_d = 1000;
              to_en_d = 1;
           end
        end // case: s_read_y

        s_wait_ser: begin
           if(to_done) begin
              state_d = s_trig;
              en_d = 1;
           end
        end

        s_trig: begin
           if(!hcsr04_done)
             state_d = s_trig_wait;
           else
             en_d = 1;

        end

        s_trig_wait: begin
           if(hcsr04_done) begin
              state_d = s_frame_send;
              len_d = len_w;
           end
        end

        s_frame_send: begin
           if(tx_busy) begin
              tx_send_d = 0;
              state_d = s_frame_wait;
           end
           else begin
              tx_data_d = 8'b0000_1111;
              tx_send_d = 1;
           end
        end

        s_frame_wait: begin
           if(! tx_busy) begin
              state_d = s_distn_send;
              cnt_d = SEND_BYTES;
           end
        end

        s_distn_send: begin
           if(cnt_q <= 0) begin
              state_d = s_frame_read;
           end
           else begin
              if(tx_busy)
                state_d = s_distn_wait;
              else begin
                 tx_data_d = len_q[cnt_q * 8 - 1 -: 8] ;
                 tx_send_d = 1;
              end
           end
        end // case: s_distn_wait

        s_distn_wait: begin
           if(! tx_busy) begin
              state_d = s_distn_send;
              cnt_d = cnt_q - 1;
           end
        end
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
         state_q <= 0;
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
