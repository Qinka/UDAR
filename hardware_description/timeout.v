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
   // status
   reg                      state_d, state_q = 0;

   assign done = ~ state_q;

   always @(*) begin
      if (state_q) begin // in counting down
         if (!enable) begin
            if (cnt_q < timeout) begin
               cnt_d = cnt_q + 1'b1;
               state_d = state_q;
            end
            else begin
               cnt_d = cnt_q;
               state_d = 1'b0;
            end
         end
         else begin
            state_d = state_q;
            cnt_d = cnt_q;
         end // else: !if(!enable)
      end
      else begin // ready to count
         if(enable) begin
            state_d = 1'b1;
            cnt_d = 1'b1;
         end
         else begin
            state_d = 1'b0;
            cnt_d = cnt_q;
         end
      end // else: !if(state_q)
   end // always @ (*)


   always @(posedge clk or posedge rst) begin
      if (rst) begin
         state_q <= 1'b0;
         cnt_q <= 1'b1;
      end
      else begin
         state_q <= state_d;
         cnt_q <= cnt_d;
      end
   end // always @ (posedge clk or posedge rst)

endmodule // timeout
