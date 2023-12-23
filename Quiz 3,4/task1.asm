.MODEL SMALL
.STACK 100H
.DATA

A DB "Vehicle speed in (km/h) 12:$"  

B DB "No Punishment$"
C DB "1000 tk fine$"
D DB "Licence suspended for a month$"

store dw ?

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;prompt
    LEA DX,A 
    mov ah,9
    int 21h 
     ;input  
    Mov AH,1
    INT 21H
    

    
    
    ; dec 30 as input as ascii
    sub al,30h 
    
    ;mul 12
    mov bh,12
    
    mul bh
    ; 5*12 is in ax
    
    mov cx,49
    ;id
    
    ;range
    mov dx,cx
    add dx,15  
    
    
    
    ;less hoile
    cmp ax,cx
    jl no_punishment 
    ; range e hoile
    cmp ax,dx
    jle fine 
    
    ; outta range
    jmp sus
    
    
 no_punishment:
     LEA DX,B 
    mov ah,9
    int 21h
    jmp exit
    
    
fine:
    LEA DX,C 
    mov ah,9
    int 21h
    
    jmp exit    
    
    
     
sus:   
    
     LEA DX,D 
    mov ah,9
    int 21h   
    
      
 exit:

    MAIN ENDP
END MAIN