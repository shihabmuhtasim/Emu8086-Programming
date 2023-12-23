.MODEL SMALL
.STACK 100H
.DATA

A DB "Please insert a uppercase letterr$" 
                   
                   
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;quiz question solve
    
    LEA DX,A
    Mov ah,9
    int 21h
    ;new line
    mov dl,0Ah
    mov ah,2
    int 21h 
    mov dl,0Dh
    mov ah,2
    int 21h
    ;input
    
    mov ah,1
    int 21h
    
    mov bh,al
    sub bh,40h
    add bh,3
    
    mov al,bh
    mov ah,0h
    
    mov bh,26
    div bh
    
    add ah,40h
    mov dl,ah
    
    mov ah,2
    int 21h
    
    
    
    
                        
                        
    
    
     
    
    
    
    
    
    
      
    
    
    
    
    
   

    MAIN ENDP
END MAIN