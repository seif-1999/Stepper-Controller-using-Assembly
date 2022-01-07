

.def delayMultiplier = r25			; outer loop counter, the inner loop (l1) = 10ms is repeated "delayMultiplier" number of times

.equ l1		 = 20000				; inner loop counter, repeat 20,000 times for 10ms as a total


 delay:								; saved used registers
	  push r27
	  push r26
	  push r25
	  

	  
	
 loop2:								; start outer loop by intializing a counter for the inner loop
    
	  ldi r26, LOW(l1)				; Load lower part of counter to r26
	  ldi r27, HIGH(l1)				; load higher part of counter to r27
	  
loop1:								; start the inner loop
	  sbiw r26, 1					; decrement the inner loop counter
	  brne loop1					; if inner loop counter != 0, keep in inner loop

	  dec delayMultiplier			; dec the outer loop counter
	  brne loop2					; if outer loop counter != 0, jump to outer loop

	  
	  pop r25						; retrieve saved registers
	  pop r26
	  pop r27


	  ret							
