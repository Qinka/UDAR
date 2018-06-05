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
Sheet 3 5
Title "UART & ZigBee"
Date "2018-06-03"
Rev "v0.1.0.15"
Comp "Johann Lee<me@qinka.pro>"
Comment1 "GPLv3"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 9850 1800 2    60   Input ~ 0
UART_TX
Text HLabel 9850 1950 2    60   Input ~ 0
UART_RX
$Comp
L ZG-Mxx U2
U 1 1 5AF84409
P 3150 4800
F 0 "U2" H 3150 5500 60  0000 C CNN
F 1 "ZG-Mxx" H 3150 4200 60  0000 C CNN
F 2 "ZG-Mxx:ZG-Mxx_DIP_E" H 3200 4950 60  0001 C CNN
F 3 "" H 3200 4950 60  0001 C CNN
	1    3150 4800
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 5AF844C0
P 4350 5350
F 0 "D1" H 4350 5450 50  0000 C CNN
F 1 "LED" H 4350 5250 50  0000 C CNN
F 2 "LEDs:LED_0805" H 4350 5350 50  0001 C CNN
F 3 "" H 4350 5350 50  0001 C CNN
	1    4350 5350
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 5AF8451C
P 4050 5100
F 0 "R2" V 4130 5100 50  0000 C CNN
F 1 "R" V 4050 5100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3980 5100 50  0001 C CNN
F 3 "" H 4050 5100 50  0001 C CNN
	1    4050 5100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR03
U 1 1 5AF84554
P 2000 5450
F 0 "#PWR03" H 2000 5200 50  0001 C CNN
F 1 "GND" H 2000 5300 50  0000 C CNN
F 2 "" H 2000 5450 50  0001 C CNN
F 3 "" H 2000 5450 50  0001 C CNN
	1    2000 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4200 2000 4200
Wire Wire Line
	2000 4200 2000 5450
Wire Wire Line
	2500 4300 1950 4300
Wire Wire Line
	3750 5100 3900 5100
$Comp
L GND #PWR04
U 1 1 5AF8464F
P 4350 5650
F 0 "#PWR04" H 4350 5400 50  0001 C CNN
F 1 "GND" H 4350 5500 50  0000 C CNN
F 2 "" H 4350 5650 50  0001 C CNN
F 3 "" H 4350 5650 50  0001 C CNN
	1    4350 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 5100 4350 5100
Wire Wire Line
	4350 5100 4350 5200
Wire Wire Line
	4350 5500 4350 5650
Wire Wire Line
	7000 1800 9850 1800
Wire Wire Line
	7150 1950 9850 1950
Text Notes 6700 4550 2    60   ~ 0
TX
Text Notes 6700 4650 2    60   ~ 0
RX
Text Notes 6700 4750 2    60   ~ 0
GND
$Comp
L +3.3V #PWR05
U 1 1 5AF84923
P 1950 3950
F 0 "#PWR05" H 1950 3800 50  0001 C CNN
F 1 "+3.3V" H 1950 4090 50  0000 C CNN
F 2 "" H 1950 3950 50  0001 C CNN
F 3 "" H 1950 3950 50  0001 C CNN
	1    1950 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4300 1950 3950
$Comp
L R R1
U 1 1 5AF84980
P 3950 3650
F 0 "R1" V 4030 3650 50  0000 C CNN
F 1 "R" V 3950 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3880 3650 50  0001 C CNN
F 3 "" H 3950 3650 50  0001 C CNN
	1    3950 3650
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 5AF84A4F
P 3950 3400
F 0 "#PWR06" H 3950 3250 50  0001 C CNN
F 1 "+3.3V" H 3950 3540 50  0000 C CNN
F 2 "" H 3950 3400 50  0001 C CNN
F 3 "" H 3950 3400 50  0001 C CNN
	1    3950 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5AF84A6F
P 4650 4100
F 0 "#PWR07" H 4650 3850 50  0001 C CNN
F 1 "GND" H 4650 3950 50  0000 C CNN
F 2 "" H 4650 4100 50  0001 C CNN
F 3 "" H 4650 4100 50  0001 C CNN
	1    4650 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4100 4650 3900
Wire Wire Line
	3950 3800 3950 4200
Wire Wire Line
	3950 3900 4050 3900
Wire Wire Line
	3950 3500 3950 3400
Wire Wire Line
	3950 4200 3750 4200
Connection ~ 3950 3900
$Comp
L Q_PNP_BCE Q1
U 1 1 5AF84BBF
P 8450 2850
F 0 "Q1" H 8650 2900 50  0000 L CNN
F 1 "Q_PNP_BCE" H 8650 2800 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 8650 2950 50  0001 C CNN
F 3 "" H 8450 2850 50  0001 C CNN
	1    8450 2850
	1    0    0    1   
$EndComp
$Comp
L Q_PNP_BCE Q2
U 1 1 5AF84C1C
P 9600 3150
F 0 "Q2" H 9800 3200 50  0000 L CNN
F 1 "Q_PNP_BCE" H 9800 3100 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 9800 3250 50  0001 C CNN
F 3 "" H 9600 3150 50  0001 C CNN
	1    9600 3150
	1    0    0    1   
$EndComp
$Comp
L R R3
U 1 1 5AF84CAC
P 8050 2850
F 0 "R3" V 8130 2850 50  0000 C CNN
F 1 "R" V 8050 2850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 7980 2850 50  0001 C CNN
F 3 "" H 8050 2850 50  0001 C CNN
	1    8050 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 2850 7900 2850
Wire Wire Line
	8200 2850 8250 2850
$Comp
L R R5
U 1 1 5AF84DA2
P 9200 3150
F 0 "R5" V 9280 3150 50  0000 C CNN
F 1 "R" V 9200 3150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9130 3150 50  0001 C CNN
F 3 "" H 9200 3150 50  0001 C CNN
	1    9200 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 3150 9350 3150
Wire Wire Line
	7150 3150 9050 3150
$Comp
L R R4
U 1 1 5AF84E38
P 8550 3550
F 0 "R4" V 8630 3550 50  0000 C CNN
F 1 "R" V 8550 3550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 8480 3550 50  0001 C CNN
F 3 "" H 8550 3550 50  0001 C CNN
	1    8550 3550
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5AF84E67
P 9700 3550
F 0 "R6" V 9780 3550 50  0000 C CNN
F 1 "R" V 9700 3550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9630 3550 50  0001 C CNN
F 3 "" H 9700 3550 50  0001 C CNN
	1    9700 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3350 9700 3400
Wire Wire Line
	8550 3050 8550 3400
$Comp
L LED D2
U 1 1 5AF84F19
P 8550 3950
F 0 "D2" H 8550 4050 50  0000 C CNN
F 1 "LED" H 8550 3850 50  0000 C CNN
F 2 "LEDs:LED_0805" H 8550 3950 50  0001 C CNN
F 3 "" H 8550 3950 50  0001 C CNN
	1    8550 3950
	0    -1   -1   0   
$EndComp
$Comp
L LED D3
U 1 1 5AF84F91
P 9700 3950
F 0 "D3" H 9700 4050 50  0000 C CNN
F 1 "LED" H 9700 3850 50  0000 C CNN
F 2 "LEDs:LED_0805" H 9700 3950 50  0001 C CNN
F 3 "" H 9700 3950 50  0001 C CNN
	1    9700 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9700 3800 9700 3700
Wire Wire Line
	8550 3800 8550 3700
$Comp
L GND #PWR08
U 1 1 5AF85074
P 8550 4400
F 0 "#PWR08" H 8550 4150 50  0001 C CNN
F 1 "GND" H 8550 4250 50  0000 C CNN
F 2 "" H 8550 4400 50  0001 C CNN
F 3 "" H 8550 4400 50  0001 C CNN
	1    8550 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 4100 9700 4200
Wire Wire Line
	9700 4200 8550 4200
Wire Wire Line
	8550 4100 8550 4400
Connection ~ 8550 4200
$Comp
L +3.3V #PWR09
U 1 1 5AF85115
P 9700 2400
F 0 "#PWR09" H 9700 2250 50  0001 C CNN
F 1 "+3.3V" H 9700 2540 50  0000 C CNN
F 2 "" H 9700 2400 50  0001 C CNN
F 3 "" H 9700 2400 50  0001 C CNN
	1    9700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2400 9700 2950
Wire Wire Line
	8550 2650 8550 2500
Wire Wire Line
	8550 2500 9700 2500
Connection ~ 9700 2500
Wire Wire Line
	3750 4600 5850 4600
Wire Wire Line
	3750 4500 5850 4500
$Comp
L GND #PWR010
U 1 1 5AFA54FD
P 7000 5200
F 0 "#PWR010" H 7000 4950 50  0001 C CNN
F 1 "GND" H 7000 5050 50  0000 C CNN
F 2 "" H 7000 5200 50  0001 C CNN
F 3 "" H 7000 5200 50  0001 C CNN
	1    7000 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4700 7000 4700
Wire Wire Line
	7000 4700 7000 5200
Wire Wire Line
	7000 4500 6350 4500
Wire Wire Line
	7000 1800 7000 4500
Wire Wire Line
	7150 4600 6350 4600
Wire Wire Line
	7150 1950 7150 4600
Connection ~ 7150 3150
Connection ~ 7000 2850
NoConn ~ 5850 4700
NoConn ~ 2500 5300
NoConn ~ 2500 5200
NoConn ~ 2500 5100
NoConn ~ 2500 4800
NoConn ~ 2500 4700
NoConn ~ 2500 4600
NoConn ~ 2500 4400
NoConn ~ 3750 4300
NoConn ~ 3750 4400
NoConn ~ 3750 4700
NoConn ~ 3750 4800
NoConn ~ 3750 4900
NoConn ~ 3750 5000
NoConn ~ 3750 5200
NoConn ~ 3750 5300
NoConn ~ 2500 4500
$Comp
L SW_Push SW1
U 1 1 5AFA7327
P 4250 3900
F 0 "SW1" H 4300 4000 50  0000 L CNN
F 1 "SW_Push" H 4250 3840 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 4250 4100 50  0001 C CNN
F 3 "" H 4250 4100 50  0001 C CNN
	1    4250 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3900 4450 3900
$Comp
L Conn_02x03_Odd_Even J1
U 1 1 5AFA7E4C
P 6050 4600
F 0 "J1" H 6100 4800 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 6100 4400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 6050 4600 50  0001 C CNN
F 3 "" H 6050 4600 50  0001 C CNN
	1    6050 4600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
