section .data
    num1 db "A1", 0Ah
    a db 0xA1
    
    num2 db "2B", 0Ah
    b db 0x2B
    
    newLine db 0Ah

section .bss
    msg resb 3

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, num1
    mov rdx, 3
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, num2
    mov rdx, 3
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, newLine
    mov rdx, 3
    syscall

    mov rbx, [a]
    add rbx, [b]
    
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 3
    syscall
    
    mov rax, 60
    mov rdi, 0
    syscall
