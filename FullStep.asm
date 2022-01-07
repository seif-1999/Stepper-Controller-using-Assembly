


  .equ delayfull	= 5						; define delay values
  .equ delayfullRev = 5
  .equ singleStep	= 5
  	
  FullStep:

	 ; Step 1
											; move full sequence of setps forward (4steps)
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 sbi MOTOR, B1
	 cbi MOTOR, B2
	 ldi delayMultiplier, delayfull
	 rcall delay


	 ; Step 2
	 cbi MOTOR, A1
	 sbi MOTOR, A2
	 sbi MOTOR, B1
	 cbi MOTOR, B2
	 ldi delayMultiplier, delayfull
	 rcall delay
	 
	 ; Step 3
	 cbi MOTOR, A1
	 sbi MOTOR, A2
	 cbi MOTOR, B1
	 sbi MOTOR, B2
	 ldi delayMultiplier, delayfull
	 rcall delay


	 ; Step 4
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 cbi MOTOR, B1
	 sbi MOTOR, B2
	 ldi delayMultiplier, delayfull
	 rcall delay

	 ret







	 FUllStepReverse:



	  ; Step 4
												; move full sequence of setps reverse (4steps)
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 sbi MOTOR, B2
	 cbi MOTOR, B1

	 ldi delayMultiplier, delayfullRev
	 rcall delay


	  ; Step 3
	 sbi MOTOR, A2
	 cbi MOTOR, A1
	 sbi MOTOR, B2
	 cbi MOTOR, B1

	 ldi delayMultiplier, delayfullRev
	 rcall delay


	  ; Step 2
	 sbi MOTOR, A2
	 cbi MOTOR, A1
	 sbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, delayfullRev
	 rcall delay


	  ; Step 1
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 sbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, delayfullRev
	 rcall delay


	 ret

;***************************************************single stepping***********************************************
										; move single sequence of in steps  
	 step0:
	  sbi MOTOR, A1
	  cbi MOTOR, A2
	  sbi MOTOR, B1
	  cbi MOTOR, B2

	  ldi delayMultiplier, singleStep ; load delay value for single stepping
	  rcall delay

	 ret



	 step1:
	 sbi MOTOR, A2
	 cbi MOTOR, A1
	 sbi MOTOR, B1
	 cbi MOTOR, B2
	 ldi delayMultiplier, singleStep ; load delay value for single stepping
	 rcall delay

	 ret





	 step2:
	 sbi MOTOR, A2
	 cbi MOTOR, A1
	 sbi MOTOR, B2
	 cbi MOTOR, B1
	 ldi delayMultiplier, singleStep ; load delay value for single stepping
	 rcall delay

	 ret



	 step3:
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 sbi MOTOR, B2
	 cbi MOTOR, B1
	 ldi delayMultiplier, singleStep ; load delay value for single stepping
	 rcall delay

	 ret
;********************************************************************************************************

FullStep:  	
	; Step 1
	 sbi PORTB, A1
	 cbi PORTB, A2
	 sbi PORTB, B1
	 cbi PORTB, B2
	 
	 
	 ldi delayMultiplier, 5
   rcall delay


	 ; Step 2
	 sbi PORTB, A2
	 cbi PORTB, A1
	 sbi PORTB, B1
	 cbi PORTB, B2
	 
	 ldi delayMultiplier, 5
   rcall delay

	 ; Step 3
	 sbi PORTB, A2
	 cbi PORTB, A1
	 sbi PORTB, B2
	 cbi PORTB, B1
	 
	 
	 ldi delayMultiplier, 5
   rcall delay
	
	
	 ; Step 4
	 sbi PORTB, A1
	 cbi PORTB, A2
	 sbi PORTB, B2
	 cbi PORTB, B1
	 
	 
	 ldi delayMultiplier, 5
   rcall delay
	 
	 
FUllStepReverse:
	  ; Step 4
	 sbi PORTB, A1
	 cbi PORTB, A2
	 sbi PORTB, B2
	 cbi PORTB, B1
	 
	 
	 ldi delayMultiplier, 10
    rcall delay
	

	  ; Step 3
	 sbi PORTB, A2
	 cbi PORTB, A1
	 sbi PORTB, B2
	 cbi PORTB, B1
	 
	 
	 ldi delayMultiplier, 10
   rcall delay



	  ; Step 2
	 sbi PORTB, A2
	 cbi PORTB, A1
	 sbi PORTB, B1
	 cbi PORTB, B2
	 
	 
	 ldi delayMultiplier, 10
   rcall delay



	  ; Step 1
	 sbi PORTB, A1
	 cbi PORTB, A2
	 sbi PORTB, B1
	 cbi PORTB, B2
	 
	 
	 ldi delayMultiplier, 10
   rcall delay
     	
ret

