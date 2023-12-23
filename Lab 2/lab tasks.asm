.MODEL SMALL
.STACK 100H
.DATA

A DB "Please insert a character$" 
                   
                   
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;Task 1
    ;1 
    
    LEA DX,A
    MOV AH,9
    INT 21H
    
    ;carriage return output
    MOV DL,0Dh
    MOV AH,2
    INT 21H 
    
    ;new line ascii 0Ah
    
    MOV DL,0Ah
    MOV AH,2
    INT 21H
      
    
    
    Mov Ah,1
    INT 21H  
            
            
            
    ;Task2
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
    
    
    add bh,bl
    
    add bh,30h
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    ;output 
    mov dl,bh
    mov ah,2
    int 21H
    
    
    
      
    
    
    
    
    
   

    MAIN ENDP
END MAIN