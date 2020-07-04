avr-gcc -Wall -Os -DF_CPU=1000000 -mmcu=attiny85 -c -o main.o main.c
avr-gcc -Wall -Os -DF_CPU=1000000 -mmcu=attiny85  main.o -o main
avr-objcopy -j .text -j .data -O ihex main main.hex
sudo avrdude -c usbasp-clone -p attiny85 -U flash:w:main.hex:i
