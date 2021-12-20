label:
 .def r3  = ADCRes
 .def r16 = target
 .def r38 = current
 .def r28 = steps
 ldi 
 ;rcall ADCStartConv ; get pot value (ToDo palce in main to) placed in  the ISR temporarily
 ; "calculate the target steps"
 ldi r5, 200		
 mul r5, ADCRes		
 mov r16, r5		
 ldi r17, 255		
 rcall div8u		
 mov target, r16	; move result to ""target

 sub traget, current; get new steps count
 breq start			; start over if target = current
 brmi reverse		; branch to reverse if current > target
 rjmp forward		; if current > target

 forward:
 inc current

 reverse: 
 dec current


  ;(to do) divide current by 4 and get the remainder
 ldi del, 5 ;set daly value
 ; like as switch case

 mov r17, rem
 breq StepOne
 subi r17, 1
 breq SteoTwo
 mov  r17, rem
 subi r17, 2 
 breq StepThree
 brne StepFour


 StepOne:
 rcall step0

 SteoTwo:
 rcall step1

 StepThree:
 rcall step2

 StepFour:
 rcall step3

 rjmp label ; start over to update till all steps are finished
