/*
 * ADCIntial.asm
 *
 *  Created: 21/12/18 9:17:07 PM
 *   Author: Seif
 */ 

 ADCIntial:
			push r16
			

			; use r16 as a mask

			ldi  r16, (1<<7) ; Enable ADC
			ori   r16, (1<<3) ; ADC interrupt enable
			ori   r16, (1<<2) ; ADC clock pre-scaler (/64)
			ori   r16, (1<<1) ; ADC clock pre-scaler (/64)
			out  ADCSRA, r16 ; Move this config to the ADC control register

			
			
			sbi ADMUX, 5; left adjust the adc result to read high byte only for lower resolution
			
		
			sbi SREG, 7

			pop r16

 ret


 ADCStartConv:
 
			
			 sbi ADCSRA, 6
			 
 ret

