.MODEL SMALL
.DATA 
    NUM1 DW 0017h
    NUM2 DW 0302h
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV BX, NUM1
        MOV DX, NUM2
        SBB BX, DX  ; Subtract with borrow
        
        MOV AH, 4Ch
        INT 21h
    MAIN ENDP 