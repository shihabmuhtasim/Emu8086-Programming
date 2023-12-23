.MODEL SMALL
.STACK 100H
.DATA
 a dw 1
 b dw 2
 c dw 3
 d dw 5 
 e db ?

.CODE
    MAIN PROC  
    ;variable init
    MOV AX,@DATA
    
    ;code here  
    mov ax, 5h
    mov bx, 8h
    
    mov cx,ax
    mov ax,bx
    mov bx,cx
              
    ;task 4
    
    mov ax, 11
    mov bx, 9
    sub bx, ax  
    neg bx
    
    
    ;task multiplication
    ;mov al,5
    ;mov bl,9
    
    ;mul bl  
    
    
    ;byte Division : ax e 16 bit store
    mov ax,16
    mov bh, 3
    div bh  
    
    ; word div: divident 32 bit
    mov dx,30ABh 
    mov ax,0BECDh
    ;30ABBECD/400A: dex- higher 16 bit and ax- lower 16 bits
    mov bx,400Ah  
    ;result Ax, remainder Dx
    div bx
    
    
    ;varibale use 
    
    mov ax,50
    add ax,a
    add a,ax ; destination a - vars in emulator after run  
    ; cant add two vars
    
    
    ;task 11
    
    
    
        
    
    
    
    
    MAIN ENDP
 
 END MAIN