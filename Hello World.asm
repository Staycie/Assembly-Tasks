.MODEL SMALL
.STACK 100H
.DATA
    MESSAGE DB 'HELLO WORLD $'

.CODE

MOV AX, @DATA           ;initialize DS
MOV DS, AX

MOV AH, 9
MOV DX, OFFSET MESSAGE  ;print  MESSAGE
INT 21H

MOV AH, 4CH             ;back to dos
INT 21H 

END