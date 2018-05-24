`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:31:32 05/24/2018
// Design Name:   servo
// Module Name:   A:/UDAR/hardware_description/test_bench/servo_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: servo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module servo_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] pos;

	// Outputs
	wire pwm;

	// Instantiate the Unit Under Test (UUT)
	servo uut (
		.clk(clk), 
		.rst(rst), 
		.pos(pos), 
		.pwm(pwm)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 0;
		pos = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst=0;
		
		// Test case 1
		pos = 128;
		#100000000
		
		// Test case 2
		pos = 5;
		#100000000
		
		// Test case 3
		pos = 100;
		#100000000
		
		// Test case 4
		pos = 150;
		#100000000
		
		// Test case 5
		pos = 200;
		#100000000
		
		// Test case 6
		pos = 250;
		#100000000
        
		pos = 0;

	end
	
	always begin
	 #10
	 clk = ~ clk;
	end
      
endmodule

