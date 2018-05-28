module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy, // AVR Rx buffer full
	 
	 //  ----- for UDAR  -----
	 // serial
	 input  udar_rx,
	 output udar_tx,
	 // pwm
	 output udar_pwm_1,
	 output udar_pwm_2,
	 // ultrasonic
	 input  udar_len,
	 output udar_trig
    );

wire rst = ~rst_n; // make reset active high

// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;

assign led = 8'b0;

// UDAR

// udar tx
wire u_tx;
assign udar_tx = u_tx;
// pwm
wire u_pwm_1;
wire u_pwm_2;
assign udar_pwm_1 = u_pwm_1;
assign udar_pwm_2 = u_pwm_2;
// ultrasonic
wire u_trig;
assign udar_trig = u_trig;

ctrl u (
	.clk(clk),
	.rst_i(rst),
	.ser_rx(udar_rx),
	.ser_tx(u_tx),
	.servo1(u_pwm_1),
	.servo2(u_pwm_2),
	.cap_sig(udar_len),
	.trig(u_trig)
	);

endmodule