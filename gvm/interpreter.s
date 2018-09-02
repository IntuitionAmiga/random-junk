	.file	"interpreter.cpp"
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB0:
	.text
.LHOTB0:
	.align 2
	.p2align 4,,15
	.globl	_ZN3GVM11Interpreter7executeEv
	.type	_ZN3GVM11Interpreter7executeEv, @function
_ZN3GVM11Interpreter7executeEv:
.LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	48(%esp), %ebp
	movl	64(%ebp), %edi
	movl	$0, 68(%ebp)
	.p2align 4,,10
	.p2align 3
.L3:
	leal	1(%edi), %eax
	leal	2(%edi), %ecx
	movl	%eax, 64(%ebp)
	movzbl	(%edi), %edx
	movl	%ecx, 64(%ebp)
	movzbl	-1(%ecx), %ebx
	movl	%eax, 12(%esp)
	movl	%ebx, %eax
	andl	$15, %eax
	movb	%al, 11(%esp)
	movzbl	%bl, %eax
	movl	%eax, %esi
	sarl	$4, %esi
	cmpb	$-94, %dl
	ja	.L1
	jmp	*.L6(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L5
	.long	.L7
	.long	.L8
	.long	.L9
	.long	.L10
	.long	.L11
	.long	.L12
	.long	.L13
	.long	.L14
	.long	.L15
	.long	.L16
	.long	.L17
	.long	.L18
	.long	.L19
	.long	.L20
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.long	.L36
	.text
	.p2align 4,,10
	.p2align 3
.L36:
	movl	%ecx, %edi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L25:
	movl	$10, 68(%ebp)
.L18:
	movl	72(%ebp), %eax
	cmpl	80(%ebp), %eax
	jbe	.L26
	leal	-4(%eax), %edx
	movl	%edx, 72(%ebp)
	movl	-4(%eax), %edi
	movl	%edi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L19:
	leal	3(%edi), %ecx
	sall	$8, %eax
	movl	%ebp, %ebx
	movl	%ecx, 64(%ebp)
	movzbl	2(%edi), %edx
	orw	%dx, %ax
	je	.L36
	movl	76(%ebp), %edx
	movl	92(%ebp), %esi
	cmpl	%esi, %edx
	jnb	.L27
	movl	%edx, %edi
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L47:
	leal	4(%edi), %edx
	addl	$4, %ebx
	movl	%edx, 76(%ebp)
	movl	-4(%ebx), %edx
	movl	%edx, (%edi)
	movzwl	%ax, %edx
	sarl	%edx
	testw	%dx, %dx
	movl	%edx, %eax
	je	.L36
	movl	76(%ebp), %edi
	cmpl	%esi, %edi
	jnb	.L27
.L29:
	testb	$1, %al
	jne	.L47
	addl	$4, %ebx
	cmpl	%esi, %edi
	jb	.L29
.L4:
.L27:
	movl	$6, 68(%ebp)
.L1:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
	leal	3(%edi), %ecx
	sall	$8, %eax
	leal	60(%ebp), %ebx
	movl	%ecx, 64(%ebp)
	movzbl	2(%edi), %edx
	orw	%dx, %ax
	je	.L36
	movl	76(%ebp), %edx
	movl	88(%ebp), %esi
	cmpl	%esi, %edx
	ja	.L33
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L34:
	subl	$4, %ebx
.L35:
	cmpl	%esi, %edx
	jbe	.L27
.L33:
	testw	%ax, %ax
	jns	.L34
	leal	-4(%edx), %edi
	movl	-4(%edx), %edx
	subl	$4, %ebx
	movl	%edi, 76(%ebp)
	movl	%edx, 4(%ebx)
	addw	%ax, %ax
	je	.L36
	movl	%edi, %edx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L17:
	leal	3(%edi), %edx
	sall	$8, %eax
	movl	%edx, 64(%ebp)
	movzbl	2(%edi), %edx
	orl	%edx, %eax
	cmpw	108(%ebp), %ax
	jnb	.L48
	movl	100(%ebp), %edx
	movzwl	%ax, %eax
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	je	.L25
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%ebp
	.cfi_def_cfa_offset 64
	call	*%eax
	movl	64(%ebp), %edi
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L16:
	leal	3(%edi), %ecx
	sall	$8, %eax
	movl	%ecx, 64(%ebp)
	movzbl	2(%edi), %edx
	orl	%edx, %eax
	cmpw	108(%ebp), %ax
	jnb	.L49
	movl	72(%ebp), %edx
	cmpl	84(%ebp), %edx
	jnb	.L22
	leal	4(%edx), %ebx
	movzwl	%ax, %eax
	movl	%ebx, 72(%ebp)
	movl	%ecx, (%edx)
	movl	96(%ebp), %edx
	movl	(%edx,%eax,4), %edi
	movl	%edi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L15:
	leal	3(%edi), %ecx
	sall	$8, %eax
	movl	72(%ebp), %edx
	movl	%ecx, 64(%ebp)
	movzbl	2(%edi), %edi
	orl	%edi, %eax
	cmpl	84(%ebp), %edx
	jnb	.L22
	leal	4(%edx), %ebx
	cwtl
	movl	%ebx, 72(%ebp)
	movl	%ecx, (%edx)
	addl	64(%ebp), %eax
	movl	%eax, %edi
	movl	%eax, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L14:
	movzbl	2(%edi), %edi
	sall	$8, %eax
	orl	%eax, %edi
	movswl	%di, %edi
	addl	%ecx, %edi
	movl	%edi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L13:
	movsbl	%bl, %edi
	addl	%ecx, %edi
	movl	%edi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L12:
	leal	3(%edi), %eax
	leal	4(%edi), %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%edi), %eax
	movl	%edx, 64(%ebp)
	movl	0(%ebp,%esi,4), %ecx
	movzbl	3(%edi), %ebx
	movl	%edx, %edi
	movl	(%ecx,%eax,4), %ecx
	movzbl	11(%esp), %eax
	movl	0(%ebp,%eax,4), %eax
	movl	%ecx, (%eax,%ebx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L11:
	leal	3(%edi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%edi), %ecx
	movl	%eax, %edi
	movl	0(%ebp,%esi,4), %edx
	movl	(%edx,%ecx,4), %ecx
	movzbl	11(%esp), %edx
	movl	%ecx, 0(%ebp,%edx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	11(%esp), %edx
	leal	3(%edi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%edi), %ecx
	movl	%eax, %edi
	movl	0(%ebp,%esi,4), %ebx
	movl	0(%ebp,%edx,4), %edx
	movl	%ebx, (%edx,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L9:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%esi,4), %edx
	movl	%ecx, %edi
	movl	%edx, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L8:
	movzbl	11(%esp), %edx
	leal	3(%edi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%edi), %ecx
	movl	%eax, %edi
	movl	0(%ebp,%edx,4), %edx
	movl	%esi, (%edx,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L7:
	movzbl	11(%esp), %eax
	movl	%ecx, %edi
	movl	%esi, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	movl	12(%esp), %eax
	movl	%eax, 64(%ebp)
	movl	%eax, %edi
	jmp	.L3
.L22:
	movl	$8, 68(%ebp)
	jmp	.L1
.L26:
	movl	$2, 68(%ebp)
	jmp	.L1
.L49:
	movl	$11, 68(%ebp)
	jmp	.L1
.L48:
	movl	$13, 68(%ebp)
	jmp	.L1
	.cfi_endproc
.LFE30:
	.size	_ZN3GVM11Interpreter7executeEv, .-_ZN3GVM11Interpreter7executeEv
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
