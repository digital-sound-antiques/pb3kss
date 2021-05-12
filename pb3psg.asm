;;; PLAYBALL3 PLAY INITIALIZER

BASE	EQU	0300H
	
DRV0	EQU	BASE + 0000H	; PSG.BIN
DRV1	EQU	BASE + 1A0DH	; FM0.BIN
BGM1	EQU	BASE + 2C45H	; FM1.BIN
BGM2	EQU	BASE + 3ACBH	; FM2.BIN
BGM3	EQU	BASE + 4940H	; FM3.BIN
BGM4	EQU	BASE + 586BH	; FM4.BIN
BGM5	EQU	BASE + 6165H	; FM5.BIN
DRV2	EQU	BASE + 6F6DH	; ENDPSG.BIN
	
	ORG 100H

START:	LD	(ASAVE),A
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

ASAVE:	DB	00H

JMPTBL:	DEFW	PSG0,PSG1,PSG2,PSG3,PSG4,PSG5,PSG6

MUSIC0:	DEFW	0AE60H,0AB87H,0B56CH,0B5B2H,00000H,00000H,00000H,00000H
MUSIC1:	DEFW	0C200H,0C53DH,0C901H,0CD15H,0B6C0H,0B72DH,0B7A2H,0B7DDH
MUSIC2:	DEFW	0C200H,0C618H,0CA45H,0CD04H,0B81DH,0B861H,0B8B5H,0B8EDH
MUSIC3:	DEFW	0C200H,0CA3FH,0CE6CH,00000H,0B917H,0B9B8H,0BA00H,0BA3EH
MUSIC4:	DEFW	0C200H,0C53DH,0C901H,00000H,0BA84H,0BADAH,0BB19H,0BB79H
MUSIC5:	DEFW	0C200H,0C53DH,00000H,00000H,00000H,00000H,00000H,00000H
MUSIC6:	DEFW	0B775H,0B4B7H,0BE81H,0BEA5H,00000H,00000H,00000H,00000H

	;; ドライバ0(データ込み)の転送
LDDRV0:	LD	HL,DRV0
	LD	DE,0A000H
	LD	BC,03000H
	LDIR
	RET

	;; ドライバ1の転送
LDDRV1:	LD	HL,DRV1			
	LD	DE,0AB80H
	LD	BC,02000H
	LDIR
	LD	A,0C3H
	LD	(0A000H),A
	LD	A,040H
	LD	(0A001H),A
	LD	A,0ACH
	LD	(0A002H),A
	RET

	;; ドライバ2の転送
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
	
	;; BGMの転送
LDBGM:	LD	DE,0C200H
	LD	BC,01000H
	LDIR
	RET

	;; ドライバ0の初期化
INIT0:	LD	HL,0C900H	;2374	21 00 C9 	!..
	LD	DE,0C901H	;2377	11 01 C9 	...
	LD	BC,07BEH	;237A	01 BE 07 	... ; 
	LD	(HL),00H	;237D	36 00 		6.
	LDIR			;237F	ED B0 		..
	RET

	;; ドライバ1の初期化
INIT1:	LD	HL,0BE3EH	;B460	21 3E BE 	!>.
	LD	DE,0BE3FH	;B463	11 3F BE 	.?.
	LD	BC,017FH	;B466	01 7F 01 	...
	LD	(HL),00H	;B469	36 00 		6.
	LDIR			;B46B	ED B0 		..
	RET

	;; ドライバ2の初期化
INIT2:	CALL	0B247H
	RET

PSG0:	CALL	LDDRV0
	CALL	INIT0
	LD	HL,MUSIC0
	JP	PLAY

PSG1:	CALL	LDDRV1
	LD	HL,BGM1
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC1
	JP	PLAY

PSG2:	CALL	LDDRV1
	LD	HL,BGM2
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC2
	JP	PLAY
	
PSG3:	CALL	LDDRV1
	LD	HL,BGM3
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC3
	JP	PLAY
	
PSG4:	CALL	LDDRV1
	LD	HL,BGM4
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC4
	JP	PLAY
	
PSG5:	CALL	LDDRV1
	LD	HL,BGM5
	CALL	LDBGM
	CALL	INIT1
	LD	HL,MUSIC5
	JP	PLAY

PSG6:	CALL	LDDRV2
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