`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:52:24 05/24/2018
// Design Name:   timeout
// Module Name:   A:/UDAR/hardware_description/test_bench/timeout_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: timeout
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module timeout_tb;

	// Inputs
	reg rst;
	reg clk;
	reg [7:0] timeout;
	reg enable;

	// Outputs
	wire done;

	// Instantiate the Unit Under Test (UUT)
	timeout uut (
		.rst(rst), 
		.clk(clk), 
		.timeout(timeout), 
		.enable(enable), 
		.done(done)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		timeout = 0;
		enable = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		
		// Test case 1
		timeout = 128;
		enable = 1;
		#20;
		enable = 0;
		#2000;
		
		// Test case 2
		timeout = 63;
		enable = 1;
		#20;
		enable = 0;
		#2000;
        
		// Test case 3
		timeout = 255;
		enable = 1;
		#20;
		enable = 0;
		#2000;

	end
	
	always begin
		#5
		clk = ~ clk;
	end
      
endmodule

