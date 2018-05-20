`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:09:05 05/20/2018
// Design Name:   fq
// Module Name:   A:/UDAR/hardware_description/test_bench/fq_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fq
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fq_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] cnt_in;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	fq uut (
		.clk(clk), 
		.rst(rst), 
		.cnt_in(cnt_in), 
		.clk_out(clk_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		cnt_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
        
		#400;
		
		cnt_in = 1;
        
		#400;
		
		cnt_in = 2;
		
		#800;
		
		cnt_in = 4;
		
		#1600;
		
	end
	
	always begin
		clk <= ~clk;
		#10;
	end
      
endmodule

