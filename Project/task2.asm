.MODEL SMALL
.STACK 100H
.DATA

;start prompt
A DB "Please insert a password:$"
B DB "Welcome to password strength checker$"
C DB "Password strength:$"

;count of digits
digit db 0   
 
;letter count
letterup db 0  

letterlow db 0
;characters count
special db 0

; sequencially same char running counter
same db 1 
; same prev char store
s_check db 0

;seq inc vals store
next db 0 
;  sequencially inc char running counter
seq db 1 

;same exist if flag 3
same_flag db 0  

; seq inc exits if flag 3
seq_flag db 0 

;prompts

V DB "Very Weak password$"  

W DB "Weak password$" 

S DB "Strong password$"

E  DB "Very Strong password$" 



.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    
    ;init prompts
    LEA DX,B 
    mov ah,9
    int 21h
     
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    ;pass prompt
    LEA DX,A 
    mov ah,9
    int 21h  
    
    ;counter for length
    mov bh,0h
    
    ;main loop
    input: 
     
    Mov AH,1
    INT 21H 
    
    ;exit if space
    cmp al,20h
    je exit
    
    ;check for same sequence 
    cmp s_check, al
    je samecount
    jmp same_reset
    

    samecount:
    inc same
    ;if 3 same count then flag set
    cmp same,3
    jge set_same
    jmp inputx
    
    set_same:
    mov same_flag,3h
    jmp inputx 
    
    same_reset:
    mov same,1
    
    
       
    inputx:
    ;next increase for next val matching w prev val
    inc next
    
    cmp next,al
    je nextcount
    jmp next_reset
    
    nextcount:
    inc  seq 
    ; flag set
    cmp seq,3
    jge set_seq
    jmp inputy 
    
    set_seq:
    mov seq_flag,3h
    jmp inputy
    
    next_reset:
    mov seq,1
    
    inputy:
    ;store for next comparisons
    mov next, al
    
    mov s_check,al
    
    ;count len
    inc bh 
    
    cmp al,30h
    jge dig1
    ;special chars upto first digit
    jmp special_first
    
 
    
 dig1:
 cmp al,39h
 jle dig2
 jmp letterup_block

 dig2:
 inc digit
 jmp input
 
 letterup_block:
 cmp al,41h
 jge letterup1
 jmp special_mids  ; 3a to 40
 
 letterup1:
 cmp al,5Ah
 jle letterup2
 jmp letterlow_block
 
 letterup2:
 inc letterup 
 jmp input
 
 
 letterlow_block:
 cmp al,61h
 jge letterlow1
 jmp special_mids_low
 
 letterlow1:
 cmp al,7Ah
 jle letterlow2
 jmp special_last
 
 letterlow2:
 inc letterlow 
 jmp input    
    
 special_first:
 inc special
 jmp input
 
special_mids:
 inc special
 jmp input
 
special_mids_low:
 inc special
 jmp input 
 
special_last:
 inc special
 jmp input
    




        
      
 exit:
 
 ;bl has total criterias fullfilled count
 mov bl,0
 
 cmp bh,6
 jge point_len
 ;less than 6 len very weak 
 jmp final
 
 digit_count:
 ;min 1 digits
 cmp digit,1
 jge point_digit
 
 
 upper_count:
 ;min 1 upper 
 cmp letterup,1
 jge point_upper
 
 lower_count:
 ;min 1 lower
 cmp letterlow,1
 jge point_lower
 
 char_count:
 ;min 1 char
 cmp special,1
 jge point_char
 
 seq_count:
 ;max seq 2 eg 12, 45
 cmp seq_flag,3
 jl point_seq 
 
 same_count:
 ; max same seq 2, eg 11, 55, ab
 cmp same_flag,3
 jl point_same
 
 jmp final
 
 
 point_len:
 inc bl
 jmp digit_count
 
 point_digit:
 inc bl
 jmp upper_count
 
 point_upper:
 inc bl
 jmp lower_count 
 
 point_lower:
 inc bl
 jmp char_count 
 
 point_char:
 inc bl
 jmp seq_count 
 
 point_seq:
 inc bl
 jmp same_count
 
 point_same:
 inc bl
 
 
 
final:
;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H 
;prompt    
LEA DX,C 
mov ah,9
int 21h   

; all 7 criterials fullfilled -very strong
cmp bl,7
jge very_strong

; 5/6 criterials fullfilled-strong
cmp bl,5
jge strong
; 3/4 criterials fullfilled-weak
cmp bl,3
jge weak

; 0/1/2criterials fullfilled-very weak

LEA DX,V 
mov ah,9
int 21h
jmp outer

very_strong:
LEA DX,E 
mov ah,9
int 21h
jmp outer

strong:
LEA DX,S 
mov ah,9
int 21h
jmp outer

weak:
LEA DX,W 
mov ah,9
int 21h
jmp outer  


outer:
    MAIN ENDP
END MAIN