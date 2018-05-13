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
Sheet 2 5
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
L WC1602A DS1
U 1 1 5AF6F9BE
P 6050 3100
F 0 "DS1" H 5820 3850 50  0000 C CNN
F 1 "WC1602A" H 6260 3850 50  0000 C CNN
F 2 "Displays:WC1602A" H 6050 2200 50  0001 C CIN
F 3 "" H 6750 3100 50  0001 C CNN
	1    6050 3100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR01
U 1 1 5AF6F9F1
P 6050 1900
F 0 "#PWR01" H 6050 1750 50  0001 C CNN
F 1 "+5V" H 6050 2040 50  0000 C CNN
F 2 "" H 6050 1900 50  0001 C CNN
F 3 "" H 6050 1900 50  0001 C CNN
	1    6050 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5AF6FA0D
P 6050 4050
F 0 "#PWR02" H 6050 3800 50  0001 C CNN
F 1 "GND" H 6050 3900 50  0000 C CNN
F 2 "" H 6050 4050 50  0001 C CNN
F 3 "" H 6050 4050 50  0001 C CNN
	1    6050 4050
	1    0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 5AF6FA4D
P 7000 2100
F 0 "RV1" V 6825 2100 50  0000 C CNN
F 1 "POT" V 6900 2100 50  0000 C CNN
F 2 "" H 7000 2100 50  0001 C CNN
F 3 "" H 7000 2100 50  0001 C CNN
	1    7000 2100
	0    -1   1    0   
$EndComp
$Comp
L R R1
U 1 1 5AF6FAD6
P 6800 2300
F 0 "R1" V 6880 2300 50  0000 C CNN
F 1 "R" V 6800 2300 50  0000 C CNN
F 2 "" V 6730 2300 50  0001 C CNN
F 3 "" H 6800 2300 50  0001 C CNN
	1    6800 2300
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 5AF6FB11
P 7200 2300
F 0 "R4" V 7280 2300 50  0000 C CNN
F 1 "R" V 7200 2300 50  0000 C CNN
F 2 "" V 7130 2300 50  0001 C CNN
F 3 "" H 7200 2300 50  0001 C CNN
	1    7200 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 3900 6050 4050
Wire Wire Line
	6050 1900 6050 2300
Connection ~ 6050 2200
Wire Wire Line
	7350 4000 6050 4000
Connection ~ 6050 4000
Wire Wire Line
	7000 2250 7000 2500
Wire Wire Line
	7000 2500 6450 2500
Wire Wire Line
	6550 2100 6850 2100
Wire Wire Line
	6950 2300 7050 2300
Connection ~ 7000 2300
Wire Wire Line
	7350 2100 7350 4000
Wire Wire Line
	7350 2100 7150 2100
Connection ~ 7350 2300
$Comp
L POT RV2
U 1 1 5AF70009
P 7000 3100
F 0 "RV2" V 6825 3100 50  0000 C CNN
F 1 "POT" V 6900 3100 50  0000 C CNN
F 2 "" H 7000 3100 50  0001 C CNN
F 3 "" H 7000 3100 50  0001 C CNN
	1    7000 3100
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 5AF7000F
P 6800 3300
F 0 "R3" V 6880 3300 50  0000 C CNN
F 1 "R" V 6800 3300 50  0000 C CNN
F 2 "" V 6730 3300 50  0001 C CNN
F 3 "" H 6800 3300 50  0001 C CNN
	1    6800 3300
	-1   0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5AF70015
P 6800 2900
F 0 "R2" V 6880 2900 50  0000 C CNN
F 1 "R" V 6800 2900 50  0000 C CNN
F 2 "" V 6730 2900 50  0001 C CNN
F 3 "" H 6800 2900 50  0001 C CNN
	1    6800 2900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6850 3100 6600 3100
Wire Wire Line
	6800 3150 6800 3050
Connection ~ 6800 3100
Wire Wire Line
	7000 2750 7000 2950
Wire Wire Line
	6800 3450 7350 3450
Connection ~ 7350 3450
Wire Wire Line
	7000 3250 7000 3450
Connection ~ 7000 3450
Wire Wire Line
	6550 2750 7000 2750
Wire Wire Line
	6550 2100 6550 2800
Connection ~ 6550 2200
Connection ~ 6800 2750
Wire Wire Line
	6650 2200 6650 2300
Wire Wire Line
	6050 2200 6650 2200
Wire Wire Line
	6550 2800 6450 2800
Connection ~ 6550 2750
Wire Wire Line
	6450 2900 6600 2900
Wire Wire Line
	6600 2900 6600 3100
Wire Notes Line
	6900 2700 6900 3550
Wire Notes Line
	7550 2200 6500 2200
Wire Notes Line
	6500 2200 6500 2150
Text Notes 7550 2500 2    60   ~ 0
choose one
Text Notes 7400 3400 2    60   ~ 0
choose one
Text HLabel 5500 2500 0    60   Input ~ 0
E
Text HLabel 5500 2600 0    60   Input ~ 0
R/W
Text HLabel 5500 2700 0    60   Input ~ 0
RS
Text HLabel 5500 3000 0    60   Input ~ 0
D0
Text HLabel 5500 3100 0    60   Input ~ 0
D1
Text HLabel 5500 3200 0    60   Input ~ 0
D2
Text HLabel 5500 3300 0    60   Input ~ 0
D3
Text HLabel 5500 3400 0    60   Input ~ 0
D4
Text HLabel 5500 3500 0    60   Input ~ 0
D5
Text HLabel 5500 3600 0    60   Input ~ 0
D6
Text HLabel 5500 3700 0    60   Input ~ 0
D7
Wire Wire Line
	5650 2500 5500 2500
Wire Wire Line
	5500 2600 5650 2600
Wire Wire Line
	5650 2700 5500 2700
Wire Wire Line
	5650 3000 5500 3000
Wire Wire Line
	5500 3100 5650 3100
Wire Wire Line
	5650 3200 5500 3200
Wire Wire Line
	5500 3300 5650 3300
Wire Wire Line
	5650 3400 5500 3400
Wire Wire Line
	5650 3500 5500 3500
Wire Wire Line
	5650 3600 5500 3600
Wire Wire Line
	5650 3700 5500 3700
$EndSCHEMATC
