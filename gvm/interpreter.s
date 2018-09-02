	.file	"interpreter.cpp"
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB1:
	.text
.LHOTB1:
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
	movl	64(%ebp), %esi
	movl	$0, 68(%ebp)
	.p2align 4,,10
	.p2align 3
.L3:
	leal	1(%esi), %eax
	leal	2(%esi), %ebx
	movl	%eax, 64(%ebp)
	movl	%eax, 12(%esp)
	movzbl	(%esi), %eax
	movl	%ebx, 64(%ebp)
	movzbl	-1(%ebx), %ecx
	movl	%ecx, %edx
	andl	$15, %edx
	movb	%dl, 11(%esp)
	movzbl	%cl, %edx
	movl	%edx, %edi
	sarl	$4, %edi
	cmpb	$-94, %al
	ja	.L1
	jmp	*.L6(,%eax,4)
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
	.long	.L21
	.long	.L22
	.long	.L23
	.long	.L24
	.long	.L25
	.long	.L26
	.long	.L27
	.long	.L28
	.long	.L29
	.long	.L30
	.long	.L31
	.long	.L32
	.long	.L33
	.long	.L34
	.long	.L35
	.long	.L36
	.long	.L37
	.long	.L38
	.long	.L39
	.long	.L40
	.long	.L41
	.long	.L42
	.long	.L43
	.long	.L44
	.long	.L45
	.long	.L46
	.long	.L47
	.long	.L48
	.long	.L49
	.long	.L50
	.long	.L51
	.long	.L52
	.long	.L53
	.long	.L54
	.long	.L55
	.long	.L56
	.long	.L57
	.long	.L108
	.long	.L58
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L59
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L60
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L61
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L62
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L63
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L64
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L65
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L66
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L67
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L68
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L69
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L70
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L71
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.long	.L108
	.text
.L76:
	movl	$10, 68(%ebp)
.L18:
	movl	72(%ebp), %eax
	cmpl	80(%ebp), %eax
	jbe	.L77
	leal	-4(%eax), %edx
	movl	%edx, 72(%ebp)
	movl	-4(%eax), %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L108:
	movl	%ebx, %esi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L16:
	leal	3(%esi), %ecx
	sall	$8, %edx
	movl	%ecx, 64(%ebp)
	movzbl	2(%esi), %eax
	orl	%eax, %edx
	cmpw	108(%ebp), %dx
	jnb	.L142
	movl	72(%ebp), %eax
	cmpl	84(%ebp), %eax
	jnb	.L73
	leal	4(%eax), %ebx
	movzwl	%dx, %edx
	movl	%ebx, 72(%ebp)
	movl	%ecx, (%eax)
	movl	96(%ebp), %eax
	movl	(%eax,%edx,4), %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L15:
	leal	3(%esi), %ecx
	sall	$8, %edx
	movl	72(%ebp), %eax
	movl	%ecx, 64(%ebp)
	movzbl	2(%esi), %esi
	orl	%esi, %edx
	cmpl	84(%ebp), %eax
	jnb	.L73
	leal	4(%eax), %ebx
	movswl	%dx, %esi
	movl	%ebx, 72(%ebp)
	movl	%ecx, (%eax)
	addl	64(%ebp), %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L17:
	leal	3(%esi), %eax
	sall	$8, %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %eax
	orl	%eax, %edx
	cmpw	108(%ebp), %dx
	jnb	.L143
	movl	100(%ebp), %eax
	movzwl	%dx, %edx
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L76
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%ebp
	.cfi_def_cfa_offset 64
	call	*%eax
	movl	64(%ebp), %esi
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L57:
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	leal	0(%ebp,%eax,4), %eax
	movl	(%eax), %edx
	imull	%edi, %edx
	movl	%edx, (%eax)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L56:
	movzbl	11(%esp), %ecx
	leal	3(%esi), %eax
	leal	4(%esi), %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %eax
	movl	%edx, 64(%ebp)
	movzbl	3(%esi), %ebx
	movl	0(%ebp,%ecx,4), %ecx
	movl	0(%ebp,%edi,4), %esi
	movl	(%esi,%eax,4), %eax
	movl	%edx, %esi
	subl	%eax, (%ecx,%ebx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L55:
	leal	3(%esi), %eax
	movzbl	11(%esp), %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %ebx
	movl	%eax, %esi
	movl	0(%ebp,%edi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	subl	%ecx, 0(%ebp,%edx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L54:
	movzbl	11(%esp), %edx
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %ecx
	movl	%eax, %esi
	movl	0(%ebp,%edi,4), %ebx
	movl	0(%ebp,%edx,4), %edx
	subl	%ebx, (%edx,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L53:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%edi,4), %edx
	movl	%ebx, %esi
	subl	%edx, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L52:
	movzbl	11(%esp), %edx
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %ecx
	movl	%eax, %esi
	movl	0(%ebp,%edx,4), %edx
	subl	%edi, (%edx,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L51:
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	subl	%edi, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L70:
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	leal	0(%ebp,%eax,4), %eax
	flds	(%eax)
	fmuls	0(%ebp,%edi,4)
	fstps	(%eax)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L59:
	movl	0(%ebp,%edi,4), %ecx
	testl	%ecx, %ecx
	je	.L107
	movzbl	11(%esp), %eax
	leal	0(%ebp,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ecx
	movl	%eax, (%esi)
	movl	%ebx, %esi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L64:
	movl	0(%ebp,%edi,4), %eax
	movzbl	11(%esp), %edx
	movl	%ebx, %esi
	notl	%eax
	movl	%eax, 0(%ebp,%edx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L71:
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	leal	0(%ebp,%eax,4), %eax
	flds	(%eax)
	fdivs	0(%ebp,%edi,4)
	fstps	(%eax)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L61:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%edi,4), %edx
	movl	%ebx, %esi
	andl	%edx, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L65:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%edi,4), %ecx
	movl	%ebx, %esi
	sall	%cl, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L66:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%edi,4), %ecx
	movl	%ebx, %esi
	shrl	%cl, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L58:
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	leal	0(%ebp,%eax,4), %edx
	movl	(%edx), %eax
	imull	0(%ebp,%edi,4), %eax
	movl	%eax, (%edx)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L14:
	movzbl	2(%esi), %esi
	sall	$8, %edx
	orl	%esi, %edx
	movswl	%dx, %esi
	addl	%ebx, %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L13:
	movsbl	%cl, %ecx
	leal	(%ebx,%ecx), %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L12:
	leal	3(%esi), %eax
	leal	4(%esi), %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %eax
	movl	%edx, 64(%ebp)
	movl	0(%ebp,%edi,4), %ecx
	movl	(%ecx,%eax,4), %ebx
	movzbl	11(%esp), %eax
	movzbl	3(%esi), %ecx
	movl	%edx, %esi
	movl	0(%ebp,%eax,4), %eax
	movl	%ebx, (%eax,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L11:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %ecx
	movl	%eax, %esi
	movl	0(%ebp,%edi,4), %edx
	movl	(%edx,%ecx,4), %ecx
	movzbl	11(%esp), %edx
	movl	%ecx, 0(%ebp,%edx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	11(%esp), %edx
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %ecx
	movl	%eax, %esi
	movl	0(%ebp,%edi,4), %ebx
	movl	0(%ebp,%edx,4), %edx
	movl	%ebx, (%edx,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L9:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%edi,4), %edx
	movl	%ebx, %esi
	movl	%edx, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L8:
	movzbl	11(%esp), %edx
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %ecx
	movl	%eax, %esi
	movl	0(%ebp,%edx,4), %edx
	movl	%edi, (%edx,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L7:
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	movl	%edi, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	movl	12(%esp), %eax
	movl	%eax, 64(%ebp)
	movl	%eax, %esi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L63:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%edi,4), %edx
	movl	%ebx, %esi
	xorl	%edx, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L60:
	movl	0(%ebp,%edi,4), %ecx
	testl	%ecx, %ecx
	je	.L107
	movzbl	11(%esp), %eax
	leal	0(%ebp,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ecx
	movl	%edx, (%esi)
	movl	%ebx, %esi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L69:
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	leal	0(%ebp,%eax,4), %eax
	flds	(%eax)
	fsubs	0(%ebp,%edi,4)
	fstps	(%eax)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L67:
	flds	0(%ebp,%edi,4)
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	fchs
	fstps	0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L68:
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	leal	0(%ebp,%eax,4), %eax
	flds	(%eax)
	fadds	0(%ebp,%edi,4)
	fstps	(%eax)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L62:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%edi,4), %edx
	movl	%ebx, %esi
	orl	%edx, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L50:
	movzbl	11(%esp), %ecx
	leal	3(%esi), %eax
	leal	4(%esi), %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %eax
	movl	%edx, 64(%ebp)
	movzbl	3(%esi), %ebx
	movl	0(%ebp,%ecx,4), %ecx
	movl	0(%ebp,%edi,4), %esi
	movl	(%esi,%eax,4), %eax
	movl	%edx, %esi
	addl	%eax, (%ecx,%ebx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L49:
	leal	3(%esi), %eax
	movzbl	11(%esp), %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %ebx
	movl	%eax, %esi
	movl	0(%ebp,%edi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	addl	%ecx, 0(%ebp,%edx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L48:
	movzbl	11(%esp), %edx
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %ecx
	movl	%eax, %esi
	movl	0(%ebp,%edi,4), %ebx
	movl	0(%ebp,%edx,4), %edx
	addl	%ebx, (%edx,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L47:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%edi,4), %edx
	movl	%ebx, %esi
	addl	%edx, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L46:
	movzbl	11(%esp), %edx
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %ecx
	movl	%eax, %esi
	movl	0(%ebp,%edx,4), %edx
	addl	%edi, (%edx,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L45:
	movzbl	11(%esp), %eax
	movl	%ebx, %esi
	addl	%edi, 0(%ebp,%eax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L44:
	leal	3(%esi), %eax
	leal	4(%esi), %edx
	movzbl	11(%esp), %ecx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %eax
	movl	%edx, 64(%ebp)
	movzbl	3(%esi), %ebx
	movl	0(%ebp,%edi,4), %esi
	movl	0(%ebp,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	movl	%edx, %esi
	negl	%eax
	movl	%eax, (%ecx,%ebx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L43:
	leal	3(%esi), %edx
	movzbl	11(%esp), %ecx
	movl	%edx, 64(%ebp)
	movzbl	2(%esi), %ebx
	movl	%edx, %esi
	movl	0(%ebp,%edi,4), %eax
	movl	(%eax,%ebx,4), %eax
	negl	%eax
	movl	%eax, 0(%ebp,%ecx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L42:
	movzbl	11(%esp), %eax
	leal	3(%esi), %edx
	movl	%edx, 64(%ebp)
	movzbl	2(%esi), %ebx
	movl	%edx, %esi
	movl	0(%ebp,%eax,4), %ecx
	movl	0(%ebp,%edi,4), %eax
	negl	%eax
	movl	%eax, (%ecx,%ebx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L41:
	movl	0(%ebp,%edi,4), %eax
	movzbl	11(%esp), %edx
	movl	%ebx, %esi
	negl	%eax
	movl	%eax, 0(%ebp,%edx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L40:
	leal	3(%esi), %eax
	leal	4(%esi), %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %eax
	movl	%edx, 64(%ebp)
	movzbl	11(%esp), %edx
	movzbl	3(%esi), %ecx
	movl	0(%ebp,%edi,4), %ebx
	movl	0(%ebp,%edx,4), %edx
	movl	(%edx,%ecx,4), %edi
	cmpl	%edi, (%ebx,%eax,4)
	jle	.L106
.L139:
	leal	5(%esi), %edx
	movl	%edx, 64(%ebp)
	movzbl	4(%esi), %eax
	movzbl	5(%esi), %esi
	sall	$8, %eax
	orl	%eax, %esi
	movswl	%si, %esi
	addl	%edx, %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L39:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	11(%esp), %eax
	movzbl	2(%esi), %ecx
	movl	0(%ebp,%edi,4), %edx
	movl	0(%ebp,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jle	.L105
	.p2align 4,,10
	.p2align 3
.L140:
	leal	4(%esi), %edx
	movl	%edx, 64(%ebp)
	movzbl	3(%esi), %eax
	movzbl	4(%esi), %esi
	sall	$8, %eax
	orl	%eax, %esi
	movswl	%si, %esi
	addl	%edx, %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L38:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	11(%esp), %eax
	movzbl	2(%esi), %edx
	movl	0(%ebp,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, 0(%ebp,%edi,4)
	jle	.L105
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L37:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%eax,4), %eax
	cmpl	%eax, 0(%ebp,%edi,4)
	jle	.L103
	.p2align 4,,10
	.p2align 3
.L136:
	leal	3(%esi), %edx
	movl	%edx, 64(%ebp)
	movzbl	2(%esi), %eax
	movzbl	3(%esi), %esi
	sall	$8, %eax
	orl	%eax, %esi
	movswl	%si, %esi
	addl	%edx, %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L36:
	leal	3(%esi), %eax
	leal	4(%esi), %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %eax
	movl	%edx, 64(%ebp)
	movzbl	11(%esp), %edx
	movzbl	3(%esi), %ecx
	movl	0(%ebp,%edi,4), %ebx
	movl	0(%ebp,%edx,4), %edx
	movl	(%edx,%ecx,4), %edi
	cmpl	%edi, (%ebx,%eax,4)
	jl	.L106
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L35:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	11(%esp), %eax
	movzbl	2(%esi), %ecx
	movl	0(%ebp,%edi,4), %edx
	movl	0(%ebp,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jl	.L105
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L34:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	11(%esp), %eax
	movzbl	2(%esi), %edx
	movl	0(%ebp,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, 0(%ebp,%edi,4)
	jl	.L105
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L33:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%eax,4), %eax
	cmpl	%eax, 0(%ebp,%edi,4)
	jl	.L103
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L32:
	leal	3(%esi), %eax
	leal	4(%esi), %edx
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %eax
	movl	%edx, 64(%ebp)
	movzbl	11(%esp), %edx
	movzbl	3(%esi), %ecx
	movl	0(%ebp,%edi,4), %ebx
	movl	0(%ebp,%edx,4), %edx
	movl	(%edx,%ecx,4), %edi
	cmpl	%edi, (%ebx,%eax,4)
	je	.L139
.L106:
	addl	$6, %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L31:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	11(%esp), %eax
	movzbl	2(%esi), %ecx
	movl	0(%ebp,%edi,4), %edx
	movl	0(%ebp,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	je	.L140
	.p2align 4,,10
	.p2align 3
.L105:
	addl	$5, %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L30:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	11(%esp), %eax
	movzbl	2(%esi), %edx
	movl	0(%ebp,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, 0(%ebp,%edi,4)
	jne	.L105
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L29:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%eax,4), %eax
	cmpl	%eax, 0(%ebp,%edi,4)
	je	.L136
.L103:
	addl	$4, %esi
	movl	%esi, 64(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L28:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	11(%esp), %eax
	movzbl	2(%esi), %edx
	movl	0(%ebp,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L105
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L27:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%eax,4), %edx
	testl	%edx, %edx
	je	.L103
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L26:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	11(%esp), %eax
	movzbl	2(%esi), %edx
	movl	0(%ebp,%eax,4), %eax
	movl	(%eax,%edx,4), %ecx
	testl	%ecx, %ecx
	jne	.L105
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L25:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%eax,4), %ebx
	testl	%ebx, %ebx
	jne	.L103
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L24:
	leal	3(%esi), %eax
	movl	%eax, 64(%ebp)
	movzbl	2(%esi), %edx
	movl	0(%ebp,%edi,4), %eax
	movl	(%eax,%edx,4), %eax
	movzbl	11(%esp), %edx
	testl	%eax, %eax
	movl	%eax, 0(%ebp,%edx,4)
	je	.L105
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L23:
	movzbl	11(%esp), %eax
	leal	0(%ebp,%eax,4), %edx
	subl	$1, (%edx)
	je	.L103
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L22:
	movzbl	11(%esp), %eax
	movl	0(%ebp,%eax,4), %eax
	cmpl	88(%ebp), %eax
	jb	.L144
	cmpl	92(%ebp), %eax
	jnb	.L87
	movl	%eax, 76(%ebp)
	movl	%ebx, %esi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L21:
	movl	76(%ebp), %edx
	leal	4(%edx,%ecx,4), %eax
	cmpl	92(%ebp), %eax
	jnb	.L87
	movzbl	11(%esp), %ecx
	movl	%ebx, %esi
	movl	%edx, 0(%ebp,%ecx,4)
	movl	%eax, 76(%ebp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L20:
	leal	3(%esi), %ecx
	sall	$8, %edx
	leal	60(%ebp), %ebx
	movl	%ecx, 64(%ebp)
	movzbl	2(%esi), %eax
	orw	%ax, %dx
	je	.L112
	movl	76(%ebp), %eax
	movl	88(%ebp), %esi
	cmpl	%eax, %esi
	jb	.L84
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L85:
	subl	$4, %ebx
	cmpl	%esi, %eax
	jbe	.L87
.L84:
	testw	%dx, %dx
	jns	.L85
	leal	-4(%eax), %edi
	movl	-4(%eax), %eax
	subl	$4, %ebx
	movl	%edi, 76(%ebp)
	movl	%eax, 4(%ebx)
	addw	%dx, %dx
	je	.L112
	movl	%edi, %eax
	cmpl	%esi, %eax
	ja	.L84
	.p2align 4,,10
	.p2align 3
.L87:
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
.L19:
	.cfi_restore_state
	leal	3(%esi), %ecx
	sall	$8, %edx
	movl	%ebp, %ebx
	movl	%ecx, 64(%ebp)
	movzbl	2(%esi), %eax
	orw	%ax, %dx
	je	.L112
	movl	76(%ebp), %eax
	movl	92(%ebp), %esi
	cmpl	%esi, %eax
	jnb	.L87
	movl	%eax, %edi
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L145:
	leal	4(%edi), %eax
	addl	$4, %ebx
	movl	%eax, 76(%ebp)
	movl	-4(%ebx), %eax
	movl	%eax, (%edi)
	movzwl	%dx, %eax
	sarl	%eax
	testw	%ax, %ax
	movl	%eax, %edx
	je	.L112
	movl	76(%ebp), %edi
.L82:
	cmpl	%esi, %edi
	jnb	.L87
.L80:
	testb	$1, %dl
	jne	.L145
.L4:
	addl	$4, %ebx
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L112:
	movl	%ecx, %esi
	jmp	.L3
.L73:
	movl	$8, 68(%ebp)
	jmp	.L1
.L107:
	movl	$5, 68(%ebp)
	jmp	.L1
.L77:
	movl	$2, 68(%ebp)
	jmp	.L1
.L142:
	movl	$11, 68(%ebp)
	jmp	.L1
.L143:
	movl	$13, 68(%ebp)
	jmp	.L1
.L144:
	movl	$7, 68(%ebp)
	jmp	.L1
	.cfi_endproc
.LFE30:
	.size	_ZN3GVM11Interpreter7executeEv, .-_ZN3GVM11Interpreter7executeEv
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
