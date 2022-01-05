
 ;****************************************ADC Intialization************************************
 ADCIntial:
			push r16					; Save R16
			

			; use r16 as a mask

			ldi  r16,	 (1<<7)			; Enable ADC
			ori  r16,	 (1<<3)			; ADC interrupt enable
			ori  r16,	 (1<<2)			; ADC clock pre-scaler (/64)
			ori  r16,	 (1<<1)			; ADC clock pre-scaler (/64)
			out  ADCSRA, r16			; Move this config to the ADC control register

			
			
			sbi ADMUX, 5				; left adjust the adc result to read high byte only for lower resolution
			
		
			in r16	,	SREG			; Enable
			ori r16 ,   (1<<7)			; Global
			out SREG,   r16				; Interrupts

			pop r16						; Retrive R16

		    ret
;**********************************************************************************************


 ;****************************************Start Conversion************************************
 ADCStartConv:
 
			 sbi ADCSRA, 6				; set bit 6 in ADCSRA to start conversion
			
			 ret

;**********************************************************************************************
