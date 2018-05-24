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
 * The module for PWM.
 *
 */


module pwm #(parameter CNT_LEN = 8, parameter CNT_MAX = 255)
   (
    // clock signal
     input                   clk,
    // reset signal
     input                   rst,
    // the reigster of compare
     input [CNT_LEN - 1 : 0] cmp,
    // output signal
     output                  pwm
     );

   // signal reg
   reg                       pwm_d, pwm_q;
   // counter
   reg [CNT_LEN - 1 : 0]     cnt_d, cnt_q;

   assign pwm = pwm_q;

   // compare
   always @(*) begin
      if(cnt_q < CNT_MAX)
        cnt_d = cnt_q + 1'b1;
      else
        cnt_d =  1'b0;

      if (cmp > cnt_q)
        pwm_d = 1'b1;
      else
        pwm_d = 1'b0;
   end

   // clock
   always @(posedge clk) begin
      if (rst)
        cnt_q <= 1'b0;
      else
        cnt_q <= cnt_d;

      pwm_q <= pwm_d;
   end

endmodule
