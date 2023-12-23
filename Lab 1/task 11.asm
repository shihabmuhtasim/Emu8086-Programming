.MODEL SMALL
.STACK 100H
.DATA
 a dw 1d
 b dw 2d
 c dw 3d
 d dw 5d 
 e db ?

.CODE
    MAIN PROC  
    ;variable init
    MOV AX,@DATA
    MOV DS,AX
    
     
    mov ax,0d
    
    
    
    
    ;task 11   
    mov dx,0d
    mov ax, a
    mov bx, c
    sub bx,ax 
    ; stored 3-1=2 in bx
    
    mov ax,bx
    mov bx, d
    
    div bx 
    ;result in ax  3-1/5
    
    mov cx,2 
    add cx,a  
    ; 1+2=3 in cx    
    mul cx
    ; hb in dx, lb in ax
    
    mov bx, ax
    mov cx,dx
    
    
    mov dx, a
    mov ax,b
    
    mul dx
    ; result of 1*2=2 in hb in dx and lb in ax
    
    
    ;now add 
    mov cx,3
    add cx,2
    
    sub cx,ax
    add bx,cx
    
    
    
    
    
    
    
    
    
    
    
        
    
    
    
    
    MAIN ENDP
 
 END MAIN