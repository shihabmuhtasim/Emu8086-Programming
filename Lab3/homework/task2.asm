.MODEL SMALL
.STACK 100H
.DATA
A DB "Please insert two characters for comparison$"
B DB "Output: Greater one is$"

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;Suppose AL and BL contain extended ASCII characters. Display the one that comes first in the character sequence. 
    ;prompt
    Lea dx, A
    mov ah,9
    int 21h  
    
    
    ;input
    mov ah,1
    int 21h
    
    mov bh,al
    int 21h
    mov bl,al 
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    ;compare 
    
    cmp bh,bl
    jg block1
    jmp block2


block1: 
mov dl,bh
Mov ah,2
Int 21H
jmp exit

block2: 
mov dl,bl
Mov ah,2
Int 21H
jmp exit
     
   
exit:
    MAIN ENDP
END MAIN