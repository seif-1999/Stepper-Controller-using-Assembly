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
   
   delay:
   MOV R1,#200D ; 200 x 50 ms = 10 sec
   D1:
   MOV TH1,#3CH
   MOV TL1,#B0H
   D2:
   JNB TF1,D2 ; timer overflow in 50 ms
   CLR TF1
   DJNZ R1,D1 
   ret
	 
