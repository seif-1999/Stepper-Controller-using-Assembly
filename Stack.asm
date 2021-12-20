
 ;*******************************************Intialize thje stack pointer***********************
 StackPointerIntial:

					ldi	r21,LOW(RAMEND)		; initialize
					out	SPL,r21				; stack pointer
					ldi	r21,HIGH(RAMEND)	; to RAMEND
					out	SPH,r21				; 

				    ret

;*********************************************************************************************



;****************************************Push all registers************************************
 PushAll:
		push r16
		push r17
		push r18
		push r19
		push r20
		push r21
		push r22

        ret
;*********************************************************************************************



;*****************************************Pop all registers***********************************
 PopAll:

		pop r22
		pop r21
		pop r20
		pop r19
		pop r18
		pop r17
		pop r16
	    ret
;*********************************************************************************************