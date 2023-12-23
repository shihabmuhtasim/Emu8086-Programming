.MODEL SMALL
.STACK 100H
.DATA
A db "AX is greater than BX$" 
B db "BX is greater than AX$"
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here 
    Mov ah,-70
    mov bh,-70
    add ah,bh 
    
    mov ax,5
    mov bx,3
    cmp ax,bx
    jg block_1
    ; if not greater  
    jmp block_2
    ;jg >
    ;jl <
    ;>= jge
    ;<= jle
    ;je ==
    ;jmp unconditional
  
  
block_1:
    mov ah,9
    lea dx,A
    int 21h 
    jmp exit
    
    
block_2:
mov ah,9
lea dx,B
int 21h

    
    
     
   
exit:
    MAIN ENDP
END MAIN