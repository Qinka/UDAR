`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:36:31 05/21/2018
// Design Name:   hcsr04
// Module Name:   A:/UDAR/hardware_description/test_bench/hcsr04_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hcsr04
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hcsr04_tb;

	// Inputs
	reg clk50M;
	reg rst;
	reg en;
	reg sig_len;

	// Outputs
	wire sig_trig;
	wire [15:0] len;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	hcsr04 uut (
		.clk50M(clk50M), 
		.rst(rst), 
		.en(en), 
		.sig_len(sig_len), 
		.sig_trig(sig_trig), 
		.len(len), 
		.done(done)
	);

	initial begin
		// Initialize Inputs
		clk50M = 0;
		rst = 1;
		en = 0;
		sig_len = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst=0;
		
		// Enable test 1
		#100;
		en = 1;
		#40;
		en = 0;
		#100;
		sig_len = 1;
		#5800000;
		sig_len = 0;
		#200;
		  
		#400000;
		  
		// Enable test 2
		#100;
		en = 1;
		#40;
		en = 0;
		#100;
		sig_len = 1;
		#1344000;
		sig_len = 0;
		#200;
		  
		#400000;
		  
		// Enable test 3
		#100;
		en = 1;
		#40;
		en = 0;
		#30000;
		sig_len = 1;
		#2334000;
		sig_len = 0;
		#200;
		  
		#400000;
		  
		// Enable test 4
		#100;
		en = 1;
		#40;
		en = 0;
		#10000;
		sig_len = 1;
		#999000;
		sig_len = 0;
		#200;
		
		
		// Add stimulus here

	end
	
	always begin
		clk50M = ~ clk50M;
		#10;
	end
      
endmodule

