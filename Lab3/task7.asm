.MODEL SMALL
.STACK 100H
.DATA
A db "EVEN$" 
B db "ODD$"

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;task7 
    Mov ax,6
    
    mov bh,2
    
    div bh
    
    mov bl,0
    
    cmp ah, bl
    
    je block_1
    jmp block_2
            
    

    
  
  
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