.MODEL SMALL
.STACK 100H
.DATA

A DB "Please insert two numbers for division$" 
                   
                   
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
     
            
            
            
    ;Task2
    
    LEA DX,A 
    mov ah,9
    int 21h
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    ;input 1
    
    Mov AH,1
    INT 21H
    
    Mov bh,al
    Sub bh,30h 
    
    ;input 2 
    Mov AH,1
    INT 21H
    
    Mov bl,al
    Sub bl,30h 
    
    Mov al,bh
    Mov ah,0h
    
    Div bl
    Mov cl,al
   
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    ;output 
    add cl,30h
    mov dl,cl
    mov ah,2
    int 21H
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
     
    
    
    ; Multiplication
    ;Task2 
    
    LEA DX,A 
    mov ah,9
    int 21h
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    ;input 1
    
    Mov AH,1
    INT 21H
    
    Mov bh,al
    Sub bh,30h 
    
    ;input 2 
    Mov AH,1
    INT 21H
    
    Mov bl,al
    Sub bl,30h
    
    Mov al,bh
    
    Mul bl
    
    mov dl,ah
    mov ah,2
    int 21h
    
    mov dl,al
    mov ah,2
    int 21h
    
    
    
    
    
      
    
    
    
    
    
   

    MAIN ENDP
END MAIN