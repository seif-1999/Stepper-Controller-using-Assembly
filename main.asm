
; StepperController.asm

	.include "m32def.inc"		;load the ATmega32 directory which include rigsters' & bits' named and addresses


	.def delayMultiplier = r19
	.equ A1				 = PB4
	.equ A2				 = PB5
	.equ B1				 = PB6
	.equ B2				 = PB7



	.cseg						;indicates that what follows is code
	.org 0x00					;indicates orgin address in flash to start code segment


	ldi	r21,LOW(RAMEND)		; initialize
	out	SPL,r21				; stack pointer
	ldi	r21,HIGH(RAMEND)	; to RAMEND
	out	SPH,r21				; "

	

	
	 ser r16
	 out DDRB, r16




start:
	 ldi r20, 100

forward:
	rcall  FullStep
	dec r20
	brne forward

	ldi r20, 100
reverse:
	rcall FullStepReverse
	dec r20
	brne reverse


	 
 	rjmp start

	.include "delay.asm"
	.include "FullStep.asm"


; StepperController.asm

