section .bss
input resb 100
inputlen equ $-input

section .data
current dd 0
count dd 0
countlen equ 1
section .text

global _start

outCurrent:
	push edx
	mov eax,4
	mov ebx,1
	mov ecx,current
	mov edx,1
	int 0x80	; sys_write

	pop edx
	ret

_start:
	mov eax,3
	mov ebx,0
	mov ecx,input
	mov edx,inputlen
	int 0x80	; sys_read

	mov edx,eax
	dec edx

	mov esi,input


loop:
	mov al,[esi]
	mov [current],al
	inc esi
	mov al,[esi]
	mov [count],al
	cmp byte[count],49
	je one
	cmp byte[count],50
	je two
	cmp byte[count],51
	je three
	cmp byte[count],52
	je four
	cmp byte[count],53
	je five
	cmp byte[count],54
	je six
	cmp byte[count],55
	je seven
	cmp byte[count],56
	je eight
	cmp byte[count],57
	je nine

transition:
	dec edx
	cmp edx,0
	je end

	inc esi
	jmp loop

end:
	mov eax,1	; sys_exit
	int 0x80

one:
	call outCurrent
	jmp transition

two:
	call outCurrent
	call outCurrent
	jmp transition

three:
	call outCurrent
	call outCurrent
	call outCurrent
	jmp transition

four:
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	jmp transition

five:
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	jmp transition

six:
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	jmp transition

seven:
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	jmp transition

eight:
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	jmp transition

nine:
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	call outCurrent
	jmp transition
