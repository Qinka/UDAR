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
Sheet 2 5
Title "Ultrasonic range finder"
Date "2018-06-03"
Rev "v0.1.0.15"
Comp "Johann Lee<me@qinka.pro>"
Comment1 "GPLv3"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Motor_Servo_AirTronics M1
U 1 1 5AF6EF76
P 6550 3950
F 0 "M1" H 6350 4125 50  0000 L CNN
F 1 "Motor_Servo_AirTronics" H 6350 3790 50  0000 L TNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6550 3760 50  0001 C CNN
F 3 "" H 6550 3760 50  0001 C CNN
	1    6550 3950
	1    0    0    -1  
$EndComp
$Comp
L Motor_Servo_AirTronics M2
U 1 1 5AF6EFE4
P 6550 4500
F 0 "M2" H 6350 4675 50  0000 L CNN
F 1 "Motor_Servo_AirTronics" H 6350 4340 50  0000 L TNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6550 4310 50  0001 C CNN
F 3 "" H 6550 4310 50  0001 C CNN
	1    6550 4500
	1    0    0    -1  
$EndComp
$Comp
L HC-SR04 U1
U 1 1 5AF6F011
P 5500 3450
F 0 "U1" H 5500 3250 60  0000 C CNN
F 1 "HC-SR04" H 5500 4150 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 5600 3550 60  0001 C CNN
F 3 "" H 5600 3550 60  0001 C CNN
	1    5500 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3550 5650 4750
Wire Wire Line
	5650 4750 4500 4750
Wire Wire Line
	4500 4750 4500 5100
Wire Wire Line
	6250 4600 5650 4600
Connection ~ 5650 4600
Wire Wire Line
	6250 4050 5650 4050
Connection ~ 5650 4050
Wire Wire Line
	6250 4500 4500 4500
Wire Wire Line
	4500 4500 4500 2700
Wire Wire Line
	6250 3950 4500 3950
Connection ~ 4500 3950
Wire Wire Line
	5350 3550 4500 3550
Connection ~ 4500 3550
$Comp
L +5V #PWR01
U 1 1 5AF6F4B7
P 4500 2700
F 0 "#PWR01" H 4500 2550 50  0001 C CNN
F 1 "+5V" H 4500 2840 50  0000 C CNN
F 2 "" H 4500 2700 50  0001 C CNN
F 3 "" H 4500 2700 50  0001 C CNN
	1    4500 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5AF6F4D1
P 4500 5100
F 0 "#PWR02" H 4500 4850 50  0001 C CNN
F 1 "GND" H 4500 4950 50  0000 C CNN
F 2 "" H 4500 5100 50  0001 C CNN
F 3 "" H 4500 5100 50  0001 C CNN
	1    4500 5100
	1    0    0    -1  
$EndComp
Text HLabel 6100 3850 0    60   Input ~ 0
PWM1
Text HLabel 6100 4400 0    60   Input ~ 0
PWM2
Text HLabel 5800 3600 2    60   Input ~ 0
Echo
Text HLabel 5800 3700 2    60   Input ~ 0
Trig
Wire Wire Line
	5800 3600 5550 3600
Wire Wire Line
	5550 3600 5550 3550
Wire Wire Line
	5800 3700 5450 3700
Wire Wire Line
	5450 3700 5450 3550
Wire Wire Line
	6250 3850 6100 3850
Wire Wire Line
	6250 4400 6100 4400
$EndSCHEMATC
