`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:26:19 05/27/2018
// Design Name:   serial_t
// Module Name:   A:/UDAR/hardware_description/test_bench/serial_t_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: serial_t
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module serial_t_tb;

	// Inputs
	reg clk;
	reg rst;
	reg block;
	reg [7:0] data;
	reg send;

	// Outputs
	wire tx;
	wire busy;

	// Instantiate the Unit Under Test (UUT)
	serial_t uut (
		.clk(clk), 
		.rst(rst), 
		.tx(tx), 
		.block(block), 
		.busy(busy), 
		.data(data), 
		.send(send)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		block = 0;
		data = 0;
		send = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst = 0;
		#100
		
		data = 8'b10101010;
		send = 1;
		#20;
		send = 0;
		
		
		
		  
		// Add stimulus here

	end
	
	always begin
		#10
		clk = ~clk;
	end
      
endmodule

