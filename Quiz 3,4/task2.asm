.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;bh for div add
    ;bl for non div add 
    mov bh,0
    mov bl,0  
    
    ;cx for loop seq
    mov cx,100
    ;dh for div
    mov dh,6
    
    ;21301610
    ;Shihab Muhtasim 
    
    block: 
    
    mov ax,cx
    
    div dh
    ;check if end
    cmp cx,0
    je exit
     ; remainder checker
    cmp ah,0
    je adder
    jmp adder2
    
    
         
    
adder:
add bh,cl  
;dec cx
dec cx
jmp block 


adder2:
add bl,cl
dec cx
jmp block    
      
 exit:

    MAIN ENDP
END MAIN