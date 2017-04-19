section .bss
input resb 100
inputlen equ $-input

section .data
numbytes dd 0
current dd 0
count dd 0
countlen equ 1

section .text

global _start

equal:
	dec edx
	cmp edx,0
	je end
	jne loop

notequal:
	push edx

	mov eax,4
	mov ebx,1
	mov ecx,current
	mov edx,1
	int 0x80	; sys_write

	mov eax,4
	mov ebx,1
	mov ecx,count
	mov edx,countlen
	int 0x80	; sys_write

	pop edx
	pop eax
	
	mov eax,48
	push eax

	dec edx
	cmp edx,0
	je end
	jne loop

_start:
	mov eax,3
	mov ebx,0
	mov ecx,input
	mov edx,inputlen
	int 0x80	; sys_read

	mov [numbytes],eax
	mov edx,[numbytes]
	dec edx

	mov esi,input

	mov eax,48
	mov [count],eax
	push eax
	mov ebx,1

loop:
	pop eax
	add eax,ebx
	mov [count],eax
	push eax

	mov al,[esi]
	mov [current],al
	inc esi
	cmp al,byte[esi]
	je equal
	jne notequal
	
end:
	mov eax,1
	int 0x80	; sys_exit
