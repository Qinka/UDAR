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
Sheet 5 5
Title ""
Date "2018-05-15"
Rev "v0.1.0.12"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Mojov3 U3
U 1 1 5AF8219A
P 5800 4050
F 0 "U3" H 5800 4700 60  0000 C CNN
F 1 "Mojov3" H 5800 2800 60  0000 C CNN
F 2 "mojov3:mojov3" H 7300 2500 60  0001 C CNN
F 3 "" H 7300 2500 60  0001 C CNN
	1    5800 4050
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 5AF821C0
P 3200 4600
F 0 "D4" H 3200 4700 50  0000 C CNN
F 1 "LED" H 3200 4500 50  0000 C CNN
F 2 "LEDs:LED_0805" H 3200 4600 50  0001 C CNN
F 3 "" H 3200 4600 50  0001 C CNN
	1    3200 4600
	1    0    0    -1  
$EndComp
Text Notes 3050 4850 0    60   ~ 0
STATUS
Text HLabel 3400 1900 0    60   Input ~ 0
PWM1
Text HLabel 3400 2000 0    60   Input ~ 0
PWM2
Text HLabel 3400 2150 0    60   Input ~ 0
Echo
Text HLabel 3400 2250 0    60   Input ~ 0
Trig
Text Notes 3200 2400 0    60   ~ 0
UDAR
Wire Notes Line
	3550 1800 3550 2500
Wire Notes Line
	3550 2500 3000 2500
Wire Notes Line
	3000 2500 3000 1800
Wire Notes Line
	3000 1800 3550 1800
Text HLabel 7950 3600 2    60   Input ~ 0
E
Text HLabel 7950 3700 2    60   Input ~ 0
R/W
Text HLabel 7950 3800 2    60   Input ~ 0
RS
Text HLabel 7950 3500 2    60   Input ~ 0
D0
Text HLabel 7950 3400 2    60   Input ~ 0
D1
Text HLabel 7950 3300 2    60   Input ~ 0
D2
Text HLabel 7950 3200 2    60   Input ~ 0
D3
Text HLabel 7950 3100 2    60   Input ~ 0
D4
Text HLabel 7950 3000 2    60   Input ~ 0
D5
Text HLabel 7950 2900 2    60   Input ~ 0
D6
Text HLabel 7950 2800 2    60   Input ~ 0
D7
Text Notes 8200 3950 2    60   ~ 0
1602A
Wire Notes Line
	7850 2700 7850 4000
Wire Notes Line
	7850 4000 8500 4000
Wire Notes Line
	8500 4000 8500 2700
Wire Notes Line
	8500 2700 7850 2700
Text HLabel 7950 4300 2    60   Input ~ 0
UART_RX
Text HLabel 7950 4500 2    60   Input ~ 0
UART_TX
Text Notes 8150 4650 2    60   ~ 0
UART
Wire Notes Line
	7850 4700 8650 4700
Wire Notes Line
	8650 4200 7850 4200
$Comp
L R R11
U 1 1 5AFA64DB
P 2800 4850
F 0 "R11" V 2880 4850 50  0000 C CNN
F 1 "R" V 2800 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2730 4850 50  0001 C CNN
F 3 "" H 2800 4850 50  0001 C CNN
	1    2800 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 5AFA650A
P 2800 5200
F 0 "#PWR013" H 2800 4950 50  0001 C CNN
F 1 "GND" H 2800 5050 50  0000 C CNN
F 2 "" H 2800 5200 50  0001 C CNN
F 3 "" H 2800 5200 50  0001 C CNN
	1    2800 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4600 3350 4600
Wire Wire Line
	3050 4600 2800 4600
Wire Wire Line
	2800 4600 2800 4700
Wire Wire Line
	2800 5000 2800 5200
$Comp
L +3.3V #PWR014
U 1 1 5AFA655B
P 6350 5700
F 0 "#PWR014" H 6350 5550 50  0001 C CNN
F 1 "+3.3V" H 6350 5840 50  0000 C CNN
F 2 "" H 6350 5700 50  0001 C CNN
F 3 "" H 6350 5700 50  0001 C CNN
	1    6350 5700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 5AFA6575
P 6100 5700
F 0 "#PWR015" H 6100 5550 50  0001 C CNN
F 1 "+5V" H 6100 5840 50  0000 C CNN
F 2 "" H 6100 5700 50  0001 C CNN
F 3 "" H 6100 5700 50  0001 C CNN
	1    6100 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 5AFA658F
P 6700 6150
F 0 "#PWR016" H 6700 5900 50  0001 C CNN
F 1 "GND" H 6700 6000 50  0000 C CNN
F 2 "" H 6700 6150 50  0001 C CNN
F 3 "" H 6700 6150 50  0001 C CNN
	1    6700 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5700 6600 5800
Wire Wire Line
	6600 5800 6350 5800
Wire Wire Line
	6350 5800 6350 5700
Wire Wire Line
	6800 5700 6800 5850
Wire Wire Line
	6800 5850 6100 5850
Wire Wire Line
	6100 5850 6100 5700
Wire Wire Line
	6700 5700 6700 6150
Wire Wire Line
	7950 2800 7450 2800
Wire Wire Line
	7450 2900 7950 2900
Wire Wire Line
	7950 3000 7450 3000
Wire Wire Line
	7950 3100 7450 3100
Wire Wire Line
	7450 3200 7950 3200
Wire Wire Line
	7950 3300 7450 3300
Wire Wire Line
	7950 3400 7450 3400
Wire Wire Line
	7950 3500 7450 3500
Wire Wire Line
	7950 3600 7450 3600
Wire Wire Line
	7950 3700 7450 3700
Wire Wire Line
	7950 3800 7450 3800
Wire Wire Line
	4100 1900 3400 1900
Wire Wire Line
	4100 2000 3400 2000
Wire Wire Line
	4100 2100 3750 2100
Wire Wire Line
	3750 2150 3400 2150
Wire Wire Line
	4100 2200 3850 2200
Wire Wire Line
	3850 2200 3850 2250
Wire Wire Line
	3850 2250 3400 2250
Wire Wire Line
	3750 2100 3750 2150
Wire Wire Line
	7450 4300 7950 4300
Wire Wire Line
	7950 4500 7450 4500
Wire Notes Line
	8650 4700 8650 4200
Wire Notes Line
	7850 4200 7850 4700
$EndSCHEMATC
