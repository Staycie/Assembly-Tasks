.MODEL SMALL
.STACK 200H
.DATA
    NLINE DB 0DH,0AH,'$'
    MSG1 DB 'Enter a small letter: ','$'
    MSG2 DB  'The letter you typed is: ','$'

.CODE

MOV AX,@DATA	;initialize DS
MOV DS,AX

LEA DX,MSG1	    ;print MSG1
MOV AH,09H
INT 21H

MOV AH,01H	    ;read a letter
INT 21H

MOV BL,AL	    ;save the letter in BL

MOV AH, 02H	    ;return carriage
MOV DL, 0DH
INT 21H

LEA DX,NLINE	;add line
MOV AH,09H
INT 21H

LEA DX,MSG2	    ;print MSG2
MOV AH,09H
INT 21H

SUB BL, 20H	    ;cover lower to upper

MOV AH,02H	    ;print the letter
MOV DL,BL
INT 21H

MOV AH,4CH	    ;back to dos
INT 21H

END
