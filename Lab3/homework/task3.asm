.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here 
    ;If AX contains a negative number, put -1 in BX; if AX contains 0, put 0 In BX; if AX contains a positive number, put 1 in BX. 
    Mov AX, -10
    Mov CX, 0
    cmp ax,cx
    jl minus
    jg one
    je zero 
    
    
 minus:
 mov bx, -1h
 jmp exit
 
one:
 mov bx, 1h
 jmp exit
 
zero:
 mov bx, 0h
 jmp exit
   
 exit:
    MAIN ENDP
END MAIN