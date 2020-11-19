section .bss
	digits resb 30
section .text
	global _start
	
_start:
	mov rdi, [rsp+16]	;getting cmd line arg for atoi
	call _atoi
	
	mov rdi, rax
	call _fib
	
	mov rdi, rax
	call prINT

	mov rax, 60
	mov rdi, 0
	syscall

_fib:
	mov r9, 0
	mov r10, 1
_fibLoop:
	cmp rdi, 0
	je _fibReta

	cmp rdi, 1
	je _fibRetb

	sub rdi, 1

	mov r11, r10
	add r10, r9
	mov r9, r11
	
	jmp _fibLoop
_fibReta:
	mov rax, r9
	ret
_fibRetb:
	mov rax, r10
	ret

_atoi:
	mov r8, 0
	mov rax, rdi
_atoiLoop:
	mov r9, 0
	mov r9b, [rax]
	sub r9, 48
	imul r8, 10
	add r8, r9
	inc rax
	mov cl, [rax]
	cmp cl, 0
	jne _atoiLoop

	mov rax, r8
	ret

prINT:
	push rdi
	mov rax, rdi
	mov rcx, 10
	mov r9, 0
	mov r10, 0
	mov r11, digits
prINTpushLoop:
	add r9, 1
	mov rdx, 0	
	div rcx

	push rdx
	cmp rax, 0
	jne prINTpushLoop
prINTpopLoop:
	pop rax
	mov rcx, rax
	add rcx, 48
	mov [r11], cl
	inc r11
	
	add r10, 1
	cmp r9, r10
	jne prINTpopLoop
prINTend:
	mov rcx, 10
	mov [r11], cl
	add r10, 1
	
	mov rax, 1
	mov rdi, 1
	mov rsi, digits
	mov rdx, r10
	syscall

	pop rdi
	ret
