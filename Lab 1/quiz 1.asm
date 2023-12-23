.MODEL SMALL
.STACK 100H
.DATA

A db 5
B db 8
C db 2
D dw 4
  

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;Task1
    Mov ax,3h 
    Mov bx,2h
    Mov cx,ax  
    Mov ax,bx
    Mov bx,cx
    
    ;Task2
    Mov ah,0h
    
    Mov al,B
    Mov bh,A
    Div bh
    Mov bh,ah ; kept 8%5=3 in bh
    
    ;Mul
    Mov al,C
    Mul bh
    ;mul result in ax
    
    Add ax,D
    
    
     
    
    
   

    MAIN ENDP
END MAIN