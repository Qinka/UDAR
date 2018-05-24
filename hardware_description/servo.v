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
 * The module for controlling servo.
 *
*/

module servo #(parameter PWM_LEN = 12, parameter PWM_MAX=2000, parameter POS_LEN = 8,
               parameter FD_LEN = 12, parameter FD_F =250, parameter WAITTIME=100)
   (
    // clk
    input                   clk,
    // rst
    input                   rst,
    // Pos
    input [POS_LEN - 1 : 0] pos,
    // PWM output
    output                  pwm
    );

   // PWM
   wire                     pwm_w;

   // another clock
   wire                     clk_fg;

   // FD
   wire                     clk_fq;

   // pos
   wire [PWM_LEN - 1 : 0]   pos_w;

   // state
   reg                      state_d, state_q = 0;


   // f d
   fq #(.CNT_LEN(FD_LEN)) u_fq
     ( .clk(clk),
       .rst(rst),
       .cnt_in(FD_F),
       .clk_out(clk_fq)
       );

   pwm #(.CNT_LEN(PWM_LEN), .CNT_MAX(PWM_MAX)) u_pwm
     ( .clk(clk_fq),
       .rst(rst),
       .cmp(pos_w),
       .pwm(pwm_w)
       );


   assign done = ~ state_q;
   assign pwm = pwm_w;
   assign pos_w = 0 | pos;



endmodule
