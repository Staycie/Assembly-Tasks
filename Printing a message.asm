.MODEL SMALL
.STACK 200H
.DATA
    NLINE DB 0DH,0AH,'$'
    MSG1 DB  'This is the msg. to be displayed: ','$'
    MSG2 DB  'The msg. you just entered: ','$'
    BUF  DB 10 ;the no. of chars. to be read
     DB 11 DUP('$') 

.CODE

MOV AX,@DATA        ;initialize DS 
MOV DS,AX

LEA DX,MSG1         ;print MSG1
MOV AH,09H
INT 21H

MOV AH,0AH          ;address
MOV DX,OFFSET BUF
INT 21H

LEA DX,NLINE        ;add line
MOV AH,09H
INT 21H

LEA DX,MSG2         ;print MSG2
MOV AH,09H
INT 21H

LEA DX,BUF          ;print the message
MOV AH,09H
INT 21H

MOV AH,4CH  	    ;back to dos
INT 21H

END
