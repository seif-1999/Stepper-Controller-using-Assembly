/*
 * HalfStep.asm
 *   Author: Amina 
 */ 
Step 0.5
        sbi PORTB, A1
        cbi PORTB, A2
        cbi PORTB, B1
        cbi PORTB, B2
        ldi delayMultiplier, 3
        
delay:
       loop2:
	     ldi r24, LOW(2000)
             ldi r25, HIGH(2000)
       loop1:
             sbiw r24, 1 
             brne loop1
       
       dec delayMultiplier
       brne loop2  
ret

Step 1	
        sbi PORTB, A1
        cbi PORTB, A2
        sbi PORTB, B1
        cbi PORTB, B2
        ldi delayMultiplier, 3
        
delay:
       loop2:
	     ldi r24, LOW(2000)
             ldi r25, HIGH(2000)
       loop1:
             sbiw r24, 1 
             brne loop1
       
       dec delayMultiplier
       brne loop2  
ret

Step 1.5
        cbi PORTB, A1
        cbi PORTB, A2
        sbi PORTB, B1
        cbi PORTB, B2
        ldi delayMultiplier, 3 

delay:
       loop2:
	     ldi r24, LOW(2000)
             ldi r25, HIGH(2000)
       loop1:
             sbiw r24, 1 
             brne loop1
       
       dec delayMultiplier
       brne loop2  
ret

Step 2	 
        cbi PORTB, A1
        sbi PORTB, A2
        sbi PORTB, B1
        cbi PORTB, B2
        ldi delayMultiplier, 3	    

delay:
       loop2:
	     ldi r24, LOW(2000)
             ldi r25, HIGH(2000)
       loop1:
             sbiw r24, 1 
             brne loop1
       
       dec delayMultiplier
       brne loop2  
ret

Step 2.5
        cbi PORTB, A1
        sbi PORTB, A2
        cbi PORTB, B1
        cbi PORTB, B2
        ldi delayMultiplier, 3

delay:
       loop2:
	     ldi r24, LOW(2000)
             ldi r25, HIGH(2000)
       loop1:
             sbiw r24, 1 
             brne loop1
       
       dec delayMultiplier
       brne loop2  
ret

Step 3	
        cbi PORTB, A1
        sbi PORTB, A2
        cbi PORTB, B1
        sbi PORTB, B2
        ldi delayMultiplier, 3 

delay:
       loop2:
	     ldi r24, LOW(2000)
             ldi r25, HIGH(2000)
       loop1:
             sbiw r24, 1 
             brne loop1
       
       dec delayMultiplier
       brne loop2  
ret

Step 3.5
        cbi PORTB, A1
        cbi PORTB, A2
        cbi PORTB, B1
        sbi PORTB, B2
        ldi delayMultiplier, 3	    

delay:
       loop2:
	     ldi r24, LOW(2000)
             ldi r25, HIGH(2000)
       loop1:
             sbiw r24, 1 
             brne loop1
       
       dec delayMultiplier
       brne loop2  
ret

Step 4
        sbi PORTB, A1
        cbi PORTB, A2
        cbi PORTB, B1
        sbi PORTB, B2
        ldi delayMultiplier, 3	

delay:
       loop2:
	     ldi r24, LOW(2000)
             ldi r25, HIGH(2000)
       loop1:
             sbiw r24, 1 
             brne loop1
       
       dec delayMultiplier
       brne loop2  
ret
