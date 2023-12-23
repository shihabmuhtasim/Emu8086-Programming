.MODEL SMALL
.STACK 100H
.DATA 

a db 5
b db 10
c db 15  
x db 4h
y db 3h 
z db 6h  

p db 6 
q db 11
r db 9
s db 15

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 

    ;code here
    ;Task1
    Mov AX,5782h
    Mov Bx,Ax  
    
    ;Task2
    Mov Ax,6063h
    Mov Bx,7073h
    
    Mov Cx,Ax
    Mov Ax,Bx
    Mov Bx,Cx
    
    ;Task5
    Mov Ax,4114h
    Mov Bx,5115h
    
    Add Ax,Bx
    Sub Bx,Ax
    Add Ax,Bx
    Neg Bx
    
    
    ;Task6
    ;a  
    Mov Bh,b
    Sub Bh,a
    Mov a,Bh  
    
    ;b
    Inc a
    neg a
    
    ;c 
    Mov a,5
    inc b
    Mov Bh,b
    Add Bh,a 
    Mov c,Bh
    
    ;d 
    Mov a,5
    dec a
    Mov Ah,a  
    Sub b,Ah
    
    ;Task7
    ;c
    
    Mov al, x
    Mov bl,y
    Mul bl
    
    ;div
    Div z
    
    
    ;Task 8     
    ;1    
    Mov Dx,2h
    Mov Ax, 36DFh
    Mov bh, 0AFh
    Mul bh  
    
    ;2  doubt
    Mov Dx,8A32h
    Mov Ax,0F4D5h
    Mov Bx,0C9A5h
    Div Bx
             
    ;3
    Mov Ax,0CA92h
    Mov Bx, 0BAF9h   
    Mul Bx  
    
    ;4
     
    Mov Ax, 0ABCDh
    Mov Dx,0000h

    Mov Bx,0BEDh
    Div Bx  
    
    Mov Bx,0C2A2h
    Mul Bx
    
    ;Other sec quiz q(25/5)+3*4-4
    
    Mov ax, 25  
    Mov bh, 5
    Div bh
    Mov cl,al
    
    Mov al, 3
    Mov bl, 4
    Mul bl
    
    Add al,cl
    
    Mov bl,4
    
    Sub al,bl
    
    ; p=6, q=11,r=9, s=15   r/(s/(q-p))   
    
    Mov bh,q
    Sub bh,p     
    
    Mov al,s 
    Mov ah,0h
    Div bh 
    
    Mov bh,al 
    Mov al,r
             
    Div bh 
    
    ;Task11  (1 + 2) * (3 - 1) / 5 + 3 + 2 - (1 * 2)  
    
    Mov bh,3
    Mov bl,1
    sub bh,bl  ;3-1=2
    
    Mov al,bh
    Mov bh,5
    Div bh  ;2/5
     
    Mov bh,al
    
    Mov al,2
    Mov ah,1
    Add al,ah  ;2+1=3  
    
    Mul bh ;3*2/3
    
    Mov bx,3
    Mov cx,2
    Mov dx,2
    
    Add ax,bx
    Add ax,cx
    Sub ax,dx
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    

    MAIN ENDP
END MAIN