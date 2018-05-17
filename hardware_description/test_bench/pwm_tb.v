`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:25:00 05/17/2018
// Design Name:   pwm
// Module Name:   A:/UDAR/hardware_description/test_bench/pwm_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pwm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pwm_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] cmp_reg;

	// Outputs
	wire pwm;

	// Instantiate the Unit Under Test (UUT)
	pwm uut (
		.clk(clk), 
		.rst(rst), 
		.cmp_reg(cmp_reg), 
		.pwm(pwm)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		cmp_reg = 1;
		#100
		rst = 0;

		// Wait 100 ns for global reset to finish
		#300000;
		
	end
	
	always begin
		#5
		clk = 0;
		#5
		clk = 1;
	end
	
	always begin
      # 20000
		cmp_reg = cmp_reg + 1'b1;
	end
	
endmodule

