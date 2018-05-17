`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:02:33 05/17/2018
// Design Name:   capture
// Module Name:   A:/UDAR/hardware_description/test_bench/capture_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: capture
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module capture_tb;

	// Inputs
	reg cap_signal;
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] cnt;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	capture uut (
		.cap_signal(cap_signal), 
		.clk(clk), 
		.rst(rst),
		.cnt(cnt), 
		.done(done)
	);

	initial begin
		// Initialize Inputs
		cap_signal = 0;
		clk = 0;
		rst = 1;
		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
        
		// case 1
		cap_signal <= 1;
		#1210
		cap_signal <= 0;
		#100
		
		// case 2
		cap_signal <= 1;
		#2550
		cap_signal <= 0;
		#100
		
		// case 3
		cap_signal <= 1;
		#2570
		cap_signal <= 0;
		#100
		
		// case 4
		cap_signal <= 1;
		#100
		rst <= 1;
		#100
		rst <= 0;
		#340
		cap_signal <= 0;
		
	end
	
	always begin
		#5
		clk = 0;
		#5
		clk = 1;
	end
      
endmodule

