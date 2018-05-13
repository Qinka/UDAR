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
LIBS:udar-mojov3-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
L Motor_Servo_AirTronics M1
U 1 1 5AF6EF76
P 6850 2700
F 0 "M1" H 6650 2875 50  0000 L CNN
F 1 "Motor_Servo_AirTronics" H 6650 2540 50  0000 L TNN
F 2 "" H 6850 2510 50  0001 C CNN
F 3 "" H 6850 2510 50  0001 C CNN
	1    6850 2700
	1    0    0    -1  
$EndComp
$Comp
L Motor_Servo_AirTronics M2
U 1 1 5AF6EFE4
P 6850 3250
F 0 "M2" H 6650 3425 50  0000 L CNN
F 1 "Motor_Servo_AirTronics" H 6650 3090 50  0000 L TNN
F 2 "" H 6850 3060 50  0001 C CNN
F 3 "" H 6850 3060 50  0001 C CNN
	1    6850 3250
	1    0    0    -1  
$EndComp
$Comp
L HC-SR04 U1
U 1 1 5AF6F011
P 5800 2200
F 0 "U1" H 5800 2000 60  0000 C CNN
F 1 "HC-SR04" H 5800 2900 60  0000 C CNN
F 2 "" H 5900 2300 60  0001 C CNN
F 3 "" H 5900 2300 60  0001 C CNN
	1    5800 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2300 5950 3500
Wire Wire Line
	5950 3500 4800 3500
Wire Wire Line
	4800 3500 4800 3850
Wire Wire Line
	6550 3350 5950 3350
Connection ~ 5950 3350
Wire Wire Line
	6550 2800 5950 2800
Connection ~ 5950 2800
Wire Wire Line
	6550 3250 4800 3250
Wire Wire Line
	4800 3250 4800 1450
Wire Wire Line
	6550 2700 4800 2700
Connection ~ 4800 2700
Wire Wire Line
	5650 2300 4800 2300
Connection ~ 4800 2300
$Comp
L +5V #PWR03
U 1 1 5AF6F4B7
P 4800 1450
F 0 "#PWR03" H 4800 1300 50  0001 C CNN
F 1 "+5V" H 4800 1590 50  0000 C CNN
F 2 "" H 4800 1450 50  0001 C CNN
F 3 "" H 4800 1450 50  0001 C CNN
	1    4800 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5AF6F4D1
P 4800 3850
F 0 "#PWR04" H 4800 3600 50  0001 C CNN
F 1 "GND" H 4800 3700 50  0000 C CNN
F 2 "" H 4800 3850 50  0001 C CNN
F 3 "" H 4800 3850 50  0001 C CNN
	1    4800 3850
	1    0    0    -1  
$EndComp
Text HLabel 6400 2600 0    60   Input ~ 0
PWM1
Text HLabel 6400 3150 0    60   Input ~ 0
PWM2
Text HLabel 6100 2350 2    60   Input ~ 0
Echo
Text HLabel 6100 2450 2    60   Input ~ 0
Trig
Wire Wire Line
	6100 2350 5850 2350
Wire Wire Line
	5850 2350 5850 2300
Wire Wire Line
	6100 2450 5750 2450
Wire Wire Line
	5750 2450 5750 2300
Wire Wire Line
	6550 2600 6400 2600
Wire Wire Line
	6550 3150 6400 3150
$EndSCHEMATC
