DAT 	SEGMENT
MESG	DB		'PLEASE ENTER !',0DH,0AH,'$'
DAT 	ENDS
CODE	SEGMENT
		ASSUME	CS:CODE,DS:DAT	
BEG:	MOV		AX,DAT
		MOV		DS,AX
		MOV		AH,9
		MOV		DX,OFFSET MESG
		INT		21H
		MOV		AH,1
		INT		21H
		CMP		AL,3AH
		JC		NEXT1
		SUB		AL,7H
NEXT1:  SUB		AL,30H
		MOV		BL,AL
		MOV		AH,2
		MOV		DL,'='
		INT		21H
		CALL	DISP 
        MOV		AH,2
        MOV		DL,'B'
        INT		21H
EXIT:   MOV		AH,4CH
		INT		21H
;--------------------------
DISP	PROC
	
	    MOV		CX,8
LAST:	MOV		DL,'0'
		RCL		BL,1
		JNC		NEXT2
		MOV		DL,'1'
NEXT2:  MOV		AH,2
		INT     21H
		LOOP	LAST
	ret

DISP endp	
CODE ENDS
     END    BEG			
				