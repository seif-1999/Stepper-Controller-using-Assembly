;*************************
;*
;* "div8u" - 8/8 Bit Unsigned Division
;*
;* This subroutine divides the two register variables "dd8u" (dividend) and
;* "dv8u" (divisor). The result is placed in "dres8u" and the remainder in
;* "drem8u".
;*
;* Number of words	:14
;* Number of cycles	:97
;* Low registers used	:1 (drem8u)
;* High registers used  :3 (dres8u/dd8u,dv8u,dcnt8u)
;*
;*************************

;*** Subroutine Register Variables

.def	drem8u	=r15		;remainder
.def	dres8u	=r16		;result
.def	dd8u	=r16		;dividend
.def	dv8u	=r17		;divisor
.def	dcnt8u	=r18		;loop counter

;*** Code

div8u:	sub	drem8u,drem8u	;clear remainder and carry
		ldi	dcnt8u,9		;init loop counter
d8u_1:	rol	dd8u			;shift left dividend
		dec	dcnt8u			;decrement counter
		brne	d8u_2		;if done
		ret					;    return
d8u_2:	rol	drem8u			;shift dividend into remainder
		sub	drem8u,dv8u		;remainder = remainder - divisor
		brcc	d8u_3			;if result negative
		add	drem8u,dv8u		;    restore remainder
		clc					;    clear carry to be shifted into result
		rjmp	d8u_1		;else
d8u_3:	sec					;    set carry to be shifted into result
		rjmp	d8u_1

		


;*************************
;*
;* "div16u" - 16/16 Bit Unsigned Division
;*
;* This subroutine divides the two 16-bit numbers
;* "dd8uH:dd8uL" (dividend) and "dv16uH:dv16uL" (divisor).
;* The result is placed in "dres16uH:dres16uL" and the remainder in
;* "drem16uH:drem16uL".
;*
;* Number of words	:19
;* Number of cycles	:235/251 (Min/Max)
;* Low registers used	:2 (drem16uL,drem16uH)
;* High registers used  :5 (dres16uL/dd16uL,dres16uH/dd16uH,dv16uL,dv16uH,
;*			    dcnt16u)
;*
;*************************

;*** Subroutine Register Variables

.def	drem16uL=r14
.def	drem16uH=r15
.def	dres16uL=r16
.def	dres16uH=r17
.def	dd16uL	=r16
.def	dd16uH	=r17
.def	dv16uL	=r18
.def	dv16uH	=r19
.def	dcnt16u	=r20

;*** Code

div16u:	clr	drem16uL			;clear remainder Low byte
		sub	drem16uH,drem16uH	;clear remainder High byte and carry
		ldi	dcnt16u,17			;init loop counter
d16u_1:	rol	dd16uL				;shift left dividend
		rol	dd16uH
		dec	dcnt16u				;decrement counter
		brne	d16u_2			;if done
		ret						;    return
d16u_2:	rol	drem16uL			;shift dividend into remainder
		rol	drem16uH
		sub	drem16uL,dv16uL		;remainder = remainder - divisor
		sbc	drem16uH,dv16uH		;
		brcc	d16u_3			;if result negative
		add	drem16uL,dv16uL		;    restore remainder
		adc	drem16uH,dv16uH
		clc						;    clear carry to be shifted into result
		rjmp	d16u_1			;else
d16u_3:	sec						;    set carry to be shifted into result
		rjmp	d16u_1
