.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_MSG DB 'Enter password: $'
    WEAK_MSG DB 'Weak password. Try again.$'
    STRONG_MSG DB 'Strong password. Good job!$'
    PASSWORD_BUFFER DB 20, 0 ; Buffer to store user input

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt for password
    LEA DX, PROMPT_MSG
    MOV AH, 09H
    INT 21H

    ; Read user input (assume a buffer size of 20 characters)
    LEA DX, PASSWORD_BUFFER
    MOV AH, 0AH
    INT 21H

    ; Check password strength
    LEA SI, PASSWORD_BUFFER + 2 ; SI points to the start of the input buffer

    ; Check for minimum length (e.g., 8 characters)
    MOV CX, 0 ; Counter for password length
CHECK_LENGTH:
    CMP BYTE PTR [SI], 0 ; Check for null terminator
    JE  LENGTH_CHECKED
    INC SI
    INC CX
    JMP CHECK_LENGTH
LENGTH_CHECKED:
    CMP CX, 8 ; Minimum password length
    JL  WEAK_PASSWORD ; Jump to weak password message if length is less than 8

    ; Check for at least one uppercase letter, one lowercase letter, and one digit
    LEA SI, PASSWORD_BUFFER + 2 ; Reset SI to the start of the input buffer
    MOV BX, 0 ; BX will hold the flags for uppercase, lowercase, and digit

CHECK_CHARACTERS:
    MOV AL, [SI] ; Load the current character
    CMP AL, 0 ; Check for null terminator
    JE  CHARACTERS_CHECKED

    ; Check for uppercase letter
    CMP AL, 'A'
    JL  NOT_UPPERCASE
    CMP AL, 'Z'
    JG  NOT_UPPERCASE
    OR  BX, 1 ; Set the first bit of BX to indicate uppercase
    JMP CHARACTER_CHECKED

NOT_UPPERCASE:
    ; Check for lowercase letter
    CMP AL, 'a'
    JL  NOT_LOWERCASE
    CMP AL, 'z'
    JG  NOT_LOWERCASE
    OR  BX, 2 ; Set the second bit of BX to indicate lowercase
    JMP CHARACTER_CHECKED

NOT_LOWERCASE:
    ; Check for digit
    CMP AL, '0'
    JL  CHARACTER_CHECKED
    CMP AL, '9'
    JG  CHARACTER_CHECKED
    OR  BX, 4 ; Set the third bit of BX to indicate digit

CHARACTER_CHECKED:
    INC SI
    JMP CHECK_CHARACTERS

CHARACTERS_CHECKED:
    ; Check if all required character types are present
    CMP BX, 7 ; Check if all three bits are set (111 in binary)
    JNE WEAK_PASSWORD ; Jump to weak password message if not all criteria are met

    ; If all criteria are met, display strong password message
    LEA DX, STRONG_MSG
    MOV AH, 09H
    INT 21H

    JMP EXIT_PROGRAM

WEAK_PASSWORD:
    ; Display weak password message
    LEA DX, WEAK_MSG
    MOV AH, 09H
    INT 21H

EXIT_PROGRAM:
    ; Terminate the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
