section .data
    digits db "0123456789ABCDEF"
    
    msg db 'Sum of the hex numbers: ', 0
    msgLen equ $-msg

section .bss
    unpacked resb 3
    num1 resb 3
    num2 resb 3

section .text
    global _start

_start:
    mov rbx, 0xAF
    mov [num1], rbx
    mov rbx, 0x2B
    mov [num2], rbx

    mov rax, [num1]
    add rax, [num2]
    mov rbx, rax
    mov rcx, 3
    mov rdi, unpacked + 2

unpack_loop:
    mov rax, rbx
    and rax, 0xF
    mov rdx, rax
    mov al, [digits + rdx]
    mov [rdi], al
    shr rbx, 4
    dec rdi
    loop unpack_loop

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msgLen
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, unpacked
    mov rdx, 3
    syscall

    mov eax, 60
    xor edi, edi
    syscall
