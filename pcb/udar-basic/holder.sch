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
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Servo U?
U 1 1 5ACABDC8
P 4200 1800
F 0 "U?" H 4200 1500 60  0000 C CNN
F 1 "Servo" H 4200 2100 60  0000 C CNN
F 2 "" H 4250 1700 60  0001 C CNN
F 3 "" H 4250 1700 60  0001 C CNN
	1    4200 1800
	1    0    0    -1  
$EndComp
$Comp
L Servo U?
U 1 1 5ACABE15
P 4200 2650
F 0 "U?" H 4200 2350 60  0000 C CNN
F 1 "Servo" H 4200 2950 60  0000 C CNN
F 2 "" H 4250 2550 60  0001 C CNN
F 3 "" H 4250 2550 60  0001 C CNN
	1    4200 2650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5ACABE72
P 3200 1600
F 0 "#PWR?" H 3200 1450 50  0001 C CNN
F 1 "VCC" H 3200 1750 50  0000 C CNN
F 2 "" H 3200 1600 50  0001 C CNN
F 3 "" H 3200 1600 50  0001 C CNN
	1    3200 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5ACABE8A
P 3500 2950
F 0 "#PWR?" H 3500 2700 50  0001 C CNN
F 1 "GND" H 3500 2800 50  0000 C CNN
F 2 "" H 3500 2950 50  0001 C CNN
F 3 "" H 3500 2950 50  0001 C CNN
	1    3500 2950
	1    0    0    -1  
$EndComp
Text HLabel 4700 3050 2    60   Input ~ 0
Servo-X
Text HLabel 4700 3250 2    60   Input ~ 0
Servo-Y
Wire Wire Line
	4700 3050 3800 3050
Wire Wire Line
	3800 3050 3800 2800
Wire Wire Line
	4700 3250 3700 3250
Wire Wire Line
	3700 3250 3700 1950
Wire Wire Line
	3700 1950 3800 1950
Wire Wire Line
	3200 1800 3800 1800
Wire Wire Line
	3200 1600 3200 2650
Wire Wire Line
	3200 2650 3800 2650
Connection ~ 3200 1800
Wire Wire Line
	3500 2950 3500 1650
Wire Wire Line
	3500 1650 3800 1650
Wire Wire Line
	3800 2500 3500 2500
Connection ~ 3500 2500
$EndSCHEMATC
