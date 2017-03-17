EESchema Schematic File Version 2
LIBS:Firefly Jars-rescue
LIBS:power
LIBS:device
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
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:Altera
LIBS:analog_devices
LIBS:battery_management
LIBS:bbd
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:logo
LIBS:maxim
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:motor_drivers
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:ttl_ieee
LIBS:video
LIBS:Worldsemi
LIBS:Xicor
LIBS:Zilog
LIBS:irlz44n
LIBS:mcp602
LIBS:Firefly Jars-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 8500 11000 portrait
encoding utf-8
Sheet 1 1
Title "Research vreg circuit"
Date "2017-02-28"
Rev "1.0"
Comp "John-Michael Denton"
Comment1 "Original circuit design"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATTINY85-P IC1
U 1 1 584B52AD
P 4400 1850
F 0 "IC1" H 3250 2250 50  0000 C CNN
F 1 "ATTINY85-P" H 5400 1450 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 5400 1850 50  0001 C CIN
F 3 "" H 4400 1850 50  0000 C CNN
	1    4400 1850
	-1   0    0    -1  
$EndComp
$Comp
L INDUCTOR-RESCUE-Firefly_Jars L1
U 1 1 584BB7DB
P 5300 4250
F 0 "L1" V 5250 4250 50  0000 C CNN
F 1 "10uH" V 5400 4250 50  0000 C CNN
F 2 "Inductors:SELF-WE-PD-XXL" H 5300 4250 50  0001 C CNN
F 3 "http://www.abracon.com/Magnetics/power/ASPI-1040HI.pdf" H 5300 4250 50  0001 C CNN
F 4 "ASPI-1040HI-100M-T05" V 5300 4250 60  0001 C CNN "Part No."
	1    5300 4250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 584BBD21
P 2850 3100
F 0 "#PWR01" H 2850 2850 50  0001 C CNN
F 1 "GND" H 2850 2950 50  0000 C CNN
F 2 "" H 2850 3100 50  0000 C CNN
F 3 "" H 2850 3100 50  0000 C CNN
	1    2850 3100
	-1   0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 584BBD4E
P 2950 1850
F 0 "C1" H 2975 1950 50  0000 L CNN
F 1 "47uF" H 2975 1750 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 2988 1700 50  0000 C CNN
F 3 "" H 2950 1850 50  0000 C CNN
	1    2950 1850
	-1   0    0    -1  
$EndComp
$Comp
L D_Schottky D2
U 1 1 584F1016
P 5950 3950
F 0 "D2" H 5950 4050 50  0000 C CNN
F 1 "MBR20100CT" H 5950 3850 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220_Neutral123_Vertical" H 5950 3950 50  0001 C CNN
F 3 "http://www.diodes.com/_files/datasheets/MBR20100C.pdf" H 5950 3950 50  0001 C CNN
	1    5950 3950
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 584F1080
P 6250 4250
F 0 "C2" H 6275 4350 50  0000 L CNN
F 1 "100uF" H 6275 4150 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D8_L11.5_P3.5" H 6288 4100 50  0001 C CNN
F 3 "http://www.nichicon.co.jp/english/products/pdfs/e-rr7.pdf" H 6250 4250 50  0001 C CNN
F 4 "RR71C101MDN1" H 6250 4250 60  0001 C CNN "Part No."
	1    6250 4250
	-1   0    0    1   
$EndComp
$Comp
L R R8
U 1 1 584F1226
P 4800 6450
F 0 "R8" V 4880 6450 50  0000 C CNN
F 1 "27" V 4800 6450 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 4730 6450 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-CF_CFM.pdf" H 4800 6450 50  0001 C CNN
F 4 "CF14JT27R0" V 4800 6450 60  0001 C CNN "Part No."
	1    4800 6450
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 585928E4
P 6600 4250
F 0 "C3" H 6625 4350 50  0000 L CNN
F 1 "100uF" H 6625 4150 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D8_L11.5_P3.5" H 6638 4100 50  0001 C CNN
F 3 "http://www.nichicon.co.jp/english/products/pdfs/e-rr7.pdf" H 6600 4250 50  0001 C CNN
F 4 "RR71C101MDN1" H 6600 4250 60  0001 C CNN "Part No."
	1    6600 4250
	-1   0    0    1   
$EndComp
$Comp
L Q_NMOS_DGS Q2
U 1 1 58592CF3
P 5600 5100
F 0 "Q2" H 5900 5150 50  0000 R CNN
F 1 "SiA436DJ DGS" H 6250 5050 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SC-70-6_Handsoldering" H 5800 5200 50  0001 C CNN
F 3 "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjIuee83YLRAhVKwlQKHR5sCTYQFghDMAA&url=http%3A%2F%2Fwww.vishay.com%2Fdocs%2F63535%2Fsia436dj.pdf&usg=AFQjCNHzil25nGm4p5iWNXBk7NC8Cwca5g&sig2=SeyBavHTBsmOYe4kZvF3tQ" H 5600 5100 50  0001 C CNN
F 4 "SiA436DJ" H 5600 5100 60  0001 C CNN "Part No."
	1    5600 5100
	1    0    0    -1  
$EndComp
Text Notes 5900 2000 0    60   ~ 0
250Khz PWM
$Comp
L R R3
U 1 1 58593F6F
P 2350 6250
F 0 "R3" V 2430 6250 50  0000 C CNN
F 1 "300" V 2350 6250 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 2280 6250 50  0001 C CNN
F 3 "" H 2350 6250 50  0001 C CNN
F 4 "CF14JT300R" V 2350 6250 60  0001 C CNN "Part No."
	1    2350 6250
	1    0    0    -1  
$EndComp
$Comp
L TL431PS D1
U 1 1 58594096
P 2250 6500
F 0 "D1" H 2150 6600 50  0000 C CNN
F 1 "KA431LDTF" H 2250 6400 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 2250 6350 50  0001 C CIN
F 3 "https://www.fairchildsemi.com/datasheets/KA/KA431L.pdf" H 2250 6500 50  0001 C CNN
	1    2250 6500
	1    0    0    -1  
$EndComp
$Comp
L LM393 U1
U 1 1 585944D7
P 3050 6750
F 0 "U1" H 3200 6900 50  0000 C CNN
F 1 "LM393" H 3300 6600 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 3050 6750 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/LM393-D.PDF" H 3050 6750 50  0001 C CNN
F 4 "LM393N" H 3050 6750 60  0001 C CNN "Part No."
	1    3050 6750
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 585947DC
P 2600 6850
F 0 "R4" V 2680 6850 50  0000 C CNN
F 1 "2k" V 2600 6850 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 2530 6850 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-CF_CFM.pdf" H 2600 6850 50  0001 C CNN
F 4 "CF14JT2K00" V 2600 6850 60  0001 C CNN "Part No."
	1    2600 6850
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 58594855
P 2600 7200
F 0 "R5" V 2680 7200 50  0000 C CNN
F 1 "2k" V 2600 7200 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 2530 7200 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-CF_CFM.pdf" H 2600 7200 50  0001 C CNN
F 4 "CF14JT2K00" V 2600 7200 60  0001 C CNN "Part No."
	1    2600 7200
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 58594AB8
P 2600 7600
F 0 "R6" V 2680 7600 50  0000 C CNN
F 1 "10k" V 2600 7600 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 2530 7600 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-CF_CFM.pdf" H 2600 7600 50  0001 C CNN
F 4 "CF14JT10K0" V 2600 7600 60  0001 C CNN "Part No."
	1    2600 7600
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 58596829
P 3350 7000
F 0 "R7" V 3430 7000 50  0000 C CNN
F 1 "10k" V 3350 7000 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 3280 7000 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-CF_CFM.pdf" H 3350 7000 50  0001 C CNN
F 4 "CF14JT10K0" V 3350 7000 60  0001 C CNN "Part No."
	1    3350 7000
	-1   0    0    1   
$EndComp
Text Label 6500 2000 0    60   ~ 0
attinyPWM
Text Label 5400 5100 2    60   ~ 0
attinyPWM
Text Notes 4950 3250 0    60   ~ 0
Inverting regulator - top rail is now negative.
$Comp
L +BATT #PWR02
U 1 1 5859C208
P 2900 900
F 0 "#PWR02" H 2900 750 50  0001 C CNN
F 1 "+BATT" H 2900 1040 50  0000 C CNN
F 2 "" H 2900 900 50  0000 C CNN
F 3 "" H 2900 900 50  0000 C CNN
	1    2900 900 
	1    0    0    -1  
$EndComp
Text GLabel 2900 950  0    60   Input ~ 0
Vdd
Text GLabel 2850 3050 0    60   Input ~ 0
Vss
Text GLabel 5300 3600 0    60   Input ~ 0
Vdd
Text GLabel 5700 5500 0    60   Input ~ 0
Vss
Text GLabel 6850 3350 2    60   Input ~ 0
Reg-vss
Text GLabel 6850 5200 2    60   Input ~ 0
Reg-vdd
Text GLabel 1900 6050 0    60   Input ~ 0
Reg-vdd
Text GLabel 1900 7900 0    60   Input ~ 0
Reg-vss
$Comp
L R R2
U 1 1 585A0169
P 5750 2300
F 0 "R2" V 5830 2300 50  0000 C CNN
F 1 "10k" V 5750 2300 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 5680 2300 50  0001 C CNN
F 3 "" H 5750 2300 50  0001 C CNN
F 4 "Unspec'd - Not in original schematic." V 5750 2300 60  0001 C CNN "Part No."
	1    5750 2300
	1    0    0    -1  
$EndComp
Text GLabel 5750 2450 3    60   Input ~ 0
Vdd
Text GLabel 3350 7150 3    60   Input ~ 0
attinyADC
Text GLabel 6100 1800 2    60   Input ~ 0
attinyADC
$Comp
L LM393 U1
U 2 1 585A2A42
P 3950 6750
F 0 "U1" H 4100 6900 50  0000 C CNN
F 1 "LM393" H 4200 6600 50  0000 C CNN
F 2 "" H 3950 6750 50  0000 C CNN
F 3 "" H 3950 6750 50  0000 C CNN
	2    3950 6750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 585A35E4
P 4250 6750
F 0 "#PWR03" H 4250 6500 50  0001 C CNN
F 1 "GND" H 4250 6600 50  0000 C CNN
F 2 "" H 4250 6750 50  0000 C CNN
F 3 "" H 4250 6750 50  0000 C CNN
	1    4250 6750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR04
U 1 1 585A3629
P 3650 6650
F 0 "#PWR04" H 3650 6400 50  0001 C CNN
F 1 "GND" H 3650 6500 50  0000 C CNN
F 2 "" H 3650 6650 50  0000 C CNN
F 3 "" H 3650 6650 50  0000 C CNN
	1    3650 6650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR05
U 1 1 585A3667
P 3650 6850
F 0 "#PWR05" H 3650 6600 50  0001 C CNN
F 1 "GND" H 3650 6700 50  0000 C CNN
F 2 "" H 3650 6850 50  0000 C CNN
F 3 "" H 3650 6850 50  0000 C CNN
	1    3650 6850
	0    1    1    0   
$EndComp
Text Notes 3500 6450 0    60   ~ 0
Per datasheet,\nground unused pins.
$Comp
L LED-RESCUE-Firefly_Jars D3
U 1 1 585A39D8
P 4800 7000
F 0 "D3" H 4800 7100 50  0000 C CNN
F 1 "LED" H 4800 6900 50  0000 C CNN
F 2 "LEDs:LED-5MM" H 4800 7000 50  0001 C CNN
F 3 "http://www.cree.com/~/media/Files/Cree/LED-Components-and-Modules/HB/Data-Sheets/1366-C4SMM-RJF-GJF-BJF.pdf" H 4800 7000 50  0001 C CNN
F 4 "C4SMM-RJF-CS24QBB1" H 4800 7000 60  0001 C CNN "Part No."
	1    4800 7000
	0    -1   -1   0   
$EndComp
$Comp
L Q_NMOS_DGS Q3
U 1 1 585A3CDC
P 4700 7500
F 0 "Q3" H 5000 7550 50  0000 R CNN
F 1 "SiA436DJ DGS" H 5350 7450 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SC-70-6_Handsoldering" H 4900 7600 50  0001 C CNN
F 3 "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjIuee83YLRAhVKwlQKHR5sCTYQFghDMAA&url=http%3A%2F%2Fwww.vishay.com%2Fdocs%2F63535%2Fsia436dj.pdf&usg=AFQjCNHzil25nGm4p5iWNXBk7NC8Cwca5g&sig2=SeyBavHTBsmOYe4kZvF3tQ" H 4700 7500 50  0001 C CNN
F 4 "SiA436DJ" H 4700 7500 60  0001 C CNN "Part No."
	1    4700 7500
	1    0    0    -1  
$EndComp
Text GLabel 5950 1250 2    60   Input ~ 0
attinyLEDPWM
Text GLabel 4500 7500 0    60   Input ~ 0
attinyLEDPWM
$Comp
L Q_NMOS_DGS Q1
U 1 1 585A77C2
P 2750 2300
F 0 "Q1" H 3050 2350 50  0000 R CNN
F 1 "SiA436DJ DGS" H 3400 2250 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SC-70-6_Handsoldering" H 2950 2400 50  0001 C CNN
F 3 "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjIuee83YLRAhVKwlQKHR5sCTYQFghDMAA&url=http%3A%2F%2Fwww.vishay.com%2Fdocs%2F63535%2Fsia436dj.pdf&usg=AFQjCNHzil25nGm4p5iWNXBk7NC8Cwca5g&sig2=SeyBavHTBsmOYe4kZvF3tQ" H 2750 2300 50  0001 C CNN
F 4 "SiA436DJ" H 2750 2300 60  0001 C CNN "Part No."
	1    2750 2300
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 585A8569
P 2700 1200
F 0 "R1" V 2780 1200 50  0000 C CNN
F 1 "10k" V 2700 1200 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 2630 1200 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-CF_CFM.pdf" H 2700 1200 50  0001 C CNN
F 4 "CF14JT10K0" V 2700 1200 60  0001 C CNN "Part No."
	1    2700 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 1200 2900 1200
Wire Wire Line
	2550 1200 2550 2300
Connection ~ 2900 1200
Wire Wire Line
	5750 1250 5950 1250
Wire Wire Line
	5750 1600 5750 1250
Wire Wire Line
	4800 7900 4800 7700
Wire Wire Line
	4800 7200 4800 7300
Connection ~ 3850 7900
Wire Wire Line
	3850 7900 3850 7050
Connection ~ 3850 6050
Wire Wire Line
	3850 6050 3850 6450
Wire Wire Line
	2500 6400 2500 6650
Wire Wire Line
	5750 1800 6100 1800
Wire Wire Line
	5750 2150 5750 2100
Wire Wire Line
	6600 5200 6850 5200
Wire Wire Line
	6600 3350 6850 3350
Wire Wire Line
	5700 5300 5700 5500
Wire Wire Line
	5300 3950 5300 3600
Wire Wire Line
	3350 6750 3350 6850
Connection ~ 2950 7900
Wire Wire Line
	2950 7900 2950 7050
Connection ~ 2950 6050
Wire Wire Line
	2950 6450 2950 6050
Wire Wire Line
	2500 6650 2750 6650
Wire Wire Line
	2750 7400 2600 7400
Wire Wire Line
	2600 6050 2600 6700
Wire Wire Line
	2600 7000 2600 7050
Wire Wire Line
	2750 6850 2750 7400
Wire Wire Line
	2750 7050 2750 7050
Connection ~ 2600 7400
Connection ~ 2600 7900
Wire Wire Line
	2600 7900 2600 7750
Wire Wire Line
	2600 7350 2600 7450
Connection ~ 2600 6050
Wire Wire Line
	1900 6050 2700 6050
Connection ~ 2150 7900
Wire Wire Line
	2150 6500 2150 7900
Connection ~ 2350 6400
Wire Wire Line
	2250 6400 2500 6400
Wire Wire Line
	2350 6400 2350 6500
Wire Wire Line
	5750 2000 6500 2000
Connection ~ 5700 4650
Wire Wire Line
	5700 4650 5700 4900
Connection ~ 6600 5200
Wire Wire Line
	6600 5200 6600 4400
Connection ~ 6600 3350
Wire Wire Line
	6600 3350 6600 4100
Wire Wire Line
	5300 4650 5300 4550
Wire Wire Line
	1900 7900 5300 7900
Wire Wire Line
	6250 4650 6600 5200
Wire Wire Line
	5300 4650 6250 4650
Wire Wire Line
	2600 6050 5350 6050
Wire Wire Line
	6250 3950 6600 3350
Wire Wire Line
	6100 3950 6250 3950
Connection ~ 4800 6050
Connection ~ 4800 7900
Wire Wire Line
	4800 6600 4800 6800
Wire Wire Line
	4800 6050 4800 6300
Connection ~ 6250 4650
Connection ~ 6250 3950
Wire Wire Line
	6250 4650 6250 4400
Wire Wire Line
	6250 3950 6250 4100
Wire Wire Line
	5300 3950 5800 3950
Connection ~ 2900 1600
Wire Wire Line
	2900 900  2900 1700
Connection ~ 2950 2100
Wire Wire Line
	2950 2000 2950 2100
Wire Wire Line
	2900 1700 2950 1700
Wire Wire Line
	2850 2500 2850 3100
Wire Wire Line
	2850 2100 3050 2100
Wire Wire Line
	2900 1600 3050 1600
Text Notes 2100 2600 0    60   ~ 0
Reverse polarity protection mosfet.
Wire Wire Line
	2350 6100 2300 6050
Wire Wire Line
	2300 6050 2300 6050
Connection ~ 2300 6050
$EndSCHEMATC
