section	.text
		global ft_write
		extern __errno_location

ft_write:
	mov		rax, 1
	syscall
	cmp		rax, 0
	jl		error
	ret

error:
	neg		rax
	push	rax
	call	__errno_location
	pop		r9
	mov		[rax], r9
	mov		rax, -1

return:
	ret