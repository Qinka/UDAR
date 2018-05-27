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
 * The module for frequency division
 * 
 */

module fq #(parameter CNT_LEN = 8)
   (
    // The clock
    input                   clk,
    // Reset
    input                   rst,
    // The counter
    input [CNT_LEN - 1 : 0] cnt_in,
    output                  clk_out
    );


   // counter
   reg [CNT_LEN - 1 : 0]    cnt_d, cnt_q = 0;

   // clock
   reg                      clk_d, clk_q = 1;

   assign clk_out = clk_q;

   always @(*) begin
      if (cnt_in > cnt_q) begin
         clk_d = clk_q;
         cnt_d = cnt_q + 1'b1;
      end
         else begin
            clk_d = ~ clk_q;
         cnt_d = 1'b1;
      end
   end

   always @(posedge clk or negedge clk) begin
      if(rst) begin
         clk_q <= 1'b0;
         cnt_q <= 0;
      end
      else begin
         cnt_q <= cnt_d;
         clk_q <= clk_d;
      end
   end

endmodule
