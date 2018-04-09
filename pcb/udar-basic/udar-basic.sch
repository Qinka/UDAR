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
LIBS:hc-sr04
LIBS:servo
LIBS:stm32
LIBS:udar-basic-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 3
Title ""
Date "2018-04-09"
Rev "Version 0.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2700 2050 750  750 
U 5ACAB57B
F0 "Ultrasonic ranging module" 60
F1 "URM.sch" 60
F2 "URM-Trig" I R 3450 2150 60 
F3 "URM-Echo" I R 3450 2300 60 
$EndSheet
$Sheet
S 2650 3200 800  750 
U 5ACABD6D
F0 "Holder" 60
F1 "holder.sch" 60
F2 "Servo-X" I R 3450 3400 60 
F3 "Servo-Y" I R 3450 3550 60 
$EndSheet
$Comp
L STM32F103Z(C-D-E)Tx U?
U 1 1 5ACAC3AA
P 10300 4950
F 0 "U?" H 10300 5050 50  0000 C CNN
F 1 "STM32F103Z(C-D-E)Tx" H 10300 4850 50  0000 C CNN
F 2 "LQFP144" H 10300 4750 50  0000 C CIN
F 3 "" H 10300 4950 50  0000 C CNN
	1    10300 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 1850 15350 1850
Wire Wire Line
	15350 1850 15350 600 
Wire Wire Line
	15350 600  4650 600 
Wire Wire Line
	4650 600  4650 2300
Wire Wire Line
	4650 2300 3450 2300
Wire Wire Line
	14900 1750 15250 1750
Wire Wire Line
	15250 1750 15250 700 
Wire Wire Line
	15250 700  4800 700 
Wire Wire Line
	4800 700  4800 2150
Wire Wire Line
	4800 2150 3450 2150
$EndSCHEMATC
