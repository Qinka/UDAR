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
 * The module for capturing the high level and measure the length of signal
 *
 */

module capture #(parameter OUT_LEN = 8)
   (
    // The signal to be captured
    input                    cap_signal,
    // The clock signal
    input                    clk,
	  // Reset
	  input                    rst,
    // The counter (it might be overflow)
    output [OUT_LEN - 1 : 0] cnt,
    // The signal of DONE
    output                   done
    );

   // Counters
   reg [OUT_LEN - 1 : 0]     cnt_d, cnt_q, cnt_o = 0;

   // Status
   reg                       status_d, status_q = 1'b0;

   assign cnt = cnt_o;
	 assign done = ! status_q;

	 // any
	 always @(*) begin
		  status_d <= cap_signal;
		  cnt_d <= cnt_q + 1;
	 end

	 // cap sig
	 always @(negedge cap_signal) begin
		  cnt_o <= cnt_q;
	 end

   // Clock
   always @(posedge clk or posedge rst) begin
      if (rst) begin
			   status_q <= 1'b1;
			   cnt_q <= 0;
		  end
		  else begin
			   if (status_d)
				   cnt_q <= cnt_d;
			   else
				   cnt_q <= 1'b0;
			   status_q <= status_d;
 		  end
   end

endmodule
