// sleep.c
// by John-Michael Denton
// A microcontroller firmware for a voltage regulator that also sleeps and blinks an LED in a fancy way
#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include "cie1931.h"

ISR (WDT_vect)
{
   PRR = 0x00;
   MCUCR &= ~(1 << SE);
   // Make sure watchdog is off now.
   WDTCR |= (1 << WDCE) | (1 << WDE);
   WDTCR = 0x00;
}

volatile int toca_counter;
volatile int toca_limit;
ISR (TIMER0_COMPA_vect)
{
	toca_counter++;
   if (PINB & (1 << PB3))
   {
      if(OCR1B < 150)
         OCR1B++;
   }
   else if(OCR1B > 0)
      OCR1B--;
	return;
}

void idle(void)
{ // Wherein we idle until something wakes us up.
   MCUCR &= ~(3 << SM0);
   MCUCR |= (1 << SE);
   asm("sleep");
   MCUCR &= ~(1 << SE);
}

void start_timer0(void)
{
	// Enter Timer/Counter Synchronization mode
	GTCCR |= (1 << TSM) | (1 << PSR0);
	// Toggle PB0 on match; Clear Top Compare mode
	// TCCR0A |= (1 << COM0A0) | (2 << WGM00);
	TCCR0A |= (2 << WGM00);
	// TCCR0B clock mode selection:
	// Mode 0: No clock source (timer/counter stopped)
	// Mode 1: No scaling, CLKio	125ns tick
	// mode 2: CLKio / 8				1us tick
	// Mode 3: CLKio / 64			8us tick
	// Mode 4: CLKio / 256			32us tick
	// Mode 5: CLKio / 1024			128us tick
	// Mode 6: External clock on T0 pin; falling edge
	// Mode 7: External clock on T0 pin; rising edge
	TCCR0B |= (1 << CS00);
	// Enabling output on PB0
	// DDRB |= (1 << PB0);
	// Timer 0 match A interrupt enable
	TIMSK |= (1 << OCIE0A);
	// Leave Timer/Counter Synchronization mode
	GTCCR &= ~((1 << TSM) | (1 << PSR0));
	OCR0A = 255;
	return;
}

void start_timer1(void)
{
	// Two PWM outputs - PWM1A and PWM1B - one is in general / GTCCR, the other
	// is Timer1 specific.
	PLLCSR |= (1 << PLLE);
	// PLL should lock in 100us; double check and then enable.
	// MAKE SURE TO DOUBLE CHECK or the mosfet just gets left wide open...
	toca_counter = 0;
	while(toca_counter < 8)
		idle();
	while(!PLLCSR & (1<<PLOCK))
		idle();
	PLLCSR |= (1 << PCKE);
	GTCCR |= (1 << TSM ) | (1 << PSR1) | (1 << PWM1B) | (2 << COM1B0);
	TCCR1 |= (1 << PWM1A) | (2 << COM1A0);
	TCCR1 |= (1 << CS10);
	OCR1C = 255;
	GTCCR |= (3 << FOC1A);
	GTCCR &= ~((1 << TSM ) | (1 << PSR1 ));
	DDRB |= (1 << PB1) | (1 << PB4);
	DDRB &= ~(1 << PB3 );
}

void sleeper(void)
{
   PRR |= (15 << PRADC);      // Shut down errything.
	TCCR0A &= ~(15 << COM0B0); // Disconnect timer 0 compare A/B.
	TCCR1 &= ~(3 << COM1A0); // Disconnect timer 1 compare A.
	GTCCR &= ~(3 << COM1B0); // Disconnect timer 1 compare B.
	// Enable synchro mode to stop compare/match everything.
   GTCCR |= (1 << TSM) | (1 << PSR1) | (1 << PSR0 ); 
   MCUCR |= (1 << SE) | (2 << SM0);
   MCUSR &= ~(1 << WDRF);     // Don't reset.
   WDTCR |= (7 << WDP0);      // 2 second of sleeps.
   WDTCR |= (1 << WDIE);      // WDE 0 and WDIE 1 autostarts timer.
   asm("sleep");
   MCUCR &= ~(1 << SE);
   PRR = 0x00;
	// After sleeping, there appears to be a charge issue internally
	// with the chip.
	// This causes clock drift and pulse timing issues with the PLL, and
	// negatively affect stability.
	// WAIT AFTER WAKING.
   GTCCR &= ~(1 << PSR0);
	start_timer0();
	toca_counter = 0;
	while(toca_counter < 1000)
		idle();
   GTCCR &= ~(1 << TSM);
	return;
}

void start_vreg (void)
{ 
   /* We'll go ahead and lock here until the voltage regulator is charged. 
    * As soon as that's done, we'll drop back to normal operation.
	 *
	 * These settings source about 40mA of current with the design given in 
	 * Appendix B.
    */
   cli();
   int debounce, cycles;
   // Wait for LM393 to become sane. >2V.
   // Basically, debounce.
   do
   {
		OCR1B = 60;
      if (PINB & (1 << PB3))
         debounce++;
      while(!PINB & (1 << PB3))
         debounce = 0;
   } while (debounce < 100);
   sei();
}

void cryo(uint8_t howmany)
{
	OCR1A = 0;
	OCR1B = 0;

	for(int i; i <= howmany; i++)
		sleeper();
	start_timer0();
	start_timer1();
	toca_counter = 0;
	while(toca_counter < 100);
		idle();
	start_vreg();
	return;
}

struct {
   uint8_t init : 1;
   uint8_t brighten : 1;
   uint8_t darken : 1;
   uint8_t wait : 1;
   uint8_t sleepy : 1;
} firefly;                                                                                                                                 

int randstepdelay (void)
{
   return rand() % 300 + 100;
}
int randstatedelay (void)
{
   return rand() % 3000 + 1000;
}
int randluminosity(void)
{
   return rand() % 255;
}

void brightness(int newbright)
{
	OCR1A = pgm_read_byte(&(cie[newbright]));
}


void crybabycry(void)
{
   static uint8_t maxbright, curbright, cycles, cyclesdone;

   if (firefly.init)
   {
      firefly.init = 0;
      firefly.brighten = 1;
      if (cyclesdone >= cycles)
      {
         cycles = rand() % 5;
			//cycles = 1;
         cyclesdone = 0;
      }
      toca_limit = randstepdelay();
      maxbright = randluminosity();
   }

   else if (firefly.wait && firefly.darken)
   {
      cyclesdone++;
      firefly.wait = 0;
      firefly.darken = 0;
      if (cyclesdone >= cycles) {
         firefly.sleepy = 1;
      }
      else
         firefly.init = 1;
   }

   else if (firefly.wait && firefly.brighten)
   {
      firefly.wait = 0;
      firefly.brighten = 0;
      firefly.darken = 1;
      toca_limit = randstepdelay();
   }

   else if (firefly.brighten)
   {
      curbright++;
      brightness(curbright);
      if (curbright == maxbright)
      {
         firefly.wait = 1;
         toca_limit = randstatedelay();
      }
   }

   else if (firefly.darken)
   {
      curbright--;
      brightness(curbright);
      if (curbright == 1)
      {
         firefly.wait = 1;
         toca_limit = randstatedelay();
      }
   }

   else if (firefly.sleepy)
   {
			toca_counter = 0;
			while(toca_counter < 100)
				idle();
			cryo(3);
         firefly.sleepy = 0;
         firefly.init = 1;
   }
	toca_counter=0;
}


int main(void)
{
	
	asm("sei");
	start_timer0();
	start_timer1();
	firefly.init = 1;
	while(1)
	{
		crybabycry();
		while(toca_counter < toca_limit)
			// If we don't have anything else to do... Sleep!
			idle();
	}
}
