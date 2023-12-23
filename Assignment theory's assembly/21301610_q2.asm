.MODEL SMALL
.STACK 100H
.DATA
A DB "Please insert a two digit number for fibonacchi series length:$" 
B DB "Fibonacci series:$"

temp dw 0 
prev dw 0
next dw 0

store_al db 0

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    LEA DX,A 
    mov ah,9
    int 21h
    
    Mov AH,1
    INT 21H
    
    sub al,30h
    mov bh,10
    mul bh
    
    
    Mov cx,ax
    
     
    
    Mov AH,1
    INT 21H
   
    sub al,30h
    mov ah,0
    
    add cx,ax
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    LEA DX,B 
    mov ah,9
    int 21h
    
    
    
    mov prev,0
    mov next,1
    
    cmp ch,2
    jle firsts
    jmp real
    
    firsts:
    
    cmp cl,1
    je zero
    
    cmp cl,2
    je one 
    
    cmp cl,0
    je exit
     
    
    ;first two
    
    real:
    mov dx,prev
    add dl,30h
    Mov ah,2
    Int 21H
    
    Mov dl,2Ch
    Mov ah,2
    Int 21H

    mov dx,next
    add dl,30h
    Mov ah,2
    Int 21H
    
    


    sub cx,2
     
    block:
    mov bx,prev 
    mov temp,bx
    mov bx,next
    add temp,bx
    mov prev,bx
    mov bx,temp
    mov next,bx 
    
    mov ax,temp
    mov bh,10
    div bh
    ;store ah,al
    mov bl,ah
    mov store_al,al
    
    cmp al,0
    je normal
    jmp two_dig
    
    normal:
    Mov dl,2Ch
    Mov ah,2
    Int 21H
    
    mov dx,temp 
    add dl,30h
    Mov ah,2
    Int 21H
    
    
    jmp looper
    
    
    two_dig:
    Mov dl,2Ch
    Mov ah,2
    Int 21H
    
    mov dl,store_al 
    add dl,30h
    Mov ah,2
    Int 21H
    
    mov dl,bl 
    add dl,30h
    Mov ah,2
    Int 21H
    
     
    
    looper:
    
    
    loop block 
    jmp exit

zero:
mov dx,prev
add dl,30h
Mov ah,2
Int 21H
jmp exit
one:
mov dx,prev
add dl,30h
Mov ah,2
Int 21H

Mov dl,2Ch
    Mov ah,2
    Int 21H

mov dx,next
add dl,30h
Mov ah,2
Int 21H
jmp exit 
     
exit:   

    MAIN ENDP
END MAIN