
 .equ halfDel = 2
 .equ halfDelRev = 5


 HalfStep:
 
  ; Step 0.5
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 cbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDel
	 rcall delay
  
; Step 1.0
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 sbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDel
	 rcall delay

; Step 1.5
	 cbi MOTOR, A1
	 cbi MOTOR, A2
	 sbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDel
	 rcall delay

; Step 2.0
	 cbi MOTOR, A1
	 sbi MOTOR, A2
	 sbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDel
	 rcall delay

; Step 2.5
	 cbi MOTOR, A1
	 sbi MOTOR, A2
	 cbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDel
	 rcall delay

; Step 3.0
	 cbi MOTOR, A1
	 sbi MOTOR, A2
	 cbi MOTOR, B1
	 sbi MOTOR, B2

	 ldi delayMultiplier, halfDel
	 rcall delay

; Step 3.5
	 cbi MOTOR, A1
	 cbi MOTOR, A2
	 cbi MOTOR, B1
	 sbi MOTOR, B2

	 ldi delayMultiplier, halfDel
	 rcall delay

; Step 4.0
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 cbi MOTOR, B1
	 sbi MOTOR, B2

	 ldi delayMultiplier, halfDel
	 rcall delay


ret


HalfStepReverse:
   
  ; Step 4.0
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 cbi MOTOR, B1
	 sbi MOTOR, B2

	 ldi delayMultiplier, halfDelRev
	 rcall delay

; Step 3.5
	 cbi MOTOR, A1
	 cbi MOTOR, A2
	 cbi MOTOR, B1
	 sbi MOTOR, B2

	 ldi delayMultiplier, halfDelRev
	 rcall delay

 ; Step 3.0
	 cbi MOTOR, A1
	 sbi MOTOR, A2
	 cbi MOTOR, B1
	 sbi MOTOR, B2

	 ldi delayMultiplier, halfDelRev
	 rcall delay
	
 ; Step 2.5
	 cbi MOTOR, A1
	 sbi MOTOR, A2
	 cbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDelRev
	 rcall delay

 ; Step 2.0
	 cbi MOTOR, A1
	 sbi MOTOR, A2
	 sbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDelRev
	 rcall delay

 ; Step 1.5
	 cbi MOTOR, A1
	 cbi MOTOR, A2
	 sbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDelRev
	 rcall delay

  ; Step 1.0
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 sbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDelRev
	 rcall delay
	
 ; Step 0.5
	 sbi MOTOR, A1
	 cbi MOTOR, A2
	 cbi MOTOR, B1
	 cbi MOTOR, B2

	 ldi delayMultiplier, halfDelRev
	 rcall delay
	 
   
ret
