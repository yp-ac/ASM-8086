; 8-bit unsigned
.MODEL SMALL
.DATA 
    NUM1 DB 17h
    NUM2 DB 12h  
    PROD DW ?
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV Al, NUM1
        MOV Bl, NUM2
        MUL Bl       ; AX = AL * UNSIGNED 8-bit source
           
        MOV PROD, AX
           
        MOV AH, 4Ch
        INT 21h
    MAIN ENDP 
