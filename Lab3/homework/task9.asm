.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;Write a program to check whether a number is divisible by 5 and 11 or not.
    
    mov ax,55
    mov bx,57
    mov ch,5
    
    mov cl,11
    
    div ch
    
    cmp ah,0h
    jl exit
    jg exit 
    
    mov ax,bx
    div cl
    
    je block1
    
    
block1:
mov al,1
      
 exit:

    MAIN ENDP
END MAIN