EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:1602a
LIBS:hc-sr04
LIBS:mojov3
LIBS:zg-mxx
LIBS:oled
LIBS:udar-mojov3-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "Architecture"
Date "2018-06-03"
Rev "v0.1.0.15"
Comp "Johann Lee<me@qinka.pro>"
Comment1 "GPLv3"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5650 3700 700  1150
U 5AF6EEAA
F0 "UDAR" 60
F1 "UDAR.sch" 60
F2 "PWM1" I L 5650 3950 60 
F3 "PWM2" I L 5650 4100 60 
F4 "Echo" I L 5650 4350 60 
F5 "Trig" I L 5650 4500 60 
$EndSheet
$Sheet
S 2400 4300 1250 1250
U 5AF825C7
F0 "UART" 60
F1 "UART.sch" 60
F2 "UART_TX" I R 3650 4500 60 
F3 "UART_RX" I R 3650 4650 60 
$EndSheet
Wire Wire Line
	3650 3750 3800 3750
Wire Wire Line
	3800 3750 3800 4500
Wire Wire Line
	3800 4500 3650 4500
Wire Wire Line
	3650 4650 3950 4650
Wire Wire Line
	3950 4650 3950 3650
Wire Wire Line
	3950 3650 3650 3650
Wire Wire Line
	3650 3100 4800 3100
Wire Wire Line
	4800 3100 4800 3950
Wire Wire Line
	4800 3950 5650 3950
Wire Wire Line
	5650 4100 4700 4100
Wire Wire Line
	4700 4100 4700 3200
Wire Wire Line
	4700 3200 3650 3200
Wire Wire Line
	3650 3350 4600 3350
Wire Wire Line
	4600 3350 4600 4350
Wire Wire Line
	4600 4350 5650 4350
Wire Wire Line
	5650 4500 4500 4500
Wire Wire Line
	4500 4500 4500 3450
Wire Wire Line
	4500 3450 3650 3450
$Sheet
S 2550 1550 1100 2450
U 5AF6ECAE
F0 "UDAR-board" 60
F1 "UDAR-board.sch" 60
F2 "PWM1" I R 3650 3100 60 
F3 "PWM2" I R 3650 3200 60 
F4 "Echo" I R 3650 3350 60 
F5 "Trig" I R 3650 3450 60 
F6 "UART_RX" I R 3650 3650 60 
F7 "UART_TX" I R 3650 3750 60 
F8 "CLK" I R 3650 2050 60 
F9 "DATA" I R 3650 2150 60 
F10 "RST" I R 3650 2350 60 
F11 "DC" I R 3650 2450 60 
F12 "CS" I R 3650 2550 60 
$EndSheet
$Sheet
S 5800 1750 550  1350
U 5AFE4A0B
F0 "0.96 OLED" 60
F1 "OLED096.sch" 60
F2 "CLK" I L 5800 2050 60 
F3 "DATA" I L 5800 2200 60 
F4 "RST" I L 5800 2500 60 
F5 "DC" I L 5800 2650 60 
F6 "CS" I L 5800 2800 60 
$EndSheet
Wire Wire Line
	5800 2050 3650 2050
Wire Wire Line
	3650 2150 5650 2150
Wire Wire Line
	5650 2150 5650 2200
Wire Wire Line
	5650 2200 5800 2200
Wire Wire Line
	3650 2350 5650 2350
Wire Wire Line
	5650 2350 5650 2500
Wire Wire Line
	5650 2500 5800 2500
Wire Wire Line
	3650 2450 5550 2450
Wire Wire Line
	5550 2450 5550 2650
Wire Wire Line
	5550 2650 5800 2650
Wire Wire Line
	5800 2800 5450 2800
Wire Wire Line
	5450 2800 5450 2550
Wire Wire Line
	5450 2550 3650 2550
$EndSCHEMATC
