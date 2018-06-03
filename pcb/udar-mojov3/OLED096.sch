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
Sheet 5 5
Title "OLED"
Date "2018-06-03"
Rev "v0.1.0.15"
Comp "Johann Lee<me@qinka.pro>"
Comment1 "GPLv3"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L OLED D5
U 1 1 5AFE4AF2
P 8550 4250
F 0 "D5" H 8450 5950 60  0000 C CNN
F 1 "OLED" H 8500 4500 60  0000 C CNN
F 2 "OLED:OLED_096_12864_SSD1306" H 8450 5950 60  0001 C CNN
F 3 "" H 8450 5950 60  0001 C CNN
	1    8550 4250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR018
U 1 1 5AFE6EDC
P 7300 2650
F 0 "#PWR018" H 7300 2500 50  0001 C CNN
F 1 "+5V" H 7300 2790 50  0000 C CNN
F 2 "" H 7300 2650 50  0001 C CNN
F 3 "" H 7300 2650 50  0001 C CNN
	1    7300 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 5AFE6EF2
P 7300 2800
F 0 "#PWR019" H 7300 2550 50  0001 C CNN
F 1 "GND" H 7300 2650 50  0000 C CNN
F 2 "" H 7300 2800 50  0001 C CNN
F 3 "" H 7300 2800 50  0001 C CNN
	1    7300 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 2800 7300 2800
Wire Wire Line
	7600 2950 7500 2950
Wire Wire Line
	7500 2950 7500 2650
Wire Wire Line
	7500 2650 7300 2650
Text HLabel 7000 3100 0    60   Input ~ 0
CLK
Text HLabel 7000 3250 0    60   Input ~ 0
DATA
Text HLabel 7000 3400 0    60   Input ~ 0
RST
Text HLabel 7000 3550 0    60   Input ~ 0
DC
Text HLabel 7000 3700 0    60   Input ~ 0
CS
Wire Wire Line
	7600 3100 7000 3100
Wire Wire Line
	7000 3250 7600 3250
Wire Wire Line
	7600 3400 7000 3400
Wire Wire Line
	7000 3550 7600 3550
Wire Wire Line
	7600 3700 7000 3700
$EndSCHEMATC
