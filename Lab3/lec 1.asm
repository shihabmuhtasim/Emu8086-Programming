.MODEL SMALL
.STACK 100H
.DATA
A db "AX is pos$" 
B db "BX is 0$"
C db "BX is neg$"
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here 
    Mov ax,-5
    mov bx,0
    
    cmp ax,bx
    jg block_1
    je block_2
    jl block_3
    
  
  
block_1:
    mov ah,9
    lea dx,A
    int 21h 
    jmp exit
    
    
block_2:
mov ah,9
lea dx,B
int 21h
 
block_3:
mov ah,9
lea dx,C
int 21h
    
    
     
   
exit:
    MAIN ENDP
END MAIN