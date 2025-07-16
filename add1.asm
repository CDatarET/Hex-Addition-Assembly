section .data 
	numArray db 11h, 12h, 13h, 14h, 15h
	
	msg db "Result of array addition is: ", 10
	msgLen equ $-msg
	
section .bss
	result resw 1
	temp resw 1
	
%macro rw 4
	mov rax, %1
	mov rdi, %2
	mov rsi, %3
	mov rdx, %4
	syscall
%endmacro

section .text
	global _start
	
_start:
	rw 1, 1, msg, msgLen
		mov rsi, numArray
		mov ax, 00h
		mov bx, 0h
		mov cx, 5
up2: mov bl, byte[rsi]
	add ax, bx
	jnc skip
	inc ah
skip:
	inc rsi
	dec cx
	jnz up2
	
	mov word[result], ax
	
	mov ax, word[result]
	mov bp, 4
	up: rol ax, 4
		mov bx, ax
		and ax, 0Fh
		cmp al, 09
		jbe down
			add al, 30h
		mov byte[temp], al
		
		rw 1, 1, temp, 1
		mov ax, bx
		dec bp
		jnz up
		
		rw 60, 0, 0, 0
