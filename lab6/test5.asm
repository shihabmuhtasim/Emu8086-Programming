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
    mov bh,0Dh
    mov bl,0 
    mov si,0
    block:
    Mov AH,1
    INT 21H
    
    
    
    
    inc length
    cmp al,20H
    je pop 
    
    cmp al,bh
    je pop
    
    mov ah,0
    push ax
    
    inc bl
     
    
    jmp block
    
    
pop:

    
mov cl,bl
mov ch,0

pop_loop:
pop dx

mov arr[si],dl
inc si



loop pop_loop

cmp al,bh
je exit
    
mov bl,0
inc si
inc length
mov arr[si],20H

mov si,cx 

jmp block
    
   
    
    
 exit:
 ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
 
 mov cx,si
; mov ch,0
 
 mov si,0 
 

 
 arr_print:
 
 mov dl, arr[si]
 mov ah,2
 int 21h
 inc si
 

 
 loop arr_print

      
   

    MAIN ENDP
END MAIN