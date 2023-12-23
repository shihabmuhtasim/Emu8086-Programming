.MODEL SMALL
.STACK 100H
.DATA
A DB "Largest odd number:$"   

B DB "Averasge of even numbers:$"

arr db 2,1,3,0,1,6,1,0

sum db 0
count db 0

max db -1
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    
    mov cx,8
    mov si,0
    
    adder:  
    
    mov al,arr[si] 
    mov bl,al ;temp
    inc si
    mov ah,0
    
    mov bh,2
    div bh 
    
    cmp ah,0
    je even
    jmp odd
    
    even: 
    add sum,bl
    inc count
    jmp looper 
    
    odd:
    cmp bl,max
    jg odd_up
    jmp looper
    
    odd_up:
    mov max,bl
    
    
    looper:
    loop adder
    
    
    
    output:
    LEA DX,A 
    mov ah,9
    int 21h
    
    mov dl,max
    add dl,30h
    mov ah,2
    int 21h
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    
    Mov ah,2
    Int 21H
    
    LEA DX,B 
    mov ah,9
    int 21h
    
    
    
    average:
    mov al,sum
    mov ah,0
    mov bh,count
    div bh
    
    mov dl,al
    add dl,30h
    mov ah,2
    int 21h
     
    
    
    
    
    
   
    
    
 exit:

      
   

    MAIN ENDP
END MAIN