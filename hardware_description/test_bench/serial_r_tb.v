`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:26:07 05/26/2018
// Design Name:   serial_r
// Module Name:   A:/UDAR/hardware_description/test_bench/serial_r_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: serial_r
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module serial_r_tb;

	// Inputs
	reg clk;
	reg rst;
	reg rx;

	// Outputs
	wire [7:0] data;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	serial_r uut (
		.clk(clk), 
		.rst(rst), 
		.rx(rx), 
		.data(data), 
		.done(done)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		rx = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		#100
		
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
        
		// Add stimulus here

	end
	
	always begin
		#10;
		clk = ~ clk;
	end
      
endmodule

