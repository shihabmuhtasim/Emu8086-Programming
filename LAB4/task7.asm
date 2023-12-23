.MODEL SMALL
.STACK 100H
.DATA

store db ?
end db ?

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    mov dl,0
    s:
    Mov AH,1
    INT 21H
    
    mov bh,0
    mov cl,al ; store f seq firsts
    mov bl,al 
    
    
     
    block:  
    inc bh
    inc bl
    
    Mov AH,1
    INT 21H
    
    cmp al,20h
    mov end,al
    je block4 
     
     
    cmp al, bl
    je block
    
    jmp block2
    
block2:

    
    mov ch,0
    mov store,al ; store s seq firsts
    mov bl,al
     
    block3:  
    inc ch
    inc bl
    
    Mov AH,1
    INT 21H
    
    mov end,al
    je block4 
     
     
    cmp al, bl
    je block3 
    
    jmp block4
    
    
    

block4:
mov bl,store
cmp bh,ch
jge block5
jmp block6



block5:
cmp dl,bh
jl block5a

cmp end,20h
je exit
jmp s

block6:
cmp dl,ch
jl block6a
cmp end,20h
je exit
jmp s

block5a:
mov dl,bh
mov dh,cl
cmp end,20h
je exit
jmp s

block6a:
mov dl,ch
mov dh,bl
cmp end,20h
je exit
jmp s



   
    
    
 exit:
 mov bh,dl
 blockp: 
 mov dl,dh
 mov ah,2
 int 21h
 inc dh
 dec bh
 cmp bh,0
 jle out
 jmp blockp
 
 
 out:
      
   

    MAIN ENDP
END MAIN