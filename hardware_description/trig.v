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
 * The module for hc-sr04 ``trig'' signal
 *
 */

module trig #(parameter CNT_LEN = 8)
   (
    // The clock
    input                   clk,
    // The reset signal
    input                   rst,
    // The enable signal (for posedge)
    input                   enable,
    // The timeout time
    input [CNT_LEN - 1 : 0] timeout,
    // ready
    output                  ready,
    // signal
    output                  sig
    );

   // parameter
   localparam STATE_SIZE = 1;

   localparam
     READY = 0,
     COUNTING = 1;

   // Status
   reg                      state_d, state_q = 0;

   // Counter
   reg [CNT_LEN - 1 : 0]    cnt_d, cnt_q = 0;

   // Signal
   reg                      sig_d, sig_q = 0;



   assign ready = ! state_q;
   assign sig  = sig_q;

   always @(*) begin
      state_d = state_q;
      cnt_d = 0;
      sig_d = 0;
      
      case (state_q)
        READY: begin
           if(enable)
             state_d = COUNTING;
        end // case: READY

        COUNTING: begin
           if(! enable)
             if (cnt_q < timeout) begin
                sig_d = 1;
                cnt_d = cnt_q + 1'b1;
             end
             else
               state_d = READY;
        end // case: COUNTING
      endcase

   end

   always @(posedge clk or posedge clk) begin
      if(rst) begin
         state_q <= READY;
         cnt_q   <= 0;
         sig_q   <= 0;
      end
      else begin
         state_q <= state_d;
         cnt_q   <= cnt_d;
         sig_q   <= sig_d;
      end
   end

endmodule
