.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;If AL contains 1 or 3, display o; if AL contains 2 or 4 display "e".
    
    mov al,1 
    mov bl,1
    cmp al,bl
    je zero
    mov bl,3
    cmp al,bl
    je zero
    
    mov bl,2
    cmp al,bl
    je e
    mov bl,4 
    cmp al,bl
    je e
 zero:
 mov dl,30h
 mov ah,2
 int 21h
 jmp exit
    
e:
 mov dl, 45h
 mov ah,2
 int 21h
 jmp exit      
   
exit:
    MAIN ENDP
END MAIN