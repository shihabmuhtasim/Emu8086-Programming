.MODEL SMALL
.STACK 100H
.DATA

;start prompt
A DB ", please insert your password:$"
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

;define arr
F  DB "Enter Username:$"
arr db length dup(?)

length db 0 

extra_len db ?

G  DB "Your Username is:$" 

u_count db 0 

u_flag db ?

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;code here
    ;username input
    
    ;Welcome prompt
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
    
    ;username
    
    LEA DX,F 
    mov ah,9
    int 21h
    
    ;take inputand store push in stack n count length
    mov si,0
    block: 
    Mov AH,1
    INT 21H
    
    cmp al,20h
    je arr_make
    
    add length,1
    mov ah,0
    push ax
     
    jmp block
    
    ;take from stack and put inside array from last to first
    arr_make:
    ;new line
    Mov dl,0Ah
    Mov ah,2
    Int 21H
    
    Mov dl,0Dh
    Mov ah,2
    Int 21H
    
    Mov dh, length
    mov extra_len,dh
    
    sub length,1 
    mov cl,length
    mov ch,0
     
    ;basicall set the username length-1 in SI iterate arr from last idx
    mov si,cx 
    
    append:
    pop dx
    mov arr[si],dl
    sub si,1
    cmp si,0
    jl  append_exit
    jmp append
    
    append_exit:
    mov si,0
    
    ;just printing the username that we got as a prompt
    printer:
    mov dl,arr[si]
    Mov ah,2
    Int 21H 
    add si,1 

    cmp si,cx
    jg pass_start
    jmp printer  
    
    ;#######################PASS TAKING START####################
    
    ;init prompts
    pass_start:  
    
    ;enter pass prompt

    LEA DX,A 
    mov ah,9
    int 21h  
    
    ;init counter for length of the password
    mov bh,0h
    
    ;main loop
    ;si to check if username in pass 
    mov si,0
    
    input:  
    Mov AH,1
    INT 21H 
    
    ;exit if space
    cmp al,20h
    je exit
    
    
    ;#####check for username######
    cmp al, arr[si]
    
    je u_add
    jmp u_reset
    
     
    u_add:
    inc u_count
    mov cl,length
    mov ch,0
    cmp si,cx
    ;when whole array matches, set a flag
    je u_reset
    inc si
    
    jmp seq_block  
    
    u_reset: 
    mov cl,extra_len
    cmp u_count, cl 
    ; this is when whole array matches so flag set (once match is enough)
    je flag_set 
    jmp u_reset_2 
    
    flag_set: 
    mov u_flag, cl
    
    u_reset_2:
    ; if mismatched so need to restart checking of array
    mov si,0
    mov u_count,0
    
    
    
    seq_block:
    ;check for same sequence####### 
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
    ;Flag set
    mov same_flag,3h
    jmp inputx 
    
    same_reset:
    ;count resets
    mov same,1
    
    
       
    inputx:
    ;next increase for next val matching w prev val ######### 
    ;1 is added to this nexxt and the prev val was stored in the last iteration in next
    inc next
    
    cmp next,al
    je nextcount
    jmp next_reset
    
    nextcount:
    inc  seq 
    ; flag set when 3 captured
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
    ;store for same seq checking as well
    mov s_check,al
    
    ;count len of pass
    inc bh 
    
    cmp al,30h
    ;from start of digits block
    jge dig1
    ;special chars upto first digits block
    jmp special_first
    
 
    
 dig1:
 cmp al,39h 
 ;if less then digit count else others
 jle dig2
 jmp letterup_block

 dig2:
 inc digit
 ;back to input
 jmp input
 
 letterup_block:
 cmp al,41h
 jge letterup1
 jmp special_mids  ; 3a to 40
 
 letterup1:
 cmp al,5Ah
 ;if less then upper letters
 jle letterup2 
 ;else others
 jmp letterlow_block
 
 letterup2:
 inc letterup 
 jmp input
 
 
 letterlow_block:
 cmp al,61h
 ;if greater then low possible
 jge letterlow1
 ;middle specials
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
       
 
 mov ch,extra_len
 ;u_flag has the username length set if it exists in pass 
 cmp u_flag, ch 
 je u_name_weak
 jmp len_block
 
 u_name_weak:
 mov bh,0
 jmp final
 
 len_block:
 ;1
 ;bl has total criterias fullfilled count
 mov bl,0
 
 cmp bh,8
 jge point_len
 ;less than 8 len very weak- bl set to 0 so anyways its gon be very weak 
 jmp final 
 


 ;2
 digit_count:
 ;min 1 digits
 cmp digit,1
 ;update digit
 jge point_digit
 
 ;3
 upper_count:
 ;min 1 upper 
 cmp letterup,1
 jge point_upper
 ;4
 lower_count:
 ;min 1 lower
 cmp letterlow,1
 jge point_lower
 ;5
 char_count:
 ;min 1 char
 cmp special,1
 jge point_char
 ;6
 seq_count:
 ;max seq 2 eg 12, 45
 cmp seq_flag,3
 jl point_seq 
 ;7
 same_count:
 ; max same seq 2, eg 11, 55, ab
 cmp same_flag,3
 jl point_same
 
 jmp final
 
 ;1
 point_len:
 ;len is okay so next check
 inc bl
 jmp digit_count
 ;2
 point_digit:
 inc bl
 jmp upper_count
 ;3
 point_upper:
 inc bl
 jmp lower_count 
 ;4
 point_lower:
 inc bl
 jmp char_count 
 ;5
 point_char:
 inc bl
 jmp seq_count 
 ;6
 point_seq:
 inc bl
 jmp same_count
 ;7
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