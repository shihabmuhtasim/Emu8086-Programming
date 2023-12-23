.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;Put the sum 100 + 95 + 90 + ... + 5 in AX.
    
    mov ax,100 
    
    
    mov bx,5
    
    block:
    
    add dx,ax
     
    sub ax,5
    
    cmp ax,bx
    jl exit
    
    jmp block  
    
    
    
      
exit: 

mov ax,dx
mov dx,0
mov cx,1000
div cx 
add al,30h 
mov bx,dx
mov dl,al 
mov ah,2
int 21h

mov ax,bx
mov dx,0
mov cx,100
div cx 
add al,30h 
mov bx,dx
mov dl,al 
mov ah,2
int 21h

mov ax,bx
mov dx,0
mov cx,10
div cx 
add al,30h 
mov bx,dx
mov dl,al 
mov ah,2
int 21h


mov ax,bx
mov dx,0
mov cx,1
div cx 
add al,30h 
mov bx,dx
mov dl,al 
mov ah,2
int 21h

   

    MAIN ENDP
END MAIN 

