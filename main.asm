
	.include "m32def.inc"		;load the ATmega32 directory which include rigsters' & bits' named and addresses

	
	
	.def ADCResL = r2
	.def ADCResH = r3 ; r2, r3 must be saved

	.def Mode	 = r31


	; define motor pins			
	.equ A1				 = PC0
	.equ A2				 = PC1
	.equ B1				 = PC3
	.equ B2				 = PC2
	.equ MOTOR			 = PORTC
	.equ MotorDataD		 = DDRC



	.cseg						; indicates that what follows is code
	.org 0x00					; indicates orgin address in flash to start  
	rjmp main					; Create a main subroutine
	.org 0x020					; Start ISR at 0x020
	rjmp ADCDoneISR				; Create an ISR for ADC conversion end interrupt
	.org 0x100					; start the rest of the code from address 0x100


	main:						; The main subroutine


;******************************* Stack intialization****************************
			ldi	r30,LOW(RAMEND/2)		; initialize 
			out	SPL,r30				; stack pointer ;do not need to save r30
			ldi	r30,HIGH(RAMEND/2)	; to RAMEND
			out	SPH,r30				; "				;do not need to save r30
;********************************************************************************
		
	

;*********************************Intialize ports*********************************
		; Set portD as an output
		 ser r16	   
		 out MotorDataD, r16			;do not need to save r16
		 out PORTB, r16
		 clr r16
		 out DDRB, r16
		
;***************************************************************************



;*********************************Intialize Variables************************
		clr r16							; do not need to save r16
		sts current, r16				; intialize current motor position to 0
;******************************************************************************


;***************************Intialize ADC & start converting*******************
		rcall 	ADCIntial

		rcall ADCStartConv
;********************************************************************************
	



		
start:							; Start of the loop
		

		; Check mode at the beining of each cycle


		in Mode, PINB			; Read PortB actual values in Mode  
		andi Mode, 3


		
		cpi Mode, 0				; Subtract 0 from mode to compare with 0
		breq mode3				; if Sw == 00 jump to mode 3


		
		
		cpi Mode, 1
		breq mode2				; if Sw == 01 jump to mode 2

		
		
		
		cpi Mode, 2 
		breq mode1				; if Sw == 10 jump to mode 1

	
		
		
		cpi Mode, 3
		breq mode0				; if Sw == 11 jump to mode 0

		
		


;*************************************************Mode0****************************************
mode0:
								; Mode0: do nothing
		clr r16
		out PORTC, r16			; turn all coils off
		rjmp start
;**********************************************************************************************



;*************************************************Mode1****************************************

mode1:							; Mode1: Full stepping
								; X steps forward at speed ?, then Y steps reverse at speed?

		ldi r29, 20				; Intialize a counter

forwardStep:


		in Mode, PINB			; Read PortB actual value to make sure no change in mode occured
		andi Mode, 3			; mask to read only the first two bits of PINB register

		subi Mode, 2			; If Mode is changed,
		brne start				; Jump to "Start"
		
		
		
		rcall  FullStep			; If Mode is not changed, proceed with current mode
	

		
		dec r29					; Decrement Steps counter
		brne forwardStep		; Repeat till X steps is done

		 

		ldi r29, 20				; Intialize counter for reverse steps

reverseStep:


		in Mode, PINB			; Read PortB actual value to make sure no change in mode occured
		andi Mode, 3			; mask to read only the first two bits of PINB register
		 
		subi Mode, 2			; If Mode is changed (!= 2),
		brne start				; Jump to "Start"

		
		

		rcall FullStepReverse	; If Mode is not changed, proceed with current mode
		

		dec r29				; Decrement Steps counter
		brne reverseStep		; Repeat till Y steps is done
		
		rjmp start				; Jump to the start of the main loop when done
		
;**********************************************************************************************



;*************************************************Mode2****************************************

mode2:							; Mode2: Half Stepping
								; X half steps forward at speed ?, then Y half steps reverse at speed?



		ldi r29, 20				; Intialize a counter

forwardHalf:

		in Mode, PINB			; Read PortB actual value to make sure no change in mode occured
		andi Mode, 3			; mask to read only the first two bits of PINB register

		subi Mode, 1			; If Mode is changed (!== 1),
		brne start				; Jump to "Start"


		rcall  HalfStep			; If Mode is not changed, proceed with current mode
		dec r29					; Decrement Steps counter
		brne forwardHalf		; Repeat till X steps is done

		ldi r29, 20				; Intialize a counter

reverseHalf:

		in Mode, PINB			; Read PortB actual value to make sure no change in mode occured
		andi Mode, 3			; mask to read only the first two bits of PINB register
		subi Mode, 1			; If Mode is changed (!== 1),
		brne start				; Jump to "Start"


		rcall HalfStepReverse	; If Mode is not changed, proceed with current mode
		dec r29					; Decrement Steps counter
		brne reverseHalf		; Repeat till Y steps is done

		rjmp start				; Jump to the start of the main loop when done
		
;**********************************************************************************************


;*************************************************Mode3****************************************

mode3:							; Mode3: Control Position with a Potentiometer


		rjmp  posAdjst			;Jump to posAdjst subroutine to calculate and move to target postion

;**********************************************************************************************





 		rjmp start				; End of main loop





;***********************************Directories Includes*******************************************

	.include "delay.asm"
	.include "FullStep.asm"
	.include "HalfStep.asm"
	.include "Division.asm"
	.include "pot.asm"
	.include "ADC.asm"
	.include "Stack.asm"
;**************************************************************************************************


;****************************************ADC ISR***************************************************
ADCDoneISR:
		  

		  ;read ADC here
		  in ADCResL, ADCL		; Read ADC converion result
		  in ADCResH, ADCH
		  rcall ADCStartConv	; to start a new conversion as soon as the old one is done

		   
		  reti					

;******************************************************************************************


	.dseg									 ; Data segment start

	
	current:			 .byte 1			 ; hold current position in steps
	target:				 .byte 1			 ; hold Traget position in steps
