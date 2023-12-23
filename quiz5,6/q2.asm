.MODEL SMALL
.STACK 100H
.DATA

arr db 's','h','i','h','a','b', 'm', 'u', 'h','t','a','s','i','m'

;B a H i H S 

vol db 'a','e','i','o','u' 

temp db 5 

hold db 0

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    
    mov cx,14
    mov si,0
    stacker:
    mov bl,arr[si]
    mov bh,0
    push bx
    inc si
    loop stacker
    
    
    mov al,0
    
    poper:
    
    inc hold
    mov cx,5
    mov si,0
    pop dx
    
    
    mov bl,4
    mov bh,0
    
    
    
    checker:
    
    cmp vol[si],dl
    
    je vowel
    inc si
          
    
    loop checker
    
    
    sub dl,20h
    Mov ah,2
    Int 21H
    
    jmp looper
    
    
    
    
    vowel:
    
    
    Mov ah,2
    Int 21h
    
   
    
    looper:
    cmp hold,13
    jg exit
    jmp poper
     
    
      
    
    
    
   
    
    
 exit:

      
   

    MAIN ENDP
END MAIN