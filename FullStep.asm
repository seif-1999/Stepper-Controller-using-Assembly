  	
	; Step 1
	 sbi PORTB, A1
	 cbi PORTB, A2
	 sbi PORTB, B1
	 cbi PORTB, B2
   rcall delay


	 ; Step 2
	 sbi PORTB, A2
	 cbi PORTB, A1
	 sbi PORTB, B1
	 cbi PORTB, B2
   rcall delay

	 ; Step 3
	 sbi PORTB, A2
	 cbi PORTB, A1
	 sbi PORTB, B2
	 cbi PORTB, B1
   rcall delay
	
	
	 ; Step 4
	 sbi PORTB, A1
	 cbi PORTB, A2
	 sbi PORTB, B2
	 cbi PORTB, B1
   rcall delay
	 
   ;FUllStepReverse:
	  ; Step 4
	 sbi PORTB, A1
	 cbi PORTB, A2
	 sbi PORTB, B2
	 cbi PORTB, B1
    rcall delay
	

	  ; Step 3
	 sbi PORTB, A2
	 cbi PORTB, A1
	 sbi PORTB, B2
	 cbi PORTB, B1
   rcall delay



	  ; Step 2
	 sbi PORTB, A2
	 cbi PORTB, A1
	 sbi PORTB, B1
	 cbi PORTB, B2
   rcall delay



	  ; Step 1
	 sbi PORTB, A1
	 cbi PORTB, A2
	 sbi PORTB, B1
	 cbi PORTB, B2
   rcall delay
   
 	.equ l1		 = 20000  
 delay:
	  push r16
	  push r17
	  push r18
	  push r19
	  push r20
	
 loop2:
    
	  ldi r24, LOW(l1)
	  ldi r25, HIGH(l1)
	  
loop1:
	  sbiw r24, 1
	  brne loop1

	  dec delayMultiplier
	  brne loop2

	  pop r20
	  pop r19
	  pop r18
	  pop r17
	  pop r16

	  ret
	 
