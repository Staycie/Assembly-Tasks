.MODEL SMALL
.STACK 100H
.DATA 
   PROMPT1 DB 'Type your first integer: ' ,0DH, 0AH, '$'  ;0dh 0ah is an add line
   PROMPT2 DB 0DH, 0AH,'Type your second integer: ' ,0DH, 0AH, '$'
   PROMPT3 DB 0DH, 0AH,'The sum of the two number is: ' ,0DH, 0AH, '$'
.CODE
    MOV AX, @DATA           ;initialize DS
    MOV DS, AX
    
    MOV AH, 9               ;print PROMPT1
    MOV DX,OFFSET PROMPT1
    INT 21H
    
    MOV AH,01H              ;read char -> char to AL
    INT 21H
    
    MOV BL, AL
    
    SUB BL,30H              ;code ng zero
   
    MOV AH, 9               ;print PROMPT2
    MOV DX,OFFSET PROMPT2
    INT 21H
    
    MOV AH,01H              ;read char -> char to AL
    INT 21H
    
    SUB AL,30H
    
    MOV BH, AL              ;move AL to BH   
    
    MOV AH, 9               ;print PROMPT3
    MOV DX,OFFSET PROMPT3
    INT 21H                 ;AL = 24H
    
     
    ADD BH, BL
    
    ADD BH,30H
    
    MOV DL,BH
    
    MOV AH,02H              ;dispplay char -> char in DL
    INT 21H
    
  
    MOV AH,4CH              ;back to dos
    INT 21H    
   
END