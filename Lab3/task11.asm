.MODEL SMALL
.STACK 100H
.DATA
A db "NOT traingle$" 
B db "YES traingle$"

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;task7 
    Mov bh,5
    Mov bl,bh
    
    
    mov ch,7 
    mov cl,ch
    
    mov dh,15  
    
    
    ;add 1
    add bh,ch
    
    cmp bh, dh
    
    jl block_1
    
    ;add 2
    add ch,dh
    cmp ch, bl
    
    jl block_1
    
    ;add 3
    add bl,dh
    cmp bl, cl
    
    jl block_1
    
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