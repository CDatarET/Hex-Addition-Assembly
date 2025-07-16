section .data
    digits db "0123456789ABCDEF"
    
    msg db 'Sum of the hex numbers: ', 0
    msgLen equ $-msg

section .bss
    result resb 4
    num1 resb 3
    num2 resb 3
    num3 resb 3
    num4 resb 3
    num5 resb 3

section .text
    global _start

_start:
    mov rbx, 11h
    mov [num1], rbx
    
    mov rbx, 12h
    mov [num2], rbx
    
    mov rbx, 13h
    mov[num3], rbx
    
    mov rbx, 14h
    mov[num4], rbx
    
    mov rbx, 15h
    mov[num5], rbx

    mov rax, [num1]
    add rax, [num2]
    add rax, [num3]
    add rax, [num4]
    add rax, [num5]
    mov rbx, rax
    mov rcx, 3
    mov rdi, result + 2

addLoop:
    mov rax, rbx
    and rax, 0xF
    mov rdx, rax
    mov al, [digits + rdx]
    mov [rdi], al
    shr rbx, 4
    dec rdi
    loop addLoop

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msgLen
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 3
    syscall

    mov eax, 60
    xor edi, edi
    syscall
