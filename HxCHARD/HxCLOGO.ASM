;
;	HXCLOGO/ASM		;HxC Hi Res Logo
;
*MOD
BRK	DEFL	0		;Enable Breakpoints

;======================================
	IF	SEG
	CSEG
	ENDIF
;======================================

;*=*=*
;
;*=*=*
LOGOON:
	CALL	GRCLS
	CALL	GROVLON
	CALL	GRON

	LD	A,(GRMOD)
	AND	3
	OR	0B0H
	LD	(GRMOD),A
	OUT	(83H),A

	LD	HL,HXCLOGO
	IFEQ	MODEL,3
	LD	DE,164<8+45
	ENDIF
	IFEQ	MODEL,4
	LD	DE,212<8+61
	ENDIF
	LD	C,26
$?LON1:	LD	A,D
	INC	D
	OUT	(81H),A
	LD	A,E
	OUT	(80H),A
	LD	B,18
$?LON2:	LD	A,(HL)
	INC	HL
	OUT	(82H),A
	DJNZ	$?LON2
	DEC	C
	JR	NZ,$?LON1

	RET

;*=*=*
;
;*=*=*
LOGOOFF:
	JP	GROFF

;*=*=*
;
;*=*=*
GRON:	LD	A,(GRMOD)
	SET	0,A
	LD	(GRMOD),A
	OUT	(83H),A
	RET

;*=*=*
;
;*=*=*
GROFF:	LD	A,(GRMOD)
	RES	0,A
	LD	(GRMOD),A
	OUT	(83H),A
	RET

;*=*=*
;
;*=*=*
GROVLON:
;	LD	A,01H
;	OUT	(8EH),A
	LD	A,(GRMOD)
	RES	1,A
	LD	(GRMOD),A
	OUT	(83H),A
	RET

;*=*=*
;
;*=*=*
GROVLOFF:
;	LD	A,0H
;	OUT	(8EH),A
	LD	A,(GRMOD)
	SET	1,A
	LD	(GRMOD),A
	OUT	(83H),A
	RET
;*=*=*
;
;*=*=*
GRCLS:	LD	A,(GRMOD)
	AND	3
	OR	0B0H
	LD	(GRMOD),A
	OUT	(83H),A
	LD	C,240
$?CLS1:	LD	A,C
	DEC	A
	OUT	(81H),A
	LD	B,80
	XOR	A
	OUT	(80H),A
$?CLS2:	OUT	(82H),A
	DJNZ	$?CLS2
	DEC	C
	JR	NZ,$?CLS1
	RET

;======================================
	IF	SEG
	DSEG
	ENDIF
;======================================

GRMOD:	DB	0

HXCLOGO:
	DB	000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,0F0H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,007H,0FCH,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,07FH,0F0H,01FH,03CH,000H,000H,00FH,0FEH,003H,0F8H,000H,0FEH,000H,03FH,080H,000H,070H
	DB	001H,0C3H,0E0H,03EH,000H,000H,000H,03CH,00FH,007H,03CH,003H,0C3H,080H,0F0H,0E0H,003H,0F0H
	DB	007H,003H,0E0H,07CH,000H,000H,000H,0E0H,007H,00EH,00EH,007H,001H,081H,0C0H,060H,01FH,0E0H
	DB	003H,003H,0C0H,0F8H,000H,000H,001H,0C0H,006H,00CH,00EH,00EH,001H,0C3H,080H,070H,011H,0E0H
	DB	003H,087H,080H,0F8H,007H,0C3H,0C7H,000H,002H,000H,01EH,01EH,001H,0C7H,080H,070H,003H,0C0H
	DB	000H,087H,0FFH,0E0H,01FH,0FFH,0CFH,000H,000H,000H,07CH,03CH,003H,0CFH,000H,0F0H,003H,0C0H
	DB	000H,00FH,081H,0E0H,001H,0F0H,01EH,000H,000H,000H,0E0H,03CH,003H,0CFH,000H,0F0H,007H,080H
	DB	000H,01FH,001H,0C0H,001H,0E0H,01EH,000H,000H,003H,080H,03CH,003H,0CFH,000H,0F0H,007H,080H
	DB	000H,01EH,003H,080H,003H,0E0H,03EH,000H,000H,00EH,000H,03CH,007H,08FH,001H,0E0H,00FH,000H
	DB	000H,03CH,003H,080H,00FH,0E0H,03EH,000H,000H,01CH,004H,03CH,00FH,00FH,003H,0C0H,01FH,000H
	DB	000H,078H,007H,001H,0BCH,070H,03FH,000H,000H,078H,018H,01EH,01EH,007H,087H,080H,03EH,000H
	DB	01DH,0F0H,007H,0F9H,0F0H,038H,01FH,080H,010H,0FFH,0F0H,00FH,07CH,003H,0DFH,000H,03EH,000H
	DB	00FH,080H,000H,000H,000H,038H,00FH,0C0H,0E1H,0FFH,0F0H,001H,0E0H,000H,078H,003H,0FFH,0C0H
	DB	000H,000H,000H,000H,000H,00CH,03BH,0FFH,080H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,000H,007H,0F8H,07EH,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
	DB	000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H

	END
