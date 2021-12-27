          ;*********************************************************************delay.asm file*******************************************************************
	  .def L2L = r24
	  .def L2H = r25
	  .equ l1 = 20000


 delay:
	  push r16
	  push r17
	  push r18
	  push r19
	  push r20
	
 loop2:
    
	  ldi L2L, LOW(l1)
	  ldi L2H, HIGH(l1)
	  
loop1:
	  sbiw L2L, 1
	  brne loop1

	  dec delayMultiplier
	  brne loop2

	  pop r20
	  pop r19
	  pop r18
	  pop r17
	  pop r16

	  ret
