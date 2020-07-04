#include <avr/io.h>
#include <util/delay.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>
#include <avr/power.h>

#define DELAY_MS 1000

void power_on(void){
    _delay_ms(DELAY_MS);
    PORTB |= _BV(PB4); // high
    _delay_ms(DELAY_MS*2); //power button has to be pushed a good amount of time
    PORTB &= ~_BV(PB4); // low
    _delay_ms(DELAY_MS);
}

void setup(void){
    //all as input with pull up resistor
    PORTB = 0xff;
    DDRB = 0x00;
    cli(); //cleans interrupts

    /* set pin 3 of PORTB for status LED*/
    PORTB &= ~_BV(PB3); //pin is low at start
    DDRB |= _BV(DDB3);

    // set pin 4 of PORTB as output to turn Jetson on via PWR pin on J20
    PORTB  &= ~_BV(PB4); // portb4 is low in the beginning and has to be pulled to LOW to turn on Jetson
    DDRB |= _BV(DDB4); // portb4 is an output pin

    // set pin 2 of PORTD as input, i.e. reads if Jetson is off via OFF pin on J20
    PORTB |= _BV(PB0); // pull-up resistor active
    DDRB &= ~_BV(DDB0); //input for jetson power LED;
    _delay_ms(DELAY_MS*2);
}

ISR(PCINT0_vect, ISR_BLOCK){}


void sleep_now(void){
    //enables interrupts
    PCMSK |= _BV(PCINT0);
    GIMSK |= _BV(PCIE);
    // PCICR |= _BV(PCIE2); //required for atmega328
    sei();
    // got to sleep
    set_sleep_mode(SLEEP_MODE_PWR_DOWN);
    sleep_enable();
    sleep_mode();
    sleep_disable();
    cli(); //disables interrupts
}


int main (void)
{
    setup();

    while(1) {
      // check if jetson is on; if yes Sleep
        if (bit_is_set(PINB, PINB0)) {
            PORTB |= _BV(PB3);
            sleep_now();
            PORTB &= ~_BV(PB3);
            _delay_ms(DELAY_MS*2);
        }else{
      // else turn on
            PORTB |= _BV(PB3); //turn led on
            power_on();
            PORTB &= ~_BV(PB3); //turn off
            _delay_ms(DELAY_MS*2);
        }
    }
}
