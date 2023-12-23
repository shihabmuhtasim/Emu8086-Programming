.MODEL SMALL
.STACK 100H
.DATA

x db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
temp db 0

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;print while idx<15 
    mov si,0
    Mov ah,2

    block:
    cmp si,15
    jg exit
    mov dl,x[si]
    cmp dl,10
    jge div_block
    
    add dl,30h
    Int 21H
    add si,3
    
    jmp block
    
div_block:
   mov al,dl
   mov ah,0
   mov ch,10
   div ch
   
   mov temp,ah 
   
   
   mov dl,al
   mov ah,2
   add dl,30h
   int 21h
   
   mov dl,temp
 
   add dl,30h
   int 21h
   
   add si,3   
   cmp si,0Eh
   jg exit
   jmp block 
      
    
    
 exit:

      
   

    MAIN ENDP
END MAIN