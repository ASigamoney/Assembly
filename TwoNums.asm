section .data
    num1 db 5      ; First number
    num2 db 10     ; Second number
    result db 0    ; Storage for result

section .text
    global _start

_start:
    ; Load the first number into AL
    mov al, [num1] ; Load num1 into register AL
    ; Add the second number to AL
    add al, [num2] ; Add num2 to AL
    ; Store the result in the result variable
    mov [result], al ; Store the value of AL into result

    ; Exit the program (Linux syscall)
    mov eax, 60     ; syscall: exit
    xor edi, edi    ; exit code: 0
    syscall
