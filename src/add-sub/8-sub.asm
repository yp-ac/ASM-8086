.MODEL SMALL
.DATA 
    NUM1 DB 17h
    NUM2 DB 12h
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV Bl, NUM1
        MOV Dl, NUM2
        SUB Bl, Dl    ; SUBTRACT
        
        MOV AH, 4Ch
        INT 21h
    MAIN ENDP 
