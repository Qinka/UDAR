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

module hcsr04 #(parameter CAP_LEN=8, TIMEOUT=128, CNT_LEN=8)
   (
    // Clock
    input                    clk,
    // Reset
    input                    rst,
    // Signal
    input                    sig,
    // Enable
    input                    en,
    // Length
    output [CAP_LEN - 1 : 0] len,
    // Done
    output                   done
    );


   localparam STATE_LEN = 2;
   localparam
     READY = 0,
     TRIG = 1,
     IN = 2;

   // Status
   reg [STATE_LEN - 1 : 0]   state_d, state_q = 0;

   trig uut_trig 
     ( 
      );
   
