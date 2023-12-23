.MODEL SMALL
.STACK 100H
.DATA
A DB "Please insert first four letter of yourn name in uppercase letterr:$"          
B DB "Reversed Output:$"
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
    
    Mov AH,1
    INT 21H
    ;store bl
    Mov bl,al 
    
    Mov AH,1
    INT 21H
    ;store ch
    Mov ch,al 
    
    Mov AH,1
    INT 21H
    ;store cl
    Mov cl,al 
    
    ; add
    add bh,20h
    add bl,20h
    add ch,20h
    add cl,20h 
    
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H 

    ;READ LINE
    LEA DX,B 
    mov ah,9
    int 21h
    
    
    
     
    
    ;
    mov dl,cl
    Mov ah,2
    Int 21H
    
    mov dl,ch
    Mov ah,2
    Int 21H
    
    mov dl,bl
    Mov ah,2
    Int 21H
    
    mov dl,bh
    Mov ah,2
    Int 21H
    
    
    
    
    
    
    
      
              
              

    MAIN ENDP
END MAIN