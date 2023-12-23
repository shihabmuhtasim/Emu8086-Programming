.MODEL SMALL
.STACK 100H
.DATA
store db ?
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here 
    ;Write a program to display the extended ASCII characters (ASCII codes 80h to FFh).
    ;Display 10 characters per line, separated by blanks. Stop after the extended characters
    ;have been displayed once.
    
    
    mov al,80h
    mov store,al
    mov bl,0FFh
    mov dh,0
    
    block:
    
    mov dl,store
    Mov ah,2
    Int 21H 
    inc al  
    mov store,al
    
    
    
    
    cmp al,bl 
    jg exit
    
    
    inc dh
    cmp dh,10
    je block1 
   
    mov dl,0h
    Int 21H
    jmp block
    

block1:
;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    mov dh,0
    jmp block
   
exit:
    MAIN ENDP
END MAIN