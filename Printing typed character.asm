.MODEL SMALL
.STACK 200H
.DATA
    NLINE DB 0DH,0AH,'$'
    MSG1 DB 'Enter a character: ','$'
    MSG2 DB  'The character you type is: ','$'

.CODE

MOV AX,@DATA	;initialize DS
MOV DS,AX

LEA DX,MSG1	    ;print MSG1
MOV AH,09H
INT 21H

MOV AH,01H	    ;read the character
INT 21H

MOV BL,AL	    ;save the character in BL
               
LEA DX,NLINE	;add line
MOV AH,09H
INT 21H

LEA DX,MSG2	    ;print MSG2
MOV AH,09H
INT 21H

MOV AH,02H	    ;print the character
MOV DL,BL
INT 21H

MOV AH,4CH	    ;back to dos
INT 21H        

END
