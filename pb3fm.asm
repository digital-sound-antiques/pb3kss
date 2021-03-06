;;; PLAYBALL3 PLAY INITIALIZER

BASE	EQU	0300H
	
DRV0	EQU	BASE + 0000H	; OPLL.BIN
DRV1	EQU	BASE + 247BH	; OPLL0.BIN
BGM1	EQU	BASE + 3A9AH	; OPLL1.BIN
BGM2	EQU	BASE + 4920H	; OPLL2.BIN
BGM3	EQU	BASE + 5795H	; OPLL3.BIN
BGM4	EQU	BASE + 66C0H	; OPLL4.BIN
BGM5	EQU	BASE + 6FC8H	; OPLL5.BIN
DRV2	EQU	BASE + 7DD0H	; ENDOPLL.BIN
	
	ORG 100H

START:	LD	HL,20H ; Emulate RST 20H BIOS Function 
	LD	(HL), 0C3H
	LD	HL,DCOMPR
	LD	(21H),HL

	LD	(ASAVE),A
	SRL	A
	SRL	A
	SRL	A
	SRL	A
	CP	07H
	JR	C,SKIP
	XOR	A
SKIP:	LD	HL,JMPTBL
	SLA	A
	LD	E,A
	LD	D,00H
	ADD	HL,DE
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	JP	(HL)
	
DCOMPR: LD A,H ; Compare HL and DE
	CP D
	RET NZ
	LD A,L
	CP E
	RET

ASAVE:	DB	00H

JMPTBL:	DEFW	OPLL0,OPLL1,OPLL2,OPLL3,OPLL4,OPLL5,OPLL6

MUSIC0:	DEFW	0B3BEH,0AE6EH,0BF59H,0BFA1H,00000H,00000H,00000H,00000H
MUSIC1:	DEFW	0C200H,0C53DH,0C901H,0CD15H,00000H,0B983H,0B9F7H,0BA43H
MUSIC2:	DEFW	0C200H,0C618H,0CA45H,0CD04H,0BA8EH,0BADFH,0BB1EH,0BB6EH
MUSIC3:	DEFW	0C200H,0CA3FH,0CE6CH,00000H,0BB8FH,0BC28H,0BC72H,0BCA9H
MUSIC4:	DEFW	0C200H,0C53DH,0C901H,00000H,0BCEDH,0BD42H,0BD7DH,00000H
MUSIC5:	DEFW	0C200H,0C53DH,00000H,00000H,00000H,00000H,00000H,00000H
MUSIC6:	DEFW	0BAD2H,0B767H,0C41AH,0C440H,00000H,00000H,00000H,00000H

	;; Load Driver 0 (contains BGM)
LDDRV0:	LD	HL,DRV0
	LD	DE,0A000H
	LD	BC,0247BH
	LDIR
	RET

	;; Load Driver 1
LDDRV1:	LD	HL,DRV1			
	LD	DE,0AB80H
	LD	BC,0161FH
	LDIR
	LD	A,0C3H
	LD	(0A000H),A
	LD	A,0A0H
	LD	(0A001H),A
	LD	A,0ABH
	LD	(0A002H),A
	RET

	;; Load Driver 2
LDDRV2:	LD	HL,DRV2			
	LD	DE,0A930H
	LD	BC,02000H
	LDIR
	LD	A,0C3H
	LD	(0A000H),A
	LD	A,030H
	LD	(0A001H),A
	LD	A,0A9H
	LD	(0A002H),A
	RET
	
	;; Load BGM
LDBGM:	LD	DE,0C200H
	LD	BC,01000H
	LDIR
	RET

	;; Init Driver 0
INIT0:	CALL	0AA44H
	RET

	;; Init Driver 1
INIT1:	CALL	0B5B8H
	RET

	;; Init Driver 2
INIT2:	CALL	0B3A7H
	RET

OPLL0:	CALL	LDDRV0
	CALL	INIT0
	LD	HL,MUSIC0
	JP	PLAY

OPLL1:	CALL	LDDRV1
	LD	HL,BGM1
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC1
	JP	PLAY

OPLL2:	CALL	LDDRV1
	LD	HL,BGM2
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC2
	JP	PLAY
	
OPLL3:	CALL	LDDRV1
	LD	HL,BGM3
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC3
	JP	PLAY
	
OPLL4:	CALL	LDDRV1
	LD	HL,BGM4
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC4
	JP	PLAY
	
OPLL5:	CALL	LDDRV1
	LD	HL,BGM5
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC5
	JP	PLAY

OPLL6:	CALL	LDDRV2
	CALL	INIT2
	LD	HL,MUSIC6
	JP	PLAY

PLAY:	LD	A,(ASAVE)
	AND	07H
	SLA	A
	LD	E,A
	LD	D,0
	ADD	HL,DE
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	JP	(HL)

	DEFS	BASE
	
	END