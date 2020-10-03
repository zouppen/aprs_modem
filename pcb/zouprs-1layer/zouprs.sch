EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Sparkfun:SPARKFUN_PRO_MICRO B1
U 1 1 5F71BD06
P 4650 2850
F 0 "B1" H 4650 3760 45  0000 C CNN
F 1 "SPARKFUN_PRO_MICRO" H 4650 3676 45  0000 C CNN
F 2 "Sparkfun boards:SPARKFUN_PRO_MICRO" H 4650 3650 20  0001 C CNN
F 3 "" H 4650 2850 50  0001 C CNN
F 4 "XXX-00000" H 4650 3581 60  0000 C CNN "Kenttä4"
	1    4650 2850
	1    0    0    -1  
$EndComp
$Comp
L oma:HX1 B2
U 1 1 5F73604F
P 2100 2950
F 0 "B2" H 1650 3100 50  0000 R CNN
F 1 "HX1" H 1650 3000 50  0000 R CNN
F 2 "radiometrix:PinHeader_1x12_P2.54mm_Vertical" H 2100 2950 50  0001 C CNN
F 3 "~" H 2100 2950 50  0001 C CNN
	1    2100 2950
	1    0    0    -1  
$EndComp
Text GLabel 2300 2950 2    50   Input ~ 0
VCC
$Comp
L power:GND #PWR0101
U 1 1 5F725662
P 5400 2400
F 0 "#PWR0101" H 5400 2150 50  0001 C CNN
F 1 "GND" H 5405 2227 50  0000 C CNN
F 2 "" H 5400 2400 50  0001 C CNN
F 3 "" H 5400 2400 50  0001 C CNN
	1    5400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2400 5400 2400
$Comp
L Device:C_Small C1
U 1 1 5F72991B
P 2700 3350
F 0 "C1" H 2792 3396 50  0000 L CNN
F 1 "87n" H 2792 3305 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 2700 3350 50  0001 C CNN
F 3 "~" H 2700 3350 50  0001 C CNN
	1    2700 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5F72A55F
P 2900 3150
F 0 "R1" V 2700 3150 50  0000 C CNN
F 1 "674" V 2800 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 2900 3150 50  0001 C CNN
F 3 "~" H 2900 3150 50  0001 C CNN
	1    2900 3150
	0    1    1    0   
$EndComp
NoConn ~ 4200 2300
NoConn ~ 4200 2400
NoConn ~ 4200 2700
NoConn ~ 4200 2800
NoConn ~ 4200 3000
NoConn ~ 4200 3100
NoConn ~ 4200 3200
NoConn ~ 5100 3200
NoConn ~ 5100 3100
NoConn ~ 5100 3000
NoConn ~ 5100 2900
NoConn ~ 5100 2800
NoConn ~ 5100 2700
NoConn ~ 5100 2500
NoConn ~ 5100 2300
NoConn ~ 4200 2900
Wire Wire Line
	4000 2600 4200 2600
Wire Wire Line
	4000 2500 4000 2600
Wire Wire Line
	4200 2500 4000 2500
NoConn ~ 5100 3300
NoConn ~ 5100 3400
$Comp
L Device:R_Small R2
U 1 1 5F754235
P 3400 3050
F 0 "R2" H 3459 3096 50  0000 L CNN
F 1 "300" H 3459 3005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" H 3400 3050 50  0001 C CNN
F 3 "~" H 3400 3050 50  0001 C CNN
	1    3400 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5F75530A
P 3400 3300
F 0 "D1" V 3439 3183 50  0000 R CNN
F 1 "LED" V 3348 3183 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3400 3300 50  0001 C CNN
F 3 "~" H 3400 3300 50  0001 C CNN
	1    3400 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 3050 2550 3050
Wire Wire Line
	2550 3050 2550 2650
Wire Wire Line
	2550 2450 2300 2450
Wire Wire Line
	2300 2650 2550 2650
Connection ~ 2550 2650
Wire Wire Line
	2550 3050 2550 3500
Connection ~ 2550 3050
$Comp
L Connector:Conn_Coaxial J1
U 1 1 5F71C5CA
P 2550 2150
F 0 "J1" H 2650 2125 50  0000 L CNN
F 1 "Conn_Coaxial" H 2650 2034 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Samtec_SMA-J-P-X-ST-EM1_EdgeMount" H 2550 2150 50  0001 C CNN
F 3 " ~" H 2550 2150 50  0001 C CNN
	1    2550 2150
	1    0    0    -1  
$EndComp
Connection ~ 2550 2450
Wire Wire Line
	2550 2450 2550 2650
Wire Wire Line
	2550 2350 2550 2450
Wire Wire Line
	2350 2150 2350 2550
Wire Wire Line
	2350 2550 2300 2550
Wire Wire Line
	2800 3150 2700 3150
Wire Wire Line
	2700 3150 2700 3250
Connection ~ 2700 3150
Wire Wire Line
	2700 3150 2300 3150
$Comp
L power:GND #PWR0103
U 1 1 5F7284D0
P 2550 3600
F 0 "#PWR0103" H 2550 3350 50  0001 C CNN
F 1 "GND" H 2555 3427 50  0000 C CNN
F 2 "" H 2550 3600 50  0001 C CNN
F 3 "" H 2550 3600 50  0001 C CNN
	1    2550 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3500 2700 3500
Connection ~ 2550 3500
Wire Wire Line
	2700 3450 2700 3500
Connection ~ 2700 3500
Wire Wire Line
	3550 2850 3400 2850
Wire Wire Line
	3400 2850 3400 2950
Connection ~ 3400 2850
Wire Wire Line
	2550 3600 2550 3500
Text GLabel 5100 2600 2    50   Output ~ 0
VCC
Connection ~ 4000 2600
$Comp
L power:GND #PWR0102
U 1 1 5F727AEF
P 4000 2600
F 0 "#PWR0102" H 4000 2350 50  0001 C CNN
F 1 "GND" H 4005 2427 50  0000 C CNN
F 2 "" H 4000 2600 50  0001 C CNN
F 3 "" H 4000 2600 50  0001 C CNN
	1    4000 2600
	1    0    0    -1  
$EndComp
Text GLabel 3550 2850 2    50   Input ~ 0
EN
Text GLabel 4200 3300 0    50   Output ~ 0
EN
Text GLabel 4200 3400 0    50   Output ~ 0
FSK
Text GLabel 3050 3150 2    50   Input ~ 0
FSK
Wire Wire Line
	3400 3450 3400 3500
Wire Wire Line
	2700 3500 3400 3500
Wire Wire Line
	2300 2850 3400 2850
Wire Wire Line
	3050 3150 3000 3150
Text GLabel 2350 2150 0    50   UnSpc ~ 0
RF
$EndSCHEMATC