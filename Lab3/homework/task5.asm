.MODEL SMALL
.STACK 100H
.DATA
A DB "Please insert a letterr:$"
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;Read a character, and if it's an uppercase letter, display it.  
   
    LEA DX,A 
    mov ah,9
    int 21h
    
    ;input 1
    
    Mov AH,1
    INT 21H
    
    mov bh, 41h
    mov ch, 5Ah 
    
    
    cmp al,bh
    jl exit
    
    cmp al,ch
    jle block1
    
block1:
mov dl,al
mov ah,2
int 21h
jmp exit

    
    
    
    
exit:   
    MAIN ENDP
END MAIN