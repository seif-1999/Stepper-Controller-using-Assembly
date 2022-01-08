posAdjst:

 
 .def totalSteps = r22
 .def temp = r23
 .def rem = r24
 .def to = r30

 ldi totalSteps, 200		
 mul totalSteps, ADCResH	; the Result of the multiplication is stored in r0, r1

 ;**************************************************************************load divisor & divident***********************************************************
 ldi dv16uL, 255
 clr dv16uH					;load 255 to the divisor register

 mov dd16uL, r0			; load the previous multiplcation result to the divident register
 mov dd16uH, r1
 ;*************************************************************************************************************************************************************

 rcall div16u				; preform the division, the result is the target position.


 mov temp, dres16uL
 sts target, temp
 
 repeat:					; repat until target is reached


 lds to, target

 lds temp, current			; load current position

 sub to, temp				; subtract current pos from target pos to get steps count

 breq again					; start over if target = current
 brlo reverse				; branch to reverse if current > target
 brsh forward				; if current < target
 
 again:
 rjmp start


 forward:
 cpi to, 5
 brlo again
 
 lds temp, current			; load current position
 inc temp				      	; increament current position
 sts current, temp			; store current position
 rjmp endForward

 reverse: 
 cpi to, 5
 brlo again
 lds temp, current			; load current position
 dec temp				        	; increament current position
 sts current, temp			; store current position

 endforward:

  ; divide current by 4 and get the remainder which either 0, 1, 2, or 3
  lds temp, current
  mov dd8u, temp			; move current position to divident
  ldi dv8u, 4				; put 4 to divisor

  rcall div8u				; preform division

  mov rem, drem8u
  
 ;as switch case
 subi rem, 0
 breq StepOne			 	; if rem == 0 do jump to step sequence 0
 dec rem			     		; if not 0, sub 1 
 breq StepTwo				; if rem == 1 jump to step sequence 1	
 dec rem				     	; if not 0, sub 2 
 breq StepThree				; if rem == 2 jump to step sequence 2
 brne StepFour				; if rem == 3 jump to step sequence 3


 StepOne:
 rcall step0
 rjmp again

 StepTwo:
 rcall step1
 rjmp again

 StepThree:
 rcall step2
 rjmp again

 StepFour:
 rcall step3
 rjmp again					; start over to update till all steps are finished

