.MODEL SMALL
.STACK 100H
.DATA
A DB "Please insert four entries for first 2x2 matrix:$" 
B DB "Please insert four entries for second 2x2 matrix:$"
C DB "Addition of the given 2x2 matrixes:$"


arr1 db 4 dup(?)
arr2 db 4 dup(?)

temp db 0 


store_al db 0

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    LEA DX,A 
    mov ah,9
    int 21h
    
    mov si,0
    mov cx,4
    block1:
    Mov AH,1
    INT 21H
    
    sub al,30h
    mov arr1[si],al
    
    inc si
    loop block1
    
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
    
    
    mov si,0
    mov cx,4
    block2:
    Mov AH,1
    INT 21H
    
    sub al,30h
    mov arr2[si],al
    
    inc si
    loop block2 
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    LEA DX,C 
    mov ah,9
    int 21h
    
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    
    
    mov si,0
    mov cx,4
    
    block3:
    cmp si,2
    je new_line
    
    jmp else
    
    new_line:
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    else:
    mov bh,arr2[si]
    add arr1[si],bh
    mov al,arr1[si]
    mov ah,0
    mov bh,10
    div bh
    mov temp,ah
    
    cmp al,0
    je direct
    jmp indirect
    
    
    direct:
    mov dl,arr1[si]
    add dl,30h 
    Mov ah,2
    Int 21H
    
     
    
    
    jmp looper
    
    indirect:
    mov dl,al
    add dl,30h 
    Mov ah,2
    Int 21H
    
    mov dl,temp
    add dl,30h 
    Mov ah,2
    Int 21H
    
    jmp looper
    
    
    looper:
    Mov dl,20h
    Mov ah,2
    Int 21H
    
    inc si

    loop block3
    
     
exit:   

    MAIN ENDP
END MAIN