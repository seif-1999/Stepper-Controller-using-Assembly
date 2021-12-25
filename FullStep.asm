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
