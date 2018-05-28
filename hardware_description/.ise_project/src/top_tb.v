`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:30:55 05/28/2018
// Design Name:   mojo_top
// Module Name:   A:/UDAR/hardware_description/.ise_project/src/top_tb.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mojo_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg clk;
	reg rst_n;
	reg rst_i;
	reg cclk;
	reg spi_ss;
	reg spi_mosi;
	reg spi_sck;
	reg avr_tx;
	reg avr_rx_busy;
	reg rx;
	reg cap_sig;
	
	assign rst_n = ~ rst_i;

	// Outputs
	wire [7:0] led;
	wire spi_miso;
	wire [3:0] spi_channel;
	wire avr_rx;
	wire udar_tx;
	
	wire tx;
	wire servo1;
	wire servo2;
	wire trig;

	// Instantiate the Unit Under Test (UUT)
	mojo_top uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.cclk(cclk), 
		.led(led), 
		.spi_miso(spi_miso), 
		.spi_ss(spi_ss), 
		.spi_mosi(spi_mosi), 
		.spi_sck(spi_sck), 
		.spi_channel(spi_channel), 
		.avr_tx(avr_tx), 
		.avr_rx(avr_rx), 
		.avr_rx_busy(avr_rx_busy), 
		.udar_rx(rx), 
		.udar_tx(tx), 
		.udar_pwm_1(servo1), 
		.udar_pwm_2(servo2), 
		.udar_len(cap_sig), 
		.udar_trig(trig)
	);

	initial begin
		// Initialize Inputs// Initialize Inputs
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

