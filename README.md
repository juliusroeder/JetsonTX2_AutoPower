# JetsonTX2_AutoPower
Auto power on for the JetsonTX2 revision C02

One problem of the C02 revision of the Jetson TX2 dev kit is that auto power on is not easy to activate.
It includes desoldering and soldering 0402 resistors. The full process is described here: https://forums.developer.nvidia.com/t/auto-power-on-with-c02-carrier-board/70858

I needed a simpler way of automating the auto power on without the risk of damaging the TX2 by desoldering all other resistors next to R313.
Initially I tested the solution posted here: https://medium.com/@dumiloghin/auto-power-on-for-jetson-tx1-tx2-with-arduino-a5bd1b37659e
It turns on the TX2 using an Arduino Uno an is an excellent easy solution.

However, I needed a smaller form factor that could be co-hosted with the TX2 in a small steel box.

![Resulting Board](/images/AutoTurnOn4.jpeg)

Additionally, the only power source available to drive any logic was the 20V rail on the TX2.
In this project I am using an LDO to regulate the 20V to 5V, power an Attiny85 microcontroller and use it to turn on the TX2 via the J20 header. The microcontroller is mostly in a sleep state and draws very little power, therefore the LDO won't heat up too much.

![Resulting Board](/images/AutoTurnOn1.jpeg)

# Overview
The /src/ folder contains the very straigtforward main file for the attiny85.
The tiny checks if the jetson is on, if not it turns on the jetson. If the jetson is on the tiny goes into sleep mode.
The sleep mode is the lowest possible, but as we enable the interrupts before going to sleep the tiny will wake up to turn on the jetson again if it shuts down unexpectedly.

The command line commands for compiling and flashing the attiny85 are in the compile.sh.
Depending on your compiler please adjust the "-c" flag of avrdude.

The images folder contains additional images of the final "product".

An inital version of the pcb can be found in the pcb folder. It was created with KiCad.
Unfortunatly, I did not have the time to have it manufactured but made it by hand. Additionally, I am more of a software person than a hardware person. Please let me know if you find any boo boos.

# Required

To build your own circuit you will need the below material & equipment.

- avr-gcc, avr-objcopy, avrdude
- a bit of soldering knowledge & soldering iron
- a programmer for the Attiny85   
- the parts on the list below
- consumables (solder, jumper cables, heat shrink, some thicker (i.e. lower gauge) wire)


## List of material

Part description | Number | On Schematic | Datasheet link
-----------------|--------|--------------|---------------
Attiny85 | 1 | U1 | http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2586-AVR-8-bit-Microcontroller-ATtiny25-ATtiny45-ATtiny85_Datasheet.pdf
LDO - L7805 TO-220 | 1 | U2 |  https://www.st.com/resource/en/datasheet/l78.pdf
BJT - 2N2222 | 1 | Q1 | https://www.onsemi.com/pub/Collateral/P2N2222A-D.PDF
Capacitor - 0.47μF | 1 | C1 | na
Capacitor - 0.22μF | 1 | C2 | na
Resistor - 200Ω | 1 | R1 | na
Resistor - | 1 | R2 | na
Resistor - 1kΩ | 2 | R3 & R4 | na
LED | 1 | D1 | na

On the Schematic the BJT is a 2N2219, which should also work.

For R2 use something that matches your LED.

The capacitors I used are electrolytic, it would probably be better to use a ceramic cap for the 0.22μF.
On the other hand the capacitors are not essential, and it should work without the caps.
However, the LDO datasheet does recommend them.

# Schematic

The connections on the board look as follows.

![Schematic](/images/schematic.svg)

There are four connection points to the Jetson - H1 to H4.

H1 goes to the *PWR* pin on the J20 header this is the pin that needs to be pulled low for 1.5 to 2 seconds to turn on the Jetson.
H2 goes to the *OFF* pin on the J20 header and is used to detect if the Jetson is on or off.
H3 goes to the 20V rail on the Jetson.
H4 goes to ground on the Jetson.

For those of you that are more on the software side of life (which includes me):
1. H3 goes into the LDO.
2. The LDO decreases the voltage to 5V.
3. The capacitors on the input and output of the LDO are used to decrease noise.
4. The 5 volt is used to drive the Attiny85 via pin 8 (VCC).
5. The attiny85 checks if the Jetson is turned on or off - via pin 5 (PB0 going to H2).
6. If the TX2 is off the attiny85 sets pin 3 (PB4) to high which activates the BJT and pulls H1 low. Pulling H1 low is the same as pressing the power button.
7. The tiny is also connected to a status LED via pin 2 (PB3). The status LED either blinks (very) slowly or is on (when the Jetson is on).
7. All ground points are connected to each other and are connected to the JetsonTX2 ground via H4.

# JetsonTX2 connections

The following image shows the top view of the TX2. The J20 header is circled in yellow.
To reach the 20V rail you need to access the bottom of the board and unscrew the 4 screws circled in red.

![TX2 Top View](/images/TX2_top_view.jpg)

Solder a thicker wire to the point on the PCB circled in red. The yellow circle shows the location of the wifi antenna connectors.
The thicker wire is not essential but it will withstand a bit more physical stress.

![TX2 Bottom View](/images/TX2_bottom_view.jpg)

The J20 header is shown in the next picture. The red circle shows the actual header, the yellow shows the description off the pins we actually use.
The bottom pin is the *PWR* pin, i.e. we connect this to H1.
The middle pin is the ground pin, i.e. we connect H4 here.
The top pin is the *OFF* pin, i.e. we connect H2 here.

![TX2 Header](/images/TX_J20.jpg)

I built my boards in such a way that I could heat shrink the three wires going to J20 together. This adds physical stability and also makes it more unlikely for individual wires to detach from the header.

![Resulting Board](/images/AutoTurnOn3.jpeg)

# PCB
You can find the initial version of the pcb schematics, KiCad project and gerber files in the pcb folder. I have not tried to manufacture these as I ran out of time and I needed the boards asap. So I manufactured them from hand.

I changed all components to be SMD components, with the exception of the Attiny85.

# Possible changes
- leave out the status LED - after the Jetson is turned on this consumes the most energy

# Disclaimer

I am not responsible for any damages you cause to your equipment, board etc.
That said, please do let me know of any changes you suggest!
