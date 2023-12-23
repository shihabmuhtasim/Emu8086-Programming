.MODEL SMALL
.STACK 100H
.DATA

A DB "Hello World$"
B DB "CSE341$" 
                   
                   
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;1
    Mov Ah,1
    INT 21H
    
    ;2
    ;take input it goes to AL
    Mov Ah,1
    INT 21H
    ;to see output move to dl
    Mov Dl,Al
    Mov Ah,2
    INT 21H 
    
    ;9
    LEA DX,A
    MOV AH,9
    INT 21H 
    
    LEA DX,B
    MOV AH,9
    INT 21H 
    
    ;new line
    MOV AH,1
    INT 21H
    
    ;next line automatically stores in al so 
    MOV BL,AL
    
    ;carriage return
    ;carriage return output
    MOV DL,0Dh
    MOV AH,2
    INT 21H
    
    ;new line ascii 0Ah
    
    MOV DL,0Ah
    MOV AH,2
    INT 21H
    
    MOV DL,BL
    MOV AH,2
    INT 21H
   

    MAIN ENDP
END MAIN