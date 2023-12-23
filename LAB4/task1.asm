.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    mov cx,80  
    
    block:
    mov dl,2Ah
    Mov ah,2  
    int 21h 
    
    loop block
    
    
    
   

    MAIN ENDP
END MAIN