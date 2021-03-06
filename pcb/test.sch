EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 5906 5906
encoding utf-8
Sheet 1 1
Title "Jetson Auto Power"
Date ""
Rev "V1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:LED D1
U 1 1 5EE84EA5
P 3350 2250
F 0 "D1" H 3343 1995 50  0000 C CNN
F 1 "LED" H 3343 2086 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 2250 50  0001 C CNN
F 3 "~" H 3350 2250 50  0001 C CNN
	1    3350 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5EE86B41
P 2750 2250
F 0 "R2" V 2543 2250 50  0000 C CNN
F 1 "500R" V 2634 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2680 2250 50  0001 C CNN
F 3 "~" H 2750 2250 50  0001 C CNN
	1    2750 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 2850 2750 2850
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5EE96C0B
P 3650 900
F 0 "H1" H 3750 949 50  0000 L CNN
F 1 "VCC_Jetson" H 3750 858 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-0.5sqmm_1x01_D0.9mm_OD2.1mm" H 3650 900 50  0001 C CNN
F 3 "~" H 3650 900 50  0001 C CNN
	1    3650 900 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5EE987D1
P 4850 2250
F 0 "H4" H 4950 2299 50  0000 L CNN
F 1 "PWR_J20" H 4950 2208 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-0.5sqmm_1x01_D0.9mm_OD2.1mm" H 4850 2250 50  0001 C CNN
F 3 "~" H 4850 2250 50  0001 C CNN
	1    4850 2250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5EE99195
P 2350 900
F 0 "H3" H 2450 949 50  0000 L CNN
F 1 "OFF_J20" H 2450 858 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-0.5sqmm_1x01_D0.9mm_OD2.1mm" H 2350 900 50  0001 C CNN
F 3 "~" H 2350 900 50  0001 C CNN
	1    2350 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1000 3650 1350
Wire Wire Line
	3650 1350 3700 1350
$Comp
L Regulator_Linear:L7805 U2
U 1 1 5EE809B0
P 4000 1350
F 0 "U2" H 4000 1592 50  0000 C CNN
F 1 "L7805" H 4000 1501 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 4025 1200 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 4000 1300 50  0001 C CNN
	1    4000 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5F009EEF
P 3550 1600
F 0 "C1" H 3668 1646 50  0000 L CNN
F 1 "0.33uF" H 3668 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3588 1450 50  0001 C CNN
F 3 "~" H 3550 1600 50  0001 C CNN
	1    3550 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5F00B1F8
P 4300 1600
F 0 "C2" H 4418 1646 50  0000 L CNN
F 1 "0.1uF" H 4418 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4338 1450 50  0001 C CNN
F 3 "~" H 4300 1600 50  0001 C CNN
	1    4300 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1750 4000 1750
Connection ~ 4000 1750
Wire Wire Line
	4000 1750 4000 1800
Wire Wire Line
	4300 1750 4000 1750
Wire Wire Line
	3550 1450 3550 1350
Wire Wire Line
	3550 1350 3650 1350
Connection ~ 3650 1350
Connection ~ 4300 1350
Wire Wire Line
	4300 1350 4300 1450
$Comp
L Device:R R3
U 1 1 5F011B69
P 2950 2600
F 0 "R3" V 2743 2600 50  0000 C CNN
F 1 "1k" V 2834 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2880 2600 50  0001 C CNN
F 3 "~" H 2950 2600 50  0001 C CNN
	1    2950 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 1800 4000 1800
Connection ~ 4000 1800
$Comp
L Transistor_BJT:2N2219 Q1
U 1 1 5F020487
P 4400 2600
F 0 "Q1" H 4590 2646 50  0000 L CNN
F 1 "2N2219" H 4590 2555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4600 2525 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 4400 2600 50  0001 L CNN
	1    4400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1350 4500 2000
$Comp
L Device:R R4
U 1 1 5F0212E3
P 4500 2150
F 0 "R4" V 4293 2150 50  0000 C CNN
F 1 "1k" V 4384 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4430 2150 50  0001 C CNN
F 3 "~" H 4500 2150 50  0001 C CNN
	1    4500 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2300 4500 2350
Wire Wire Line
	4850 2350 4500 2350
Connection ~ 4500 2350
Wire Wire Line
	4500 2350 4500 2400
Wire Wire Line
	4000 2800 4500 2800
Connection ~ 4000 2800
Wire Wire Line
	4000 2800 4000 2850
$Comp
L Device:R R1
U 1 1 5EE85CEA
P 1750 1200
F 0 "R1" H 1680 1154 50  0000 R CNN
F 1 "200R" H 1680 1245 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1680 1200 50  0001 C CNN
F 3 "~" H 1750 1200 50  0001 C CNN
	1    1750 1200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 60258DE4
P 3050 2900
F 0 "#PWR0101" H 3050 2650 50  0001 C CNN
F 1 "GND" H 3055 2727 50  0000 C CNN
F 2 "" H 3050 2900 50  0001 C CNN
F 3 "" H 3050 2900 50  0001 C CNN
	1    3050 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 60259730
P 4450 1300
F 0 "#PWR0102" H 4450 1150 50  0001 C CNN
F 1 "+5V" H 4465 1473 50  0000 C CNN
F 2 "" H 4450 1300 50  0001 C CNN
F 3 "" H 4450 1300 50  0001 C CNN
	1    4450 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1050 4300 1350
Wire Wire Line
	4000 1800 4000 2250
Wire Wire Line
	4000 2250 4000 2800
Connection ~ 4000 2250
Wire Wire Line
	3500 2250 4000 2250
Wire Wire Line
	2350 2250 2600 2250
Wire Wire Line
	3200 2250 2900 2250
Wire Wire Line
	3100 2600 4200 2600
Wire Wire Line
	2350 2350 2800 2600
Wire Wire Line
	2350 1950 2350 1000
Wire Wire Line
	900  3000 900  1050
Wire Wire Line
	900  1050 1750 1050
Connection ~ 1750 1050
Wire Wire Line
	1500 3900 2750 3900
Wire Wire Line
	2750 3900 2750 2850
Connection ~ 2750 2850
Wire Wire Line
	900  3000 1500 3000
$Comp
L Connector:AVR-ISP-6 J1
U 1 1 6027A783
P 1600 3500
F 0 "J1" H 1270 3596 50  0000 R CNN
F 1 "AVR-ISP-6" H 1270 3505 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 1350 3550 50  0001 C CNN
F 3 " ~" H 325 2950 50  0001 C CNN
	1    1600 3500
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20SU U1
U 1 1 5EE7C9D3
P 1750 2250
F 0 "U1" H 1221 2296 50  0000 R CNN
F 1 "ATtiny85-20SU" H 1221 2205 50  0000 R CNN
F 2 "Package_SO:SOIJ-8_5.3x5.3mm_P1.27mm" H 1750 2250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 1750 2250 50  0001 C CNN
	1    1750 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3600 2350 3600
Wire Wire Line
	2350 3600 2350 2450
Wire Wire Line
	2350 2150 2400 2150
Wire Wire Line
	2400 2150 2400 3500
Wire Wire Line
	2400 3500 2000 3500
Wire Wire Line
	2350 2050 2450 2050
Wire Wire Line
	2450 2050 2450 3300
Wire Wire Line
	2450 3300 2000 3300
Wire Wire Line
	2000 3400 2500 3400
Wire Wire Line
	2500 3400 2500 1950
Wire Wire Line
	2500 1950 2350 1950
Connection ~ 2350 1950
Wire Wire Line
	1750 1650 1750 1350
Wire Wire Line
	4000 1650 4000 1750
Wire Wire Line
	2750 2850 3050 2850
Wire Wire Line
	3050 2900 3050 2850
Connection ~ 3050 2850
Wire Wire Line
	3050 2850 4000 2850
Wire Wire Line
	4300 1350 4450 1350
Wire Wire Line
	4450 1300 4450 1350
Connection ~ 4450 1350
Wire Wire Line
	4450 1350 4500 1350
Wire Wire Line
	1750 1050 4300 1050
$Comp
L Mechanical:MountingHole_Pad H8
U 1 1 6028FB0A
P 5250 650
F 0 "H8" H 5200 800 50  0000 L CNN
F 1 "pad" H 5200 450 50  0000 L CNN
F 2 "MountingHole:MountingHole_3mm_Pad_Via" H 5250 650 50  0001 C CNN
F 3 "~" H 5250 650 50  0001 C CNN
	1    5250 650 
	1    0    0    -1  
$EndComp
Text HLabel 5250 750  2    50   Input ~ 0
GND
$Comp
L Mechanical:MountingHole_Pad H7
U 1 1 602958B7
P 5050 650
F 0 "H7" H 5000 800 50  0000 L CNN
F 1 "pad" H 4950 450 50  0000 L CNN
F 2 "MountingHole:MountingHole_3mm_Pad_Via" H 5050 650 50  0001 C CNN
F 3 "~" H 5050 650 50  0001 C CNN
	1    5050 650 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 60296E43
P 4850 650
F 0 "H6" H 4800 800 50  0000 L CNN
F 1 "pad" H 4750 450 50  0000 L CNN
F 2 "MountingHole:MountingHole_3mm_Pad_Via" H 4850 650 50  0001 C CNN
F 3 "~" H 4850 650 50  0001 C CNN
	1    4850 650 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 602977B5
P 4650 650
F 0 "H5" H 4600 800 50  0000 L CNN
F 1 "pad" H 4450 450 50  0000 L CNN
F 2 "MountingHole:MountingHole_3mm_Pad_Via" H 4650 650 50  0001 C CNN
F 3 "~" H 4650 650 50  0001 C CNN
	1    4650 650 
	1    0    0    -1  
$EndComp
Text HLabel 5050 750  2    50   Input ~ 0
GND
Text HLabel 4850 750  2    50   Input ~ 0
GND
Text HLabel 4650 750  2    50   Input ~ 0
GND
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5EE97C63
P 4750 1700
F 0 "H2" H 4850 1749 50  0000 L CNN
F 1 "GND_Jetson" H 4850 1658 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-0.5sqmm_1x01_D0.9mm_OD2.1mm" H 4750 1700 50  0001 C CNN
F 3 "~" H 4750 1700 50  0001 C CNN
	1    4750 1700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
