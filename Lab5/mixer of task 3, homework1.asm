.MODEL SMALL
.STACK 100H
.DATA


arr db length dup(?)

length db ?

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here 
    mov si,0
    block: 
    Mov AH,1
    INT 21H
    
    cmp al,20h
    je arr_make
    
    add length,1
    mov ah,0
    push ax
     
    jmp block
    
       
arr_make:
    sub length,1 
    mov cl,length
    mov ch,0
    mov si,cx
    append:
    pop dx
    mov arr[si],dl
    sub si,1
    cmp si,0
    jl  exit
    jmp append

      
exit:
mov si,0

 printer:
 mov dl,arr[si]
    Mov ah,2
Int 21H 
add si,1 

cmp si,cx
jg end
jmp printer

end:

    MAIN ENDP
END MAIN