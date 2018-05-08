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
Sheet 2 3
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
L HC-SR04 U?
U 1 1 5ACAB760
P 3050 2300
F 0 "U?" H 3050 2100 60  0000 C CNN
F 1 "HC-SR04" H 3050 3000 60  0000 C CNN
F 2 "" H 3150 2400 60  0001 C CNN
F 3 "" H 3150 2400 60  0001 C CNN
	1    3050 2300
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5ACAB856
P 3800 1800
F 0 "#PWR?" H 3800 1650 50  0001 C CNN
F 1 "VCC" H 3800 1950 50  0000 C CNN
F 2 "" H 3800 1800 50  0001 C CNN
F 3 "" H 3800 1800 50  0001 C CNN
	1    3800 1800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5ACAB86C
P 3800 2950
F 0 "#PWR?" H 3800 2700 50  0001 C CNN
F 1 "GND" H 3800 2800 50  0000 C CNN
F 2 "" H 3800 2950 50  0001 C CNN
F 3 "" H 3800 2950 50  0001 C CNN
	1    3800 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2400 3200 2600
Wire Wire Line
	3000 2400 3000 2800
Wire Wire Line
	3000 2800 2950 2800
$Comp
L SW_Push SW?
U 1 1 5ACAB8FB
P 6200 2050
F 0 "SW?" H 6250 2150 50  0000 L CNN
F 1 "SW_Push" H 6200 1990 50  0000 C CNN
F 2 "" H 6200 2250 50  0001 C CNN
F 3 "" H 6200 2250 50  0001 C CNN
	1    6200 2050
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5ACAB948
P 6550 1800
F 0 "R?" V 6630 1800 50  0000 C CNN
F 1 "R" V 6550 1800 50  0000 C CNN
F 2 "" V 6480 1800 50  0001 C CNN
F 3 "" H 6550 1800 50  0001 C CNN
	1    6550 1800
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5ACAB97F
P 6200 2300
F 0 "C?" H 6225 2400 50  0000 L CNN
F 1 "C" H 6225 2200 50  0000 L CNN
F 2 "" H 6238 2150 50  0001 C CNN
F 3 "" H 6200 2300 50  0001 C CNN
	1    6200 2300
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5ACABA30
P 5750 2400
F 0 "#PWR?" H 5750 2150 50  0001 C CNN
F 1 "GND" H 5750 2250 50  0000 C CNN
F 2 "" H 5750 2400 50  0001 C CNN
F 3 "" H 5750 2400 50  0001 C CNN
	1    5750 2400
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5ACABA4C
P 6550 1550
F 0 "#PWR?" H 6550 1400 50  0001 C CNN
F 1 "VCC" H 6550 1700 50  0000 C CNN
F 2 "" H 6550 1550 50  0001 C CNN
F 3 "" H 6550 1550 50  0001 C CNN
	1    6550 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2050 6700 2050
Wire Wire Line
	6550 1950 6550 2300
Connection ~ 6550 2050
Wire Wire Line
	6000 2050 5750 2050
Wire Wire Line
	5750 2050 5750 2400
Wire Wire Line
	6550 2300 6350 2300
Wire Wire Line
	6050 2300 5750 2300
Connection ~ 5750 2300
Wire Wire Line
	6550 1650 6550 1550
Wire Wire Line
	2950 2950 3100 2950
Wire Wire Line
	3100 2950 3100 2400
Wire Wire Line
	3200 2600 3800 2600
Wire Wire Line
	3800 2600 3800 2950
Wire Wire Line
	2900 2400 3800 2400
Wire Wire Line
	3800 2400 3800 1800
Text HLabel 2950 2800 0    60   Input ~ 0
URM-Trig
Text HLabel 2950 2950 0    60   Input ~ 0
URM-Echo
Text HLabel 6700 2050 2    60   Input ~ 0
URM-Trig
$EndSCHEMATC
