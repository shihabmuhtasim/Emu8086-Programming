.MODEL SMALL
.STACK 100H
.DATA

A DB "Please insert an uppercase letterr:$"  
B DB "Please insert any val from A-F:$"
                   
                   
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;task3,4 similar 
    LEA DX,A 
    mov ah,9
    int 21h
    
    Mov AH,1
    INT 21H
    
    add al,20h
    
    mov dl,al 
    Mov ah,2
    Int 21H  
    
    ; new line for next task 
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    ;task5a 
    mov dl,3Fh
    Mov ah,2
    Int 21H
    ;5b similar to 2
    ; new line for next task 
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    ;Task 7
    LEA DX,A 
    mov ah,9
    int 21h
    ;input
    Mov AH,1
    INT 21H   
    
    sub al,31h
    ; ex C=43 is now 43-31=12
    
    ;seperate 1 and 2
    mov ah,0
    mov bh,10h  
    div bh
    
    ;quotent al first then remainder ah second 
    
    mov cl,ah 
    
    mov dl,al
    add dl,30h 
    Mov ah,2
    Int 21H 
    
    mov dl,cl
    add dl,30h 
    Mov ah,2
    Int 21H
    
    
    
    
    
    
    
    
    
    
    
    
     
    
    
    
    
    
    
    
    
    
    
    
    
      
    
    
    
    
    
   

    MAIN ENDP
END MAIN