`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:07:54 05/27/2018
// Design Name:   ctrl
// Module Name:   A:/UDAR/hardware_description/test_bench/ctrl_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ctrl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ctrl_tb;

	// Inputs
	reg clk;
	reg rst_i;
	reg rx;
	reg cap_sig;

	// Outputs
	wire tx;
	wire servo1;
	wire servo2;
	wire trig;

	// Instantiate the Unit Under Test (UUT)
	ctrl uut (
		.clk(clk), 
		.rst_i(rst_i), 
		.ser_rx(rx), 
		.ser_tx(tx), 
		.servo1(servo1), 
		.servo2(servo2), 
		.cap_sig(cap_sig), 
		.trig(trig)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_i = 1;
		rx = 1;
		cap_sig = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_i =0;
		
		#10000;
		
		// send 0b0000_1111
		rx = 0; // start bit
		#1000;
		rx = 0;
		#1000;
		rx = 0;
		#1000;
		rx = 0;
		#1000;
		rx = 0;
		#1000;
		rx = 1;
		#1000;
		rx = 1;
		#1000;
		rx = 1;
		#1000;
		rx = 1;
		#1000;
		rx = 1; // end bit
		#1000;
		
		// send 150 (x)
		rx = 0; // start bit
		#1000;
		rx = 0;
		#1000;
		rx = 1;
		#1000;
		rx = 1;
		#1000;
		rx = 0;
		#1000;
		rx = 1;
		#1000;
		rx = 0;
		#1000;
		rx = 0;
		#1000;
		rx = 1;
		#1000;
		rx = 1; // end bit
		#1000;
		
		// send 150 (y)
		rx = 0; // start bit
		#1000;
		rx = 0;
		#1000;
		rx = 1;
		#1000;
		rx = 1;
		#1000;
		rx = 0;
		#1000;
		rx = 1;
		#1000;
		rx = 0;
		#1000;
		rx = 0;
		#1000;
		rx = 1;
		#1000;
		rx = 1; // end bit
		#1000;
		
		#11000; // for trig
		cap_sig = 1;
		#5800000;
		cap_sig = 0;
		

	end
      
	always begin
		#10;
		clk = ~ clk;
	end
		
endmodule

