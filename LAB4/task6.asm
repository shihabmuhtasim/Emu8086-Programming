.MODEL SMALL
.STACK 100H
.DATA

A DB "ENTER A HEX DIGIT:$"
B DB "ILLEGAL CHARACTER$"

C DB "DO YOU WANT TO DO IT AGAIN?$"



.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here 
    
    block:
    LEA DX,A 
    mov ah,9
    int 21h
    
    
    Mov AH,1
    INT 21H 
    
    cmp al, 30h 
    jle block2
    
    cmp al,3Ah
    jge block1
    
    mov ah,2
    mov dl,al
    int 21h
    
    LEA DX,C 
    mov ah,9
    int 21h
    
    
    Mov AH,1
    INT 21H

cmp al,4Eh
je exit
cmp al,59h
je block
    
   block1:
   
   cmp al,40h
   jle block2
   
   cmp al, 46h
   jg block2
   
   
   sub al,40h
   add al,10h 
   
   
             
             
;000000   
mov ah,0
mov cl,10h
div cl
 
add al,30h
 
mov bh,ah

mov dl,al 
mov ah,2
int 21h



mov al,bh
mov ah,0
mov cl,1
div cl
 
add al,30h
 

mov dl,al 
mov ah,2
int 21h


LEA DX,C 
    mov ah,9
    int 21h
    
    
    Mov AH,1
    INT 21H

cmp al,4Eh
je exit
cmp al,59h
je block
    
     
    
block2:

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
    jmp exit    

exit:   

    MAIN ENDP
END MAIN