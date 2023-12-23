.MODEL SMALL
.STACK 100H
.DATA
A DB "Please insert last three digits of yourn ID:$"
res DB "Final result:$"
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;READ LINE
    LEA DX,A 
    mov ah,9
    int 21h
    ;input 
    
    Mov AH,1
    INT 21H
    ;store bh 
    Mov bh,al
    sub bh,30h
    
    Mov AH,1
    INT 21H
    ;store bl
    Mov bl,al 
    sub bl,30h
    
    Mov AH,1
    INT 21H
    ;store ch
    Mov ch,al 
    sub ch,30h
    
    
     
    
    ; mul
    mov al,bh
    mul bl
    div ch 
    mov cl,al
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    ;READ LINE
    LEA DX,res 
    mov ah,9
    int 21h 
    
    ;
    mov dl,cl
    add dl,30h
    Mov ah,2
    Int 21H
    
    
    
     
    
    
    
    
    
    
    
    
    
      
              
              

    MAIN ENDP
END MAIN