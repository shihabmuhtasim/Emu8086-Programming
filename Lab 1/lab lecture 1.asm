.MODEL SMALL
.STACK 100H
.DATA
;init varibale under .data
a db 7
;b db ?

.CODE
    MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
        
    ;code here  
    ;AX AH 8 bit: AL 8 bit
    
    ;mov ax,9  
    mov ah,9   
    mov al,10  
    
    add ah,al
    ; first value is destination 
    
    ; 9h hexa, nothing so decimal    
    ;mov bx,10
     ;addition
    ;mov ax,10
    ;mov bx,9
    
    ;add bx,ax
              
              
              
    ;subtraction
    
    ;mov bh,21
    ;mov cl, 9
    ;sub bh, cl 
    
    ; same bit subs or add 
    ; destination - source and store in destination 
    
    ; small-big
    ;mov bh,7
    ;mov cl, 9
    ;sub bh, cl 
    ; 2's compliment neg value 
    
    ;inc bh 
    ; increase 1
    ;dec bh
    ; decrease 1 
    
    
    ;multiplication- byte 
    
    ;mov al,11
   ; mov bh,3
    ;mul bh
    ;byte multiplication: saves 16 bit into ax , always keep one in al      
    
    ;word multiply : keep one at ax  , result HB-dx, LB- ax
    mov ax,1000h
    mov bx,333h
    mul dx
    
    
    
    
    MAIN ENDP
 
 END MAIN