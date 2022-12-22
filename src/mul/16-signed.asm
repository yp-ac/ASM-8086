; 16-bit signed
.MODEL SMALL
.DATA 
    NUM1 DW -1107h
    NUM2 DW 1312h  
    PROD DD ?
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AX, NUM1
        MOV BX, NUM2
        IMUL BX       ; DX:AX = AX * SIGNED 16-bit source
           
        MOV PROD, AX 
        LEA SI, PROD
        MOV [SI + 02h], DX
           
        MOV AH, 4Ch
        INT 21h
    MAIN ENDP 