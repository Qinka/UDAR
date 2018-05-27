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
 * The module for waiting a times.
 *
 */

module timeout #(parameter CNT_LEN = 8)
   (
    input                   rst,
    input                   clk,
    input [CNT_LEN - 1 : 0] timeout,
    input                   enable,
    output                  done
    );

   // counter
   reg [CNT_LEN - 1 : 0]    cnt_d, cnt_q = 1'b1;
   
   // state
   localparam
     READY    = 0,
     COUNTING = 1;
   //reg
   reg                      state_d, state_q = 0;

   assign done = ~ state_q;

   always @(*) begin
      state_d = state_q;
      cnt_d = cnt_q;
      
      case (state_q)
        READY: begin
           if(enable) begin
              state_d = COUNTING;
              cnt_d = 1'b1;
           end
        end
        COUNTING: begin
           if (cnt_q < timeout)
              cnt_d = cnt_q + 1'b1;
           else
              state_d = 1'b0;
        end
      endcase
   end // always @ (*)


   always @(posedge clk or posedge rst) begin
      if (rst) begin
         state_q <= 1'b0;
         cnt_q   <= 1'b1;
      end
      else begin
         state_q <= state_d;
         cnt_q   <= cnt_d;
      end
   end // always @ (posedge clk or posedge rst)

endmodule // timeout
