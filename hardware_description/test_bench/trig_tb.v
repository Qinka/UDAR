`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:17:43 05/18/2018
// Design Name:   trig
// Module Name:   A:/UDAR/hardware_description/test_bench/trig_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: trig
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module trig_tb;

	// Inputs
	reg clk;
	reg rst;
	reg enable;
	reg [7:0] timeout;

	// Outputs
	wire ready;
	wire sig;

	// Instantiate the Unit Under Test (UUT)
	trig uut (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.timeout(timeout), 
		.ready(ready), 
		.sig(sig)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		enable = 0;
		timeout = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst = 0;
		
		timeout = 50;		
		#10
		enable = 1;
		#20
		enable = 0;

		// Wait 700ns
		#900
		
		
		timeout = 255;		
		#10
		enable = 1;
		#20
		enable = 0;
		
		// Wait 2600ns
		#3000
		
		timeout = 255;		
		#10
		enable = 1;
		#20
		enable = 0;
		
		#1000
		rst = 1;
		#100
		rst = 0;
		
		timeout = 50;		
		#10
		enable = 1;
		#20
		enable = 0;
	
        
		// Add stimulus here

	end
      
		always begin
			#5 
			clk = 1;
			#5
			clk = 0;
		end
endmodule

