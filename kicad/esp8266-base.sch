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
LIBS:kiall
LIBS:ESP8266
LIBS:dimmer-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "ESP8266 ESP-03 Base"
Date ""
Rev "v0.0.0"
Comp "Kiall Mac Innes"
Comment1 "Expect Bridge near VCC open"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ESP-03 U1
U 1 1 59B3C434
P 5800 3700
F 0 "U1" H 5800 3700 50  0000 C CNN
F 1 "ESP-03" H 5800 3900 50  0000 C CNN
F 2 "ESP8266:ESP-03" H 5800 3800 50  0001 C CNN
F 3 "" H 5800 3800 50  0001 C CNN
	1    5800 3700
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 59B3C534
P 5950 2600
F 0 "C3" H 5975 2700 50  0000 L CNN
F 1 "470uF" H 5975 2500 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 5988 2450 50  0001 C CNN
F 3 "" H 5950 2600 50  0001 C CNN
	1    5950 2600
	0    -1   -1   0   
$EndComp
$Comp
L CP C2
U 1 1 59B3C721
P 5950 2300
F 0 "C2" H 5975 2400 50  0000 L CNN
F 1 "0.1uF" H 5975 2200 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 5988 2150 50  0001 C CNN
F 3 "" H 5950 2300 50  0001 C CNN
	1    5950 2300
	0    -1   -1   0   
$EndComp
$Comp
L +3V3 #PWR04
U 1 1 59B3C808
P 5800 2000
F 0 "#PWR04" H 5800 1850 50  0001 C CNN
F 1 "+3V3" H 5800 2140 50  0000 C CNN
F 2 "" H 5800 2000 50  0001 C CNN
F 3 "" H 5800 2000 50  0001 C CNN
	1    5800 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 59B3C858
P 6100 2000
F 0 "#PWR05" H 6100 1750 50  0001 C CNN
F 1 "GND" H 6100 1850 50  0000 C CNN
F 2 "" H 6100 2000 50  0001 C CNN
F 3 "" H 6100 2000 50  0001 C CNN
	1    6100 2000
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 59B3C8C8
P 7300 3400
F 0 "R3" V 7380 3400 50  0000 C CNN
F 1 "10k" V 7300 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7230 3400 50  0001 C CNN
F 3 "" H 7300 3400 50  0001 C CNN
	1    7300 3400
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 59B3CA5F
P 7000 3500
F 0 "R2" V 7080 3500 50  0000 C CNN
F 1 "10k" V 7000 3500 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6930 3500 50  0001 C CNN
F 3 "" H 7000 3500 50  0001 C CNN
	1    7000 3500
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 59B3CAE0
P 4500 3950
F 0 "R1" V 4580 3950 50  0000 C CNN
F 1 "10k" V 4500 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4430 3950 50  0001 C CNN
F 3 "" H 4500 3950 50  0001 C CNN
	1    4500 3950
	-1   0    0    1   
$EndComp
$Comp
L +3V3 #PWR06
U 1 1 59B3CBDC
P 4500 4200
F 0 "#PWR06" H 4500 4050 50  0001 C CNN
F 1 "+3V3" H 4500 4340 50  0000 C CNN
F 2 "" H 4500 4200 50  0001 C CNN
F 3 "" H 4500 4200 50  0001 C CNN
	1    4500 4200
	-1   0    0    1   
$EndComp
$Comp
L +3V3 #PWR07
U 1 1 59B3CC2C
P 7800 3400
F 0 "#PWR07" H 7800 3250 50  0001 C CNN
F 1 "+3V3" H 7800 3540 50  0000 C CNN
F 2 "" H 7800 3400 50  0001 C CNN
F 3 "" H 7800 3400 50  0001 C CNN
	1    7800 3400
	0    1    1    0   
$EndComp
$Comp
L GND #PWR08
U 1 1 59B3CE19
P 5800 4650
F 0 "#PWR08" H 5800 4400 50  0001 C CNN
F 1 "GND" H 5800 4500 50  0000 C CNN
F 2 "" H 5800 4650 50  0001 C CNN
F 3 "" H 5800 4650 50  0001 C CNN
	1    5800 4650
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 59B3CF2B
P 7300 3600
F 0 "R4" V 7380 3600 50  0000 C CNN
F 1 "10k" V 7300 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7230 3600 50  0001 C CNN
F 3 "" H 7300 3600 50  0001 C CNN
	1    7300 3600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR09
U 1 1 59B3D072
P 7800 3600
F 0 "#PWR09" H 7800 3350 50  0001 C CNN
F 1 "GND" H 7800 3450 50  0000 C CNN
F 2 "" H 7800 3600 50  0001 C CNN
F 3 "" H 7800 3600 50  0001 C CNN
	1    7800 3600
	0    -1   -1   0   
$EndComp
$Comp
L SW_SPST SW2
U 1 1 59B3D874
P 3000 6700
F 0 "SW2" H 3000 6825 50  0000 C CNN
F 1 "Prog" H 3000 6600 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 3000 6700 50  0001 C CNN
F 3 "" H 3000 6700 50  0001 C CNN
	1    3000 6700
	0    -1   -1   0   
$EndComp
$Comp
L SW_SPST SW1
U 1 1 59B3D963
P 2500 6700
F 0 "SW1" H 2500 6825 50  0000 C CNN
F 1 "Reset" H 2500 6600 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 2500 6700 50  0001 C CNN
F 3 "" H 2500 6700 50  0001 C CNN
	1    2500 6700
	0    -1   -1   0   
$EndComp
NoConn ~ 4900 3900
$Comp
L Conn_01x06_Female J1
U 1 1 59B3E187
P 3300 3600
F 0 "J1" H 3300 3900 50  0000 C CNN
F 1 "FTDI" H 3300 3200 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x06_Pitch2.54mm" H 3300 3600 50  0001 C CNN
F 3 "" H 3300 3600 50  0001 C CNN
	1    3300 3600
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 59B3E761
P 3650 3900
F 0 "#PWR010" H 3650 3650 50  0001 C CNN
F 1 "GND" H 3650 3750 50  0000 C CNN
F 2 "" H 3650 3900 50  0001 C CNN
F 3 "" H 3650 3900 50  0001 C CNN
	1    3650 3900
	0    -1   -1   0   
$EndComp
NoConn ~ 3500 3700
Text Label 3800 3400 2    60   ~ 0
DTR
Text Label 6900 3400 1    60   ~ 0
GPIO0
Text Notes 850  5850 0    60   ~ 0
Auto Reset Circuit
$Comp
L GND #PWR011
U 1 1 59B46F4E
P 2500 7100
F 0 "#PWR011" H 2500 6850 50  0001 C CNN
F 1 "GND" H 2500 6950 50  0000 C CNN
F 2 "" H 2500 7100 50  0001 C CNN
F 3 "" H 2500 7100 50  0001 C CNN
	1    2500 7100
	1    0    0    -1  
$EndComp
Text Label 3000 6350 0    60   ~ 0
GPIO0
Text Notes 2300 5850 0    60   ~ 0
Manual Reset Circuit
Text Notes 4150 5850 0    60   ~ 0
PWR Supply
NoConn ~ 6700 3900
$Comp
L Transformer_Myrra_47000_1P_1S T1
U 1 1 59BCFDA5
P 4550 6800
F 0 "T1" H 4300 7150 60  0000 C CNN
F 1 "Myrra_47121" H 4550 6450 60  0000 C CNN
F 2 "kiall:Transformer_Myrra_47000_1P_1S" H 4555 6740 60  0001 C CNN
F 3 "" H 4555 6740 60  0001 C CNN
	1    4550 6800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 59BD01A8
P 5050 6600
F 0 "#PWR012" H 5050 6350 50  0001 C CNN
F 1 "GND" H 5050 6450 50  0000 C CNN
F 2 "" H 5050 6600 50  0001 C CNN
F 3 "" H 5050 6600 50  0001 C CNN
	1    5050 6600
	0    -1   -1   0   
$EndComp
$Comp
L +3V3 #PWR013
U 1 1 59BD0203
P 5050 7000
F 0 "#PWR013" H 5050 6850 50  0001 C CNN
F 1 "+3V3" H 5050 7140 50  0000 C CNN
F 2 "" H 5050 7000 50  0001 C CNN
F 3 "" H 5050 7000 50  0001 C CNN
	1    5050 7000
	0    1    1    0   
$EndComp
$Comp
L Screw_Terminal_01x03 J2
U 1 1 59BD1022
P 3600 6800
F 0 "J2" H 3600 7000 50  0000 C CNN
F 1 "AC IN" H 3600 6600 50  0000 C CNN
F 2 "kiall:RS_Pro_10mm_Pitch_3_Way_PCB_Terminal_Block" H 3600 6800 50  0001 C CNN
F 3 "" H 3600 6800 50  0001 C CNN
	1    3600 6800
	-1   0    0    1   
$EndComp
Text Notes 3750 6200 0    60   ~ 0
Myrra "All in one" PCB mount\nregulated PSU. No extra\ncomponents needed.
Text Label 600  6950 0    60   ~ 0
GPIO0
Text Label 700  6450 0    60   ~ 0
CH_PD
$Comp
L C C1
U 1 1 59BD1D7F
P 1200 6450
F 0 "C1" H 1225 6550 50  0000 L CNN
F 1 "0.1uF" H 1225 6350 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 1238 6300 50  0001 C CNN
F 3 "" H 1200 6450 50  0001 C CNN
	1    1200 6450
	0    1    1    0   
$EndComp
Text Label 1750 6450 2    60   ~ 0
DTR
Wire Wire Line
	5800 2000 5800 2800
Connection ~ 5800 2600
Connection ~ 5800 2300
Wire Wire Line
	7450 3400 7800 3400
Wire Wire Line
	7150 3500 7500 3500
Wire Wire Line
	7500 3500 7500 3400
Connection ~ 7500 3400
Wire Wire Line
	6700 3500 6850 3500
Wire Wire Line
	6700 3400 7150 3400
Wire Wire Line
	4500 3800 4900 3800
Wire Wire Line
	5800 4500 5800 4650
Wire Wire Line
	6700 3600 7150 3600
Wire Wire Line
	7450 3600 7800 3600
Connection ~ 6100 2300
Wire Wire Line
	3500 3500 4900 3500
Wire Wire Line
	4900 3600 3500 3600
Wire Wire Line
	3500 3900 3650 3900
Wire Wire Line
	3500 3400 3800 3400
Wire Wire Line
	2500 6900 2500 7100
Wire Wire Line
	2500 7000 3000 7000
Wire Wire Line
	3000 7000 3000 6900
Connection ~ 2500 7000
Wire Wire Line
	3000 6500 3000 6350
Wire Wire Line
	4500 4100 4500 4200
Wire Wire Line
	6100 2000 6100 2600
Wire Wire Line
	5050 7000 4950 7000
Wire Wire Line
	4950 6600 5050 6600
Wire Wire Line
	3800 6700 3850 6700
Wire Wire Line
	3850 6700 3850 6600
Wire Wire Line
	3850 6600 4150 6600
Wire Wire Line
	3800 6900 3850 6900
Wire Wire Line
	3850 6900 3850 7000
Wire Wire Line
	3850 7000 4150 7000
Wire Wire Line
	1050 6450 700  6450
Wire Wire Line
	1350 6450 1750 6450
NoConn ~ 3500 3800
Wire Notes Line
	2050 5600 2050 7800
Wire Notes Line
	3400 7800 3400 5600
Wire Notes Line
	5450 5600 5450 7800
Wire Notes Line
	5450 5600 450  5600
Wire Wire Line
	1100 6950 600  6950
Text Label 3900 6600 0    60   ~ 0
AC+
Text Label 3900 7000 0    60   ~ 0
AC-
NoConn ~ 4900 3700
$Comp
L Q_PNP_EBC Q1
U 1 1 59BD3E35
P 1200 7150
F 0 "Q1" H 1400 7200 50  0000 L CNN
F 1 "S8550 PNP" H 1400 7100 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 1400 7250 50  0001 C CNN
F 3 "" H 1200 7150 50  0001 C CNN
	1    1200 7150
	-1   0    0    1   
$EndComp
$Comp
L R R5
U 1 1 59BD42C3
P 1600 7150
F 0 "R5" V 1680 7150 50  0000 C CNN
F 1 "10k" V 1600 7150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1530 7150 50  0001 C CNN
F 3 "" H 1600 7150 50  0001 C CNN
	1    1600 7150
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 7150 1450 7150
Wire Wire Line
	1750 7150 1950 7150
Text Label 3800 3600 2    60   ~ 0
TXD
Text Label 3800 3500 2    60   ~ 0
RXD
Text Label 1950 7150 2    60   ~ 0
TXD
$Comp
L GND #PWR014
U 1 1 59BD46C2
P 1100 7450
F 0 "#PWR014" H 1100 7200 50  0001 C CNN
F 1 "GND" H 1100 7300 50  0000 C CNN
F 2 "" H 1100 7450 50  0001 C CNN
F 3 "" H 1100 7450 50  0001 C CNN
	1    1100 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 7350 1100 7450
Wire Wire Line
	2500 6500 2500 6350
Text Label 2500 6350 2    60   ~ 0
CH_PD
Text Label 4500 3800 0    60   ~ 0
CH_PD
Text HLabel 7200 3700 3    60   Input ~ 0
DimmerOut
Wire Wire Line
	7200 3700 6700 3700
Text HLabel 7050 3800 3    60   Input ~ 0
ZeroCrossingIn
Wire Wire Line
	7050 3800 6700 3800
Text HLabel 4100 6600 1    60   Input ~ 0
AC+
Text HLabel 4100 7000 3    60   Input ~ 0
AC-
Text Label 4050 6800 2    60   ~ 0
AC0
Wire Wire Line
	3800 6800 4100 6800
Text HLabel 4100 6800 2    60   Input ~ 0
AC0
$EndSCHEMATC