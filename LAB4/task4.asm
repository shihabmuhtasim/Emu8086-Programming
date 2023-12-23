.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;The following algorithm may be used to carry out multiplication of two positive numbers M and N by repeated addition. 
           
    Mov ax,4
    Mov bx, 6
    Mov dx,0
    
    
    block: 
    add dx,ax
    sub bx,1
    cmp bx,0
    je exit
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