

 ADCIntial:
			push r16
			

			; use r16 as a mask

			ldi  r16, (1<<7) ; Enable ADC
			ori   r16, (1<<3) ; ADC interrupt enable
			ori   r16, (1<<2) ; ADC clock pre-scaler (/64)
			ori   r16, (1<<1) ; ADC clock pre-scaler (/64)
			out  ADCSRA, r16 ; Move this config to the ADC control register

			
			
			in r16, ADMUX
			ori r16, (1<<5)
			out ADMUX, r16 ; left adjust the adc result to read high byte only for lower resolution
			
			in r16, SREG
			ori r16, (1<<7)
			out SREG, r16


			pop r16

 ret


 ADCStartConv:
 
			 push r16
			
			

			 in r16, ADCSRA
			 ori r16, (1<<6)
			 out ADCSRA , r16
			  

			
			 pop r16
 ret

