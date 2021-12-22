
; StepperController.asm
	
	 ldi r20, 100

	rcall  FullStep
	dec r20
	brne forward

	ldi r20, 100

	rcall FullStepReverse
	dec r20
	brne reverse


	 
 	rjmp start

	.include "delay.asm"
	.include "FullStep.asm"


	 
 	