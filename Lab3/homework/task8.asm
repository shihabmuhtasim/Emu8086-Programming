.MODEL SMALL
.STACK 100H
.DATA
A DB "Please insert a letterr in uppercase:$" 
B DB "Output vowel$"  
C DB "Output consonent$" 

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;Write a program to input any alphabet and check whether it is vowel or consonant.
   
    LEA DX,A 
    mov ah,9
    int 21h
    
    ;input 1
    
    Mov AH,1
    INT 21H
    
    mov bh, 41h
    mov bl, 45h
    mov ch, 4Fh
    mov cl, 49h
    mov dh, 55h  
    
    cmp al,bh
    je block1
        cmp al,bl
    je block1
        cmp al,ch
    je block1
        cmp al,cl
    je block1
        cmp al,dh
    je block1 
    
    jmp block2
    
 
    
    
    cmp al,bh
    jl exit
    
    cmp al,ch
    jle block1
    
block1:
    LEA DX,B 
    mov ah,9
    int 21h
jmp exit

block2:
    LEA DX,C 
    mov ah,9
    int 21h
jmp exit    
    
    
    
exit:   
    MAIN ENDP
END MAIN