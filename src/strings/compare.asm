DISPLAY MACRO ADDRESS
    MOV AH, 09H
    LEA DX, ADDRESS
    INT 21H
ENDM    

ASSUME DS:DATA CS:CODE

.DATA SEGMENT
    STRING1 DB 'AISHVARYA$'
    STRING2 DB 'AISHVARYA$'
    MSGE DB 'EQUAL$'
    MSGNE DB 'NOT EQUAL$'
DATA ENDS

CODE SEGMENT
    START: 
        MOV AX,DATA
        MOV DS,AX 
        MOV ES,AX
        
        LEA SI, STRING1
        LEA DI, STRING2 
                   
        ; Calculate the Length dynamically           
        MOV CX, 0000h
        LEA BX, STRING1
        LENLOOP:         
            INC CX       
            INC BX
            CMP [BX], '$' ; '$' denotes end of a string
        JNE LENLOOP    
            
        REP CMPSB
        JE EQUAL   
        
        DISPLAY MSGNE
        JMP LAST
        
        EQUAL:
            DISPLAY MSGE
            
        LAST:
            MOV AH,4CH
            INT 21H
    CODE ENDS
END START
