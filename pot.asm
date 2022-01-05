 posAdjst:
 
 
 .def totalSteps = r22
 .def temp = r23
 .def rem = r24

 ;rcall ADCStartConv ; get pot value (ToDo palce in main to) placed in  the ISR temporarily
 ldi totalSteps, 200		
 mul totalSteps, ADCResH	; the Result of the multiplication is stored in r0, r1

 ;***************************************************load divisor & divident*********************************************************************
 ldi dv16uL, 255
 clr dv16uH		;load 255 to the divisor register

 movw dd16uL, r0	; load the previous multiplcation result to the divident register
 ;***********************************************************************************************************************************************

 rcall div16u	        	; preform the division, the result is the target position.

 
 lds temp, current		    ; load current position

 sub dres16ul, temp     ; subtract current pos from target pos to get steps count

 breq again			           ; start over if target = current
 brlo reverse		          ; branch to reverse if current > target
 rjmp forward		          ; if current < target
 
 again:
 rjmp start


 forward:
 lds temp, current        ; load current position
 inc temp		               ; increament current position
 sts current, temp        ; store current position
 rjmp endForward

 reverse: 
 lds temp, current        ; load current position
 dec temp		               ; decreament current position
 sts current, temp        ; store current position

 endforward:

  ; divide current by 4 and get the remainder which either 0, 1, 2, or 3
  mov dd8u, temp               ; move current position to divident
  ldi dv8u, 4                  ; put 4 to divisor

  rcall div8u                   ; preform division

  mov rem, drem8u
  
 ;as switch case
 subi rem, 0
 breq StepOne             ; if rem == 0 do jump to step sequence 1
 subi rem, 1	             ; if not 0, sub 1 
 breq StepTwo	            ; if rem == 1 jump to step sequence 1
 mov rem, drem8u          ; reload the remiander to rem
 subi rem, 2	             ; if not 0, sub 2 
 breq StepThree           ; if rem == 1 jump to step sequence 1
 brne StepFour            ; if rem == 1 jump to step sequence 1


 StepOne:
 rcall step0
 rjmp start

 StepTwo:
 rcall step1
 rjmp start

 StepThree:
 rcall step2
 rjmp start

 StepFour:
 rcall step3
 rjmp start ; start over to update till all steps are finished
