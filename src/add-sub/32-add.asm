; Addition of 32 bit numbers
.MODEL SMALL
.DATA 
    NUM1 DD 12344417h
    NUM2 DD 1432E342h 
    SUM  DD ?
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV BX, NUM1      ; LOAD LSB      
        LEA SI, NUM1
        MOV AX, [SI + 02] ; LOAD MSB 
        
        MOV DX, NUM2      ; LOAD LSB
        LEA SI, NUM2
        MOV CX, [SI + 02] ; LOAD MSB
        
        ADC BX, DX        ; SETS carry flag to 1, if carry is generated for ADD/ADC
        ADC AX, CX        ; ADD with carry, will add the carry flag in AX
        
        MOV SUM, BX       ; STORE LSB of result
        LEA SI, SUM
        MOV [SI + 02], AX ; STORE MSB of result
        
        MOV AH, 4Ch
        INT 21h                                
    MAIN ENDP  
