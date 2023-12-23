.MODEL SMALL
.STACK 100H
.DATA
A DB "Not palindrom$"
len db ?
upto db ?

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here Input a word and check whether the word is palindrome or not.
    ;len
    Mov AH,1
    INT 21H
    sub al,30h
    mov len,al
    
    mov ah,0
    mov bh,2
    
    div bh
    mov upto,al
    cmp ah,0
    je even
    jmp odd
    
    even:
    
    mov bl,upto
    
    mov cl,len

    mov ch,0
    
    input_even:
    Mov AH,1
    INT 21H
    
    cmp cl,bl
    jle popper
    
    
    mov ah,0
    push ax
    jmp looper
    
     popper:
     pop dx
     cmp dl,al
     jne not_palindrom
    
    looper:
    loop input_even
    
    jmp exit
        
 odd:
    mov bl,upto
    add bl,1
    
    mov cl,len

    mov ch,0
    
    input_odd:
    Mov AH,1
    INT 21H
    
    cmp cl,bl
    je no 
    jl odd_popper
    jg pusher
    no:
    jmp odd_looper
    
    pusher:
    mov ah,0
    push ax
    jmp odd_looper
    
     odd_popper:
     pop dx
     cmp dl,al
     jne not_palindrom
    
    odd_looper:
    loop input_odd
    
    jmp exit
      
   
not_palindrom:
 LEA DX,A 
mov ah,9
int 21h


exit:

    MAIN ENDP
END MAIN