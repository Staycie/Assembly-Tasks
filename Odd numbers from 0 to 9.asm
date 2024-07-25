.MODEL SMALL
.STACK 100H
.DATA
   PROMPT DB 'The odd numbers from 0 to 9 is : $'
.CODE

MOV AX, @DATA   ;initialize DS
MOV DS, AX

LEA DX, PROMPT  ;print PROMPT
MOV AH, 9
INT 21H
	
MOV CX, 5
MOV AH, 2
MOV DL, 48

@LOOP:
 INT 21H
 INC DL
 INC DL
	 
 DEC CX
JNZ @LOOP
	
MOV AH, 4CH     ;back to dos
INT 21H

END












