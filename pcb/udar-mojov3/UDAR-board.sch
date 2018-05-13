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
Sheet 3 5
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
L Mojov3 U3
U 1 1 5AF8219A
P 3750 4150
F 0 "U3" H 3750 4800 60  0000 C CNN
F 1 "Mojov3" H 3750 2900 60  0000 C CNN
F 2 "" H 5250 2600 60  0001 C CNN
F 3 "" H 5250 2600 60  0001 C CNN
	1    3750 4150
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 5AF821C0
P 7850 1450
F 0 "D4" H 7850 1550 50  0000 C CNN
F 1 "LED" H 7850 1350 50  0000 C CNN
F 2 "" H 7850 1450 50  0001 C CNN
F 3 "" H 7850 1450 50  0001 C CNN
	1    7850 1450
	1    0    0    -1  
$EndComp
Text Notes 7700 1700 0    60   ~ 0
STATUS
Text HLabel 7550 2450 2    60   Input ~ 0
PWM1
Text HLabel 7550 2550 2    60   Input ~ 0
PWM2
Text HLabel 7550 2700 2    60   Input ~ 0
Echo
Text HLabel 7550 2800 2    60   Input ~ 0
Trig
Text Notes 7750 2950 2    60   ~ 0
UDAR
Wire Notes Line
	7400 2350 7400 3050
Wire Notes Line
	7400 3050 7950 3050
Wire Notes Line
	7950 3050 7950 2350
Wire Notes Line
	7950 2350 7400 2350
Text HLabel 7400 3250 2    60   Input ~ 0
E
Text HLabel 7400 3350 2    60   Input ~ 0
R/W
Text HLabel 7400 3450 2    60   Input ~ 0
RS
Text HLabel 7400 3600 2    60   Input ~ 0
D0
Text HLabel 7400 3700 2    60   Input ~ 0
D1
Text HLabel 7400 3800 2    60   Input ~ 0
D2
Text HLabel 7400 3900 2    60   Input ~ 0
D3
Text HLabel 7400 4000 2    60   Input ~ 0
D4
Text HLabel 7400 4100 2    60   Input ~ 0
D5
Text HLabel 7400 4200 2    60   Input ~ 0
D6
Text HLabel 7400 4300 2    60   Input ~ 0
D7
Text Notes 7650 4450 2    60   ~ 0
1602A
Wire Notes Line
	7300 3200 7300 4500
Wire Notes Line
	7300 4500 7950 4500
Wire Notes Line
	7950 4500 7950 3200
Wire Notes Line
	7950 3200 7300 3200
Text HLabel 7300 4750 2    60   Input ~ 0
UART_RX
Text HLabel 7300 4850 2    60   Input ~ 0
UART_TX
Text Notes 7500 5000 2    60   ~ 0
UART
Wire Notes Line
	7200 4650 7200 5050
Wire Notes Line
	7200 5050 8000 5050
Wire Notes Line
	8000 5050 8000 4650
Wire Notes Line
	8000 4650 7200 4650
$EndSCHEMATC
