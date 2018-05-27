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
  * The module for driver of HC-SR04
  *
*/

module hcsr04 #(parameter CAP_LEN=16, TIMEOUT=500, CNT_LEN=9, FD_LEN=6, FD_F=25)
   (
    // Clock 50MHz
    input                    clk50M,
    // Reset
    input                    rst,
    // Enable
    input                    en,
    // Signal of length
    input                    sig_len,
    // Signal of trig
    output                   sig_trig,
    // Length
    output [CAP_LEN - 1 : 0] len,
    // Done
    output                   done
    );


   // Status
   localparam STATE_LEN = 3;
   localparam
     READY = 0,
     TRIG = 1,
     ECHO = 2,
     WAIT = 3,
     READ = 4;
   // state
   reg [STATE_LEN - 1 : 0]   state_d, state_q = 0;

   // Done for output
   reg                       done_d, done_q=0;

   assign done = done_q;
   
   // length counter
   reg [CAP_LEN - 1 : 0]     len_d, len_q=0;
   assign len = len_q;

   // f d
   // 1MHz clock
   wire                      clk_fq;
   // instance
   fq #(.CNT_LEN(FD_LEN)) u_fq
     ( .clk(clk50M),
       .rst(rst),
       .cnt_in(FD_F),
       .clk_out(clk_fq)
       );


   // trigger
   // trig signal
   wire                      trig_s;
   // Ready for trig
   wire                      ready;
   // Trig enable line
   reg                       en_d, en_q=0;
   assign sig_trig = trig_s;
   // instance
   trig #(.CNT_LEN(CNT_LEN)) u_trig
     ( .clk(clk50M),
       .rst(rst),
       .enable(en_q),
       .timeout(TIMEOUT),
       .ready(ready),
       .sig(trig_s)
       );

   // high level capture
   // Done for capture
   wire                      done_w;
   // length from capture
   wire [15 : 0]             cap_len;
   // instance
   capture #(.OUT_LEN(CAP_LEN)) u_cap
     ( .cap_signal(sig_len),
       .clk(clk_fq),
       .rst(rst),
       .cnt(cap_len),
       .done(done_w)
       );

   always @(*) begin
      en_d = 0;
      state_d = state_q;
      done_d = done_q;
      case (state_q)
        READY: begin
           if(en && ready) begin
              done_d = 0;
              state_d = TRIG;
              en_d = 1;
           end
        end
        TRIG: begin
           if (!ready) begin
              state_d = ECHO;
           end
        end
        ECHO: begin
           if (!done_w)
             state_d = WAIT;
        end
        WAIT: begin
           if (done_w)
             state_d = READ;
        end
        READ: begin
           len_d = cap_len;
           done_d = 1;
           state_d = READY;
        end
      endcase
   end

   always @(posedge clk50M or posedge rst) begin
      if (rst) begin
         done_q  <= 1;
         len_q   <= 1'b0;
         state_q <= READY;
         en_q    <= 0;
      end
      else begin
         done_q  <= done_d;
         len_q   <= len_d;
         state_q <= state_d;
         en_q    <= en_d;
      end // else: !if(rst)
   end


endmodule
