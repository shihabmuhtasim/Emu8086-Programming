.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;Put the sum of 1 + 4 + 7+ .. + 148 in AX.
    
    mov ax,1 
    
    
    mov bx,148
    
    block:
    
    add dx,ax
     
    add ax,3
    
    cmp ax,bx
    jg exit
    
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

