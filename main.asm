;StepperController.asm

.include "m32def.inc"		;load the ATmega32 directory which include rigsters' & bits' named and addresses

	
	.def ADCResL = r2
	.def ADCResH = r3 ; r2, r3 must be saved
	; define motor pins			
	.equ A1				 = PB4
	.equ A2				 = PB5
	.equ B1				 = PB6
	.equ B2				 = PB7




	.cseg					;directive defines the start of a Code segment
	.org 0x00				;indicates orgin address in flash to start code 
	rjmp main
	.org 0x020
	rjmp ADCDoneISR
	.org 0x100

	main:
;*********** Stack intialization**********

		ldi	r21,LOW(RAMEND)		; initialize 
		out	SPL,r21			; stack pointer ;do not need to save r21
		ldi	r21,HIGH(RAMEND)	; to RAMEND
		out	SPH,r21			; do not need to save r21
;****************************
		; set all portb as output
		 ser r16
		 out DDRB, r16 			;do not need to save r16
		 out ddrd, r16
;*************************

		clr r16				; do not need to save r16
		sts current, r16 		; intialize current position to 0
						
		ldi r16, 5			;do not need to save r16
		sts delaySingleStepping, r16    ; intialize delay of single steps to 5


	rcall 	ADCIntial





	rcall ADCStartConv

	


start:


	rjmp  posAdjst

 	rjmp start


;*****************************

	.include "delay.asm"
	.include "FullStep.asm"
	.include "HalfStep.asm"
	.include "Division.asm"
	.include "pot.asm"
	.include "ADC.asm"
	.include "Stack.asm"

;*************ADC ISR******************
	ADCDoneISR:

	 push r16

	

			  			;read ADC here
			  in ADCResL, ADCL
			  in ADCResH, ADCH
			  rcall ADCStartConv 	; to start a new conversion as soon as the old one is done


			 
			 
			  pop r16
	reti

;******************************


	.dseg 					 ; directive defines the start of a Data segment
	
	current: .byte 1			 ; hold current position in steps
	divResult: .byte 1 			 ; holds division result
	delaySingleStepping: .byte 1
