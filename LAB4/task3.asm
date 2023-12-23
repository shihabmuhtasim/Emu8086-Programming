.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;Read a five character password and overprint it by executing a carriage return and displaying five X's. You need not store the input characters anywhere.  
    
    
    mov ah,1 
    mov cx,5
    block:
    int 21h
    loop block
    
        Mov dl,0Dh
    Mov ah,2
    Int 21H   
    
    mov ah,2
    mov dl,58h 
    mov cx,5
    block1:
    int 21h
    loop block1
    
    
    
    

    MAIN ENDP
END MAIN