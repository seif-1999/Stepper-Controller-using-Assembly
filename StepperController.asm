	.include "m32def.inc"		;load the ATmega32 directory which include rigsters' & bits' named and addresses

	.def ADCResL = r2
	.def ADCResH = r3 ; r2, r3 must be saved
	; define motor pins			
	.equ A1				 = PD4
	.equ A2				 = PD5
	.equ B1				 = PD6
	.equ B2				 = PD7




	.cseg						;indicates that what follows is code
	.org 0x00					;indicates orgin address in flash to start code 
	rjmp main
	.org 0x020
	rjmp ADCDoneISR
	.org 0x100

	main:
;*********** Stack intialization**********

		ldi	r21,LOW(RAMEND)		; initialize 
		out	SPL,r21				; stack pointer ;do not need to save r21
		ldi	r21,HIGH(RAMEND)	; to RAMEND
		out	SPH,r21				; "				;do not need to save r21
;****************************
		; set all portb as output
		 ser r16
		 out DDRD, r16 ;do not need to save r16
		 
		 sbi PORTB, 0
		 sbi PORTB, 1





;*************************

		clr r16		; do not need to save r16
		sts current, r16 ; intialize current position to 0
						
		ldi r16, 5		;do not need to save r16
		sts delaySingleStepping, r16 ; intialize delay of single steps to 5


	rcall ADCStartConv

	


start:


		in r31, PINB
		subi r31, 0
		breq mode3 ; if Sw == 00 jump to mode 3
		dec r31
		breq mode2 ; if Sw == 01 jump to mode 2
		dec r31
		breq mode1 ; if Sw == 10 jump to mode 1
		dec r31
		breq start ; if Sw == 11 jump to mode 0

mode1:
; full step
	 ldi r20, 10

forwardStep:
	rcall  FullStep
	dec r20
	brne forwardStep

	ldi r20, 10

reverseStep:
	rcall FullStepReverse
	dec r20
	brne reverseStep

rjmp start

mode2:


;half step

	 ldi r20, 100

forwardHalf:
	rcall  HalfStep
	dec r20
	brne forwardHalf

	ldi r20, 100

reverseHalf:
	rcall HalfStepReverse
	dec r20
	brne reverseHalf
rjmp start

mode3:
rjmp  posAdjst



 	rjmp start




;*****************************

	.include "delay.asm"
	.include "FullStep.asm"
	.include "HalfStep.asm"
	.include "Division.asm"
	.include "pot.asm"
	.include "ADC.asm"




	.dseg

	
	current: .byte 1 ; hold current position in steps
	divResult: .byte 1 ; holds division result
	delaySingleStepping: .byte 1
