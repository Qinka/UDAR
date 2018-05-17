/**
 * This module is a part of UDAR under GPLv3
 * Copyright (C) 2018 Johann Lee
 *
 * Pulse Width Modulation
 */


// The pwn module
module pwm #(parameter CTR_LEN = 8)
   ( input clk,                       // clock signal
     input                   rst, // reset signal
     input [CTR_LEN - 1 : 0] cmp_reg, // the reigster of compare
     output                  pwm                       // output signal
     );

   // signal reg
   reg                       pwm_d, pwm_q;
   // counter
   reg [CTR_LEN - 1 : 0]     ctr_d, ctr_q;

   assign pwm = pwm_q;

   // compare
   always @(*) begin
      ctr_d = ctr_q + 1'b1;

      if (cmp_reg > ctr_q)
        pwm_d = 1'b1;
      else
        pwm_d = 1'b0;
   end

   // clock
   always @(posedge clk) begin
      if (rst)
        ctr_q <= 1'b0;
      else
        ctr_q <= ctr_d;

      pwm_q <= pwm_d;
   end

endmodule
