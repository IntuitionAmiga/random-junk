	.file	"interpreter.cpp"
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB3:
	.text
.LHOTB3:
	.align 2
	.p2align 4,,15
	.globl	_ZN3GVM11Interpreter7executeEv
	.type	_ZN3GVM11Interpreter7executeEv, @function
_ZN3GVM11Interpreter7executeEv:
.LFB119:
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
	movl	48(%esp), %edi
	movl	80(%edi), %ebp
	movl	$0, 84(%edi)
	.p2align 4,,10
	.p2align 3
.L3:
	leal	1(%ebp), %eax
	leal	2(%ebp), %ebx
	movl	%eax, 80(%edi)
	movl	%eax, 12(%esp)
	movzbl	0(%ebp), %eax
	movl	%ebx, 80(%edi)
	movzbl	-1(%ebx), %esi
	movl	%esi, %ecx
	movl	%esi, %edx
	andl	$15, %ecx
	movb	%cl, 4(%esp)
	movl	%esi, %ecx
	sarl	$4, %ecx
	movl	%ecx, 8(%esp)
	cmpb	$-95, %al
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
	.long	.L58
	.long	.L59
	.long	.L60
	.long	.L61
	.long	.L62
	.long	.L63
	.long	.L64
	.long	.L65
	.long	.L66
	.long	.L67
	.long	.L68
	.long	.L69
	.long	.L70
	.long	.L71
	.long	.L72
	.long	.L73
	.long	.L74
	.long	.L75
	.long	.L76
	.long	.L77
	.long	.L78
	.long	.L79
	.long	.L80
	.long	.L81
	.long	.L82
	.long	.L83
	.long	.L84
	.long	.L85
	.long	.L86
	.long	.L87
	.long	.L88
	.long	.L89
	.long	.L90
	.long	.L91
	.long	.L92
	.long	.L93
	.long	.L94
	.long	.L95
	.long	.L96
	.long	.L97
	.long	.L98
	.long	.L99
	.long	.L100
	.long	.L101
	.long	.L102
	.long	.L103
	.long	.L104
	.long	.L105
	.long	.L106
	.long	.L107
	.long	.L108
	.long	.L109
	.long	.L110
	.long	.L111
	.long	.L112
	.long	.L113
	.long	.L114
	.long	.L115
	.long	.L116
	.long	.L117
	.long	.L118
	.long	.L119
	.long	.L120
	.long	.L121
	.long	.L122
	.long	.L123
	.long	.L124
	.long	.L125
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L126
	.long	.L127
	.long	.L128
	.long	.L129
	.long	.L130
	.long	.L131
	.long	.L132
	.long	.L133
	.long	.L134
	.long	.L135
	.long	.L136
	.long	.L137
	.long	.L138
	.long	.L139
	.long	.L140
	.long	.L141
	.long	.L142
	.long	.L143
	.long	.L144
	.long	.L145
	.long	.L202
	.long	.L202
	.long	.L146
	.long	.L147
	.long	.L202
	.long	.L202
	.long	.L202
	.long	.L148
	.long	.L149
	.long	.L150
	.text
.L17:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%esi, %eax
	sall	$8, %eax
	orl	%edx, %eax
	cmpw	124(%edi), %ax
	jnb	.L239
	movl	116(%edi), %edx
	movzwl	%ax, %eax
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	jne	.L240
	movl	$10, 84(%edi)
.L18:
	movl	88(%edi), %eax
	cmpl	96(%edi), %eax
	jbe	.L158
	leal	-4(%eax), %edx
	movl	%edx, 88(%edi)
	movl	-4(%eax), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L16:
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	sall	$8, %eax
	orl	%edx, %eax
	cmpw	124(%edi), %ax
	jnb	.L241
	movl	88(%edi), %edx
	cmpl	100(%edi), %edx
	jnb	.L154
	movzwl	%ax, %eax
	leal	4(%edx), %ebx
	movl	%ebx, 88(%edi)
	movl	%ecx, (%edx)
	movl	112(%edi), %edx
	movl	(%edx,%eax,4), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L15:
	leal	3(%ebp), %edx
	movl	%esi, %eax
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movl	88(%edi), %eax
	cmpl	100(%edi), %eax
	jnb	.L154
	movswl	%bp, %ebp
	leal	4(%eax), %ecx
	movl	%ecx, 88(%edi)
	movl	%edx, (%eax)
	addl	80(%edi), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L14:
	movzbl	2(%ebp), %ebp
	movl	%esi, %eax
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%ebx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L13:
	movsbl	%dl, %edx
	leal	(%ebx,%edx), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L12:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%eax,4), %ebx
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	%ebx, (%eax,%ecx,4)
	jmp	.L3
.L11:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %edx
	movl	(%edx,%ecx,4), %ecx
	movzbl	4(%esp), %edx
	movl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L10:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L9:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	%edx, (%edi,%eax,4)
	jmp	.L3
.L8:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	%esi, (%edx,%ecx,4)
	jmp	.L3
.L7:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	%esi, (%edi,%eax,4)
	jmp	.L3
.L5:
	movl	12(%esp), %eax
	movl	%eax, 80(%edi)
	movl	%eax, %ebp
	jmp	.L3
.L139:
	leal	3(%ebp), %ebx
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	movl	%ebx, 80(%edi)
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	tanf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	fstps	8(%esp)
	movl	%ebx, %ebp
	movss	8(%esp), %xmm0
	movl	(%edi,%eax,4), %eax
	movss	%xmm0, (%eax,%edx,4)
	jmp	.L3
.L138:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	%ebx, %ebp
	movl	20(%esp), %eax
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	tanf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	fstps	8(%esp)
	movss	8(%esp), %xmm0
	movss	%xmm0, (%edi,%eax,4)
	jmp	.L3
.L137:
	leal	3(%ebp), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %esi
	leal	4(%ebp), %ebx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ebx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	cosf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %edx
	fstps	8(%esp)
	movl	%ebx, %ebp
	movss	8(%esp), %xmm0
	movl	(%edi,%eax,4), %eax
	movss	%xmm0, (%eax,%edx,4)
	jmp	.L3
.L136:
	leal	3(%ebp), %ebx
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	movl	%ebx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	pushl	(%eax,%edx,4)
	.cfi_def_cfa_offset 64
	call	cosf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	fstps	8(%esp)
	movss	8(%esp), %xmm0
	movss	%xmm0, (%edi,%eax,4)
	jmp	.L3
.L135:
	leal	3(%ebp), %ebx
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	movl	%ebx, 80(%edi)
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	cosf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	fstps	8(%esp)
	movl	%ebx, %ebp
	movss	8(%esp), %xmm0
	movl	(%edi,%eax,4), %eax
	movss	%xmm0, (%eax,%edx,4)
	jmp	.L3
.L134:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	%ebx, %ebp
	movl	20(%esp), %eax
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	cosf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	fstps	8(%esp)
	movss	8(%esp), %xmm0
	movss	%xmm0, (%edi,%eax,4)
	jmp	.L3
.L133:
	leal	3(%ebp), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %esi
	leal	4(%ebp), %ebx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ebx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	sinf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %edx
	fstps	8(%esp)
	movl	%ebx, %ebp
	movss	8(%esp), %xmm0
	movl	(%edi,%eax,4), %eax
	movss	%xmm0, (%eax,%edx,4)
	jmp	.L3
.L132:
	leal	3(%ebp), %ebx
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	movl	%ebx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	pushl	(%eax,%edx,4)
	.cfi_def_cfa_offset 64
	call	sinf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	fstps	8(%esp)
	movss	8(%esp), %xmm0
	movss	%xmm0, (%edi,%eax,4)
	jmp	.L3
.L131:
	leal	3(%ebp), %ebx
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	movl	%ebx, 80(%edi)
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	sinf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	fstps	8(%esp)
	movl	%ebx, %ebp
	movss	8(%esp), %xmm0
	movl	(%edi,%eax,4), %eax
	movss	%xmm0, (%eax,%edx,4)
	jmp	.L3
.L130:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	%ebx, %ebp
	movl	20(%esp), %eax
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	sinf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	fstps	8(%esp)
	movss	8(%esp), %xmm0
	movss	%xmm0, (%edi,%eax,4)
	jmp	.L3
.L129:
	movzbl	4(%esp), %ecx
.L151:
	leal	1(%ebx), %eax
	movl	8(%esp), %esi
	leal	2(%ebx), %edx
	movl	%eax, 80(%edi)
	movzbl	(%ebx), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%ecx,4), %edx
	movzbl	1(%ebx), %ebx
	leal	(%edx,%ebx,4), %ebx
	movl	(%edi,%esi,4), %edx
	sqrtss	(%edx,%eax,4), %xmm0
	ucomiss	%xmm0, %xmm0
	jp	.L242
.L194:
	movss	%xmm0, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L3
.L128:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	4(%esp), %ecx
	movl	(%edi,%esi,4), %edx
	sqrtss	(%edx,%eax,4), %xmm0
	ucomiss	%xmm0, %xmm0
	jp	.L243
.L192:
	movss	%xmm0, (%edi,%ecx,4)
	movl	80(%edi), %ebx
	jmp	.L151
.L127:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movl	8(%esp), %eax
	sqrtss	(%edi,%eax,4), %xmm0
	ucomiss	%xmm0, %xmm0
	jp	.L244
.L190:
	movss	%xmm0, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L3
.L126:
	movl	8(%esp), %eax
	sqrtss	(%edi,%eax,4), %xmm0
	ucomiss	%xmm0, %xmm0
	jp	.L245
.L188:
	movzbl	4(%esp), %eax
	movss	%xmm0, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L3
.L145:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	movl	(%edi,%esi,4), %edx
	leal	(%edx,%eax,4), %edx
	movzbl	4(%esp), %eax
	movss	(%edx), %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	movss	%xmm0, (%eax)
	movss	4(%edx), %xmm0
	movss	%xmm0, 4(%eax)
	movss	8(%edx), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L3
.L144:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %ecx
	movss	(%ecx,%eax,4), %xmm0
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	movss	%xmm0, (%eax)
	movss	%xmm0, 4(%eax)
	movss	%xmm0, 8(%eax)
	jmp	.L3
.L143:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %eax
	leal	(%edi,%esi,4), %edx
	movss	(%edx), %xmm0
	movss	%xmm0, (%eax)
	movss	(%edx), %xmm0
	movss	%xmm0, 4(%eax)
	movss	(%edx), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L3
.L146:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%ecx,%eax,4), %ecx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	movss	(%eax), %xmm0
	addss	(%ecx), %xmm0
	movss	%xmm0, (%eax)
	movss	4(%eax), %xmm0
	addss	4(%ecx), %xmm0
	movss	%xmm0, 4(%eax)
	movss	8(%eax), %xmm0
	addss	8(%ecx), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L3
.L147:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%ecx,%eax,4), %ecx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	movss	(%eax), %xmm0
	subss	(%ecx), %xmm0
	movss	%xmm0, (%eax)
	movss	4(%eax), %xmm0
	subss	4(%ecx), %xmm0
	movss	%xmm0, 4(%eax)
	movss	8(%eax), %xmm0
	subss	8(%ecx), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L3
.L142:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	pxor	%xmm0, %xmm0
	cvtsi2ss	8(%esp), %xmm0
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	movss	%xmm0, (%eax)
	movss	%xmm0, 4(%eax)
	movss	%xmm0, 8(%eax)
	jmp	.L3
.L141:
	leal	3(%ebp), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %esi
	leal	4(%ebp), %ebx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ebx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	tanf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %edx
	fstps	8(%esp)
	movl	%ebx, %ebp
	movss	8(%esp), %xmm0
	movl	(%edi,%eax,4), %eax
	movss	%xmm0, (%eax,%edx,4)
	jmp	.L3
.L140:
	leal	3(%ebp), %ebx
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	movl	%ebx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	pushl	(%eax,%edx,4)
	.cfi_def_cfa_offset 64
	call	tanf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	fstps	8(%esp)
	movss	8(%esp), %xmm0
	movss	%xmm0, (%edi,%eax,4)
	jmp	.L3
.L148:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %eax
	movss	(%eax), %xmm2
	movss	4(%eax), %xmm1
	mulss	%xmm2, %xmm2
	movss	8(%eax), %xmm0
	mulss	%xmm1, %xmm1
	mulss	%xmm0, %xmm0
	addss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm1
	jp	.L246
.L196:
	movzbl	4(%esp), %eax
	movss	%xmm1, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L3
.L149:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %edx
	leal	(%edx,%eax,4), %eax
	movzbl	4(%esp), %edx
	movss	(%eax), %xmm2
	movss	4(%eax), %xmm1
	mulss	%xmm2, %xmm2
	movss	8(%eax), %xmm0
	mulss	%xmm1, %xmm1
	movl	(%edi,%edx,4), %edx
	mulss	%xmm0, %xmm0
	addss	%xmm2, %xmm1
	leal	(%edx,%ecx,4), %ebx
	addss	%xmm1, %xmm0
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm1
	jp	.L247
.L198:
	movss	%xmm1, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L3
.L150:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	leal	(%edx,%eax,4), %ebx
	movzbl	4(%esp), %eax
	movss	(%ebx), %xmm3
	movss	4(%ebx), %xmm1
	movaps	%xmm3, %xmm2
	movss	8(%ebx), %xmm0
	mulss	%xmm3, %xmm2
	movzbl	3(%ebp), %edx
	mulss	%xmm1, %xmm1
	movl	(%edi,%eax,4), %eax
	mulss	%xmm0, %xmm0
	addss	%xmm2, %xmm1
	leal	(%eax,%edx,4), %esi
	addss	%xmm1, %xmm0
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm1
	jp	.L248
.L200:
	movss	.LC1, %xmm0
	movl	80(%edi), %ebp
	divss	%xmm1, %xmm0
	mulss	%xmm0, %xmm3
	movss	%xmm3, (%esi)
	movss	4(%ebx), %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, 4(%esi)
	mulss	8(%ebx), %xmm0
	movss	%xmm0, 8(%esi)
	jmp	.L3
.L202:
	movl	%ebx, %ebp
	jmp	.L3
.L125:
	movzbl	4(%esp), %edx
.L152:
	leal	1(%ebx), %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	leal	2(%ebx), %ecx
	movl	%eax, 80(%edi)
	movl	16(%esp), %esi
	movzbl	(%ebx), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%edx,4), %edx
	movzbl	1(%ebx), %ecx
	leal	(%edx,%ecx,4), %ebx
	movl	(%edi,%esi,4), %edx
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 60
	pushl	(%ebx)
	.cfi_def_cfa_offset 64
	call	fmodf
	movl	80(%edi), %ebp
	fstps	20(%esp)
	movss	20(%esp), %xmm0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movss	%xmm0, (%ebx)
	jmp	.L3
.L124:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, 20(%esp)
	movl	16(%esp), %eax
	leal	(%edi,%edx,4), %ebx
	movl	(%edi,%eax,4), %eax
	pushl	(%eax,%ecx,4)
	.cfi_def_cfa_offset 60
	pushl	(%ebx)
	.cfi_def_cfa_offset 64
	call	fmodf
	fstps	20(%esp)
	movss	20(%esp), %xmm0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	12(%esp), %edx
	movss	%xmm0, (%ebx)
	movl	80(%edi), %ebx
	jmp	.L152
.L123:
	leal	3(%ebp), %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	movl	%eax, 80(%edi)
	movzbl	12(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movl	16(%esp), %eax
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 60
	pushl	(%ebx)
	.cfi_def_cfa_offset 64
	call	fmodf
	movl	80(%edi), %ebp
	fstps	20(%esp)
	movss	20(%esp), %xmm0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movss	%xmm0, (%ebx)
	jmp	.L3
.L122:
	movzbl	4(%esp), %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	leal	(%edi,%eax,4), %ebx
	movl	16(%esp), %eax
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 60
	pushl	(%ebx)
	.cfi_def_cfa_offset 64
	call	fmodf
	fstps	20(%esp)
	movss	20(%esp), %xmm0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movss	%xmm0, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L3
.L121:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	movss	(%ecx), %xmm0
	divss	(%ebx,%eax,4), %xmm0
	movss	%xmm0, (%ecx)
	jmp	.L3
.L120:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	movss	(%edx), %xmm0
	divss	(%ecx,%ebx,4), %xmm0
	movss	%xmm0, (%edx)
	jmp	.L3
.L119:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	movss	(%edx), %xmm0
	divss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%edx)
	jmp	.L3
.L118:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	movss	(%eax), %xmm0
	divss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%eax)
	jmp	.L3
.L117:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	movss	(%ecx), %xmm0
	mulss	(%ebx,%eax,4), %xmm0
	movss	%xmm0, (%ecx)
	jmp	.L3
.L116:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	movss	(%edx), %xmm0
	mulss	(%ecx,%ebx,4), %xmm0
	movss	%xmm0, (%edx)
	jmp	.L3
.L115:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	movss	(%edx), %xmm0
	mulss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%edx)
	jmp	.L3
.L114:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	movss	(%eax), %xmm0
	mulss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%eax)
	jmp	.L3
.L113:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	movss	(%ecx), %xmm0
	subss	(%ebx,%eax,4), %xmm0
	movss	%xmm0, (%ecx)
	jmp	.L3
.L112:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	movss	(%edx), %xmm0
	subss	(%ecx,%ebx,4), %xmm0
	movss	%xmm0, (%edx)
	jmp	.L3
.L111:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	movss	(%edx), %xmm0
	subss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%edx)
	jmp	.L3
.L110:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	movss	(%eax), %xmm0
	subss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%eax)
	jmp	.L3
.L109:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	movss	(%ecx), %xmm0
	addss	(%ebx,%eax,4), %xmm0
	movss	%xmm0, (%ecx)
	jmp	.L3
.L108:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	movss	(%edx), %xmm0
	addss	(%ecx,%ebx,4), %xmm0
	movss	%xmm0, (%edx)
	jmp	.L3
.L107:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	movss	(%edx), %xmm0
	addss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%edx)
	jmp	.L3
.L106:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	movss	(%eax), %xmm0
	addss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%eax)
	jmp	.L3
.L105:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	movl	(%edi,%esi,4), %esi
	movss	(%esi,%eax,4), %xmm0
	xorps	.LC0, %xmm0
	movss	%xmm0, (%ecx,%ebx,4)
	jmp	.L3
.L104:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movss	(%ecx,%ebx,4), %xmm0
	xorps	.LC0, %xmm0
	movss	%xmm0, (%edi,%edx,4)
	jmp	.L3
.L103:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movss	(%edi,%esi,4), %xmm0
	xorps	.LC0, %xmm0
	movss	%xmm0, (%edx,%ecx,4)
	jmp	.L3
.L102:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movss	(%edi,%esi,4), %xmm0
	xorps	.LC0, %xmm0
	movss	%xmm0, (%edi,%eax,4)
	jmp	.L3
.L101:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebp
	movl	(%edi,%ecx,4), %ebx
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%eax,4), %ecx
	shrl	%cl, (%ebx,%ebp,4)
	movl	%edx, %ebp
	jmp	.L3
.L100:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	shrl	%cl, (%edi,%edx,4)
	jmp	.L3
.L99:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ecx
	shrl	%cl, (%edx,%ebx,4)
	jmp	.L3
.L98:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %ecx
	shrl	%cl, (%edi,%eax,4)
	jmp	.L3
.L97:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %ecx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	addl	$1, %ecx
	shrl	%cl, (%edx,%ebx,4)
	jmp	.L3
.L96:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %ecx
	addl	$1, %ecx
	shrl	%cl, (%edi,%eax,4)
	jmp	.L3
.L95:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebp
	movl	(%edi,%ecx,4), %ebx
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%eax,4), %ecx
	sall	%cl, (%ebx,%ebp,4)
	movl	%edx, %ebp
	jmp	.L3
.L94:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	sall	%cl, (%edi,%edx,4)
	jmp	.L3
.L93:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ecx
	sall	%cl, (%edx,%ebx,4)
	jmp	.L3
.L92:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %ecx
	sall	%cl, (%edi,%eax,4)
	jmp	.L3
.L91:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %ecx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	addl	$1, %ecx
	sall	%cl, (%edx,%ebx,4)
	jmp	.L3
.L90:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %ecx
	addl	$1, %ecx
	sall	%cl, (%edi,%eax,4)
	jmp	.L3
.L89:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %ecx
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %esi
	movl	(%edi,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	notl	%eax
	movl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L88:
	movl	8(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%edx, %ebp
	movzbl	4(%esp), %ecx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%ebx,4), %eax
	notl	%eax
	movl	%eax, (%edi,%ecx,4)
	jmp	.L3
.L87:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %ecx
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %eax
	notl	%eax
	movl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L86:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	movzbl	4(%esp), %edx
	movl	(%edi,%eax,4), %eax
	notl	%eax
	movl	%eax, (%edi,%edx,4)
	jmp	.L3
.L85:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	movl	(%edi,%esi,4), %esi
	movl	(%esi,%eax,4), %eax
	xorl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L84:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	xorl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L83:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	xorl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L82:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	xorl	%edx, (%edi,%eax,4)
	jmp	.L3
.L81:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	movl	(%edi,%esi,4), %esi
	movl	(%esi,%eax,4), %eax
	orl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L80:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	orl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L79:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	orl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L78:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	orl	%edx, (%edi,%eax,4)
	jmp	.L3
.L77:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	movl	(%edi,%esi,4), %esi
	movl	(%esi,%eax,4), %eax
	andl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L76:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	andl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L75:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	andl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L74:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	andl	%edx, (%edi,%eax,4)
	jmp	.L3
.L73:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movl	(%edi,%esi,4), %ebx
	movl	(%ebx,%ecx,4), %ebx
	testl	%ebx, %ebx
	je	.L187
	movzbl	4(%esp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	andl	%ebx, (%ecx,%eax,4)
	jmp	.L3
.L72:
	movl	8(%esp), %eax
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L187
	movzbl	4(%esp), %eax
	movl	%ecx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%edx, (%esi)
	jmp	.L3
.L71:
	movl	8(%esp), %esi
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%esi,4), %ebx
	testl	%ebx, %ebx
	je	.L187
	movzbl	4(%esp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%edx, (%esi)
	jmp	.L3
.L70:
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %ecx
	testl	%ecx, %ecx
	je	.L187
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ecx
	movl	%edx, (%esi)
	jmp	.L3
.L69:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	addl	$2, %esi
	leal	(%eax,%edx,4), %ebx
	movl	(%ebx), %eax
	cltd
	idivl	%esi
	movl	%edx, (%ebx)
	jmp	.L3
.L68:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %ecx
	movl	(%ecx), %eax
	addl	$2, %esi
	cltd
	idivl	%esi
	movl	%edx, (%ecx)
	jmp	.L3
.L67:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, 80(%edi)
	movzbl	3(%ebp), %eax
	movl	(%edi,%esi,4), %ebx
	movl	(%ebx,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L187
	movzbl	4(%esp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%eax, (%esi)
	jmp	.L3
.L66:
	movl	8(%esp), %eax
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L187
	movzbl	4(%esp), %eax
	movl	%ecx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%eax, (%esi)
	jmp	.L3
.L65:
	movl	8(%esp), %esi
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%esi,4), %ebx
	testl	%ebx, %ebx
	je	.L187
	movzbl	4(%esp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%eax, (%esi)
	jmp	.L3
.L64:
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %ecx
	testl	%ecx, %ecx
	je	.L187
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ecx
	movl	%eax, (%esi)
	jmp	.L3
.L63:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	addl	$2, %esi
	leal	(%eax,%edx,4), %ebx
	movl	(%ebx), %eax
	cltd
	idivl	%esi
	movl	%eax, (%ebx)
	jmp	.L3
.L62:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %ecx
	movl	(%ecx), %eax
	addl	$2, %esi
	cltd
	idivl	%esi
	movl	%eax, (%ecx)
	jmp	.L3
.L61:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	leal	4(%ebp), %edx
	movzbl	2(%ebp), %ecx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %ebx
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %esi
	movl	(%ebx), %eax
	imull	(%esi,%ecx,4), %eax
	movl	%eax, (%ebx)
	jmp	.L3
.L60:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ebp
	leal	(%edi,%eax,4), %ecx
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %ebx
	movl	(%ecx), %eax
	imull	(%ebx,%ebp,4), %eax
	movl	%edx, %ebp
	movl	%eax, (%ecx)
	jmp	.L3
.L59:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %ecx
	movl	(%ecx), %eax
	imull	(%edi,%esi,4), %eax
	movl	%eax, (%ecx)
	jmp	.L3
.L58:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %edx
	movl	(%edx), %eax
	imull	(%edi,%esi,4), %eax
	movl	%eax, (%edx)
	jmp	.L3
.L57:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%edx,4), %edx
	addl	$2, %esi
	leal	(%edx,%ecx,4), %edx
	imull	(%edx), %esi
	movl	%esi, (%edx)
	jmp	.L3
.L56:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	addl	$2, %esi
	imull	(%eax), %esi
	movl	%esi, (%eax)
	jmp	.L3
.L55:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	movl	(%edi,%esi,4), %esi
	movl	(%esi,%eax,4), %eax
	subl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L54:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	subl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L53:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	subl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L52:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	subl	%edx, (%edi,%eax,4)
	jmp	.L3
.L51:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	addl	$1, %esi
	subl	%esi, (%edx,%ecx,4)
	jmp	.L3
.L50:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	addl	$1, %esi
	subl	%esi, (%edi,%eax,4)
	jmp	.L3
.L49:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	movl	(%edi,%esi,4), %esi
	movl	(%esi,%eax,4), %eax
	addl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L48:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	addl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L47:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	addl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L46:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	addl	%edx, (%edi,%eax,4)
	jmp	.L3
.L45:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	addl	$1, %esi
	addl	%esi, (%edx,%ecx,4)
	jmp	.L3
.L44:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	addl	$1, %esi
	addl	%esi, (%edi,%eax,4)
	jmp	.L3
.L43:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %ecx
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %esi
	movl	(%edi,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	negl	%eax
	movl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L42:
	movl	8(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%edx, %ebp
	movzbl	4(%esp), %ecx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%ebx,4), %eax
	negl	%eax
	movl	%eax, (%edi,%ecx,4)
	jmp	.L3
.L41:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %ecx
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %eax
	negl	%eax
	movl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L40:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	movzbl	4(%esp), %edx
	movl	(%edi,%eax,4), %eax
	negl	%eax
	movl	%eax, (%edi,%edx,4)
	jmp	.L3
.L39:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	(%edx,%ecx,4), %esi
	cmpl	%esi, (%ebx,%eax,4)
	jle	.L186
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L38:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jle	.L185
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L37:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jle	.L184
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L36:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jle	.L183
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L35:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	(%edx,%ecx,4), %esi
	cmpl	%esi, (%ebx,%eax,4)
	jl	.L182
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L34:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jl	.L181
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L33:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jl	.L180
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L32:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jl	.L179
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L31:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	(%edx,%ecx,4), %esi
	cmpl	%esi, (%ebx,%eax,4)
	je	.L249
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L30:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	je	.L250
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L29:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	je	.L251
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L28:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L175
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L27:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %edx
	testl	%edx, %edx
	je	.L174
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L26:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ecx
	testl	%ecx, %ecx
	jne	.L173
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L25:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %ebx
	testl	%ebx, %ebx
	jne	.L172
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L24:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	movzbl	4(%esp), %edx
	movl	%eax, (%edi,%edx,4)
	testl	%eax, %eax
	je	.L171
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L23:
	movzbl	4(%esp), %eax
	leal	(%edi,%eax,4), %edx
	subl	$1, (%edx)
	je	.L170
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L22:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	104(%edi), %eax
	jb	.L252
	cmpl	108(%edi), %eax
	jnb	.L168
	movl	%eax, 92(%edi)
	movl	%ebx, %ebp
	jmp	.L3
.L21:
	movl	92(%edi), %ecx
	leal	4(%ecx,%esi,4), %eax
	cmpl	108(%edi), %eax
	jnb	.L168
	movzbl	4(%esp), %edx
	movl	%ebx, %ebp
	movl	%ecx, (%edi,%edx,4)
	movl	%eax, 92(%edi)
	jmp	.L3
.L20:
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	leal	60(%edi), %ebx
	sall	$8, %eax
	orw	%dx, %ax
	je	.L205
	movl	92(%edi), %edx
	movl	104(%edi), %esi
	cmpl	%esi, %edx
	ja	.L165
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L166:
	subl	$4, %ebx
	cmpl	%esi, %edx
	jbe	.L168
.L165:
	testw	%ax, %ax
	jns	.L166
	leal	-4(%edx), %ebp
	movl	-4(%edx), %edx
	subl	$4, %ebx
	movl	%ebp, 92(%edi)
	movl	%edx, 4(%ebx)
	addw	%ax, %ax
	je	.L206
	movl	%ebp, %edx
	cmpl	%esi, %edx
	ja	.L165
.L168:
	movl	$6, 84(%edi)
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
.L19:
	.cfi_restore_state
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	movl	%edi, %ebx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	sall	$8, %eax
	orw	%dx, %ax
	je	.L203
	movl	92(%edi), %edx
	movl	108(%edi), %esi
	cmpl	%esi, %edx
	jnb	.L168
	movl	%edx, %ebp
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L253:
	leal	4(%ebp), %edx
	addl	$4, %ebx
	movl	%edx, 92(%edi)
	movl	-4(%ebx), %edx
	movl	%edx, 0(%ebp)
	movzwl	%ax, %edx
	sarl	%edx
	movl	%edx, %eax
	testw	%dx, %dx
	je	.L204
	movl	92(%edi), %ebp
.L163:
	cmpl	%esi, %ebp
	jnb	.L168
.L161:
	testb	$1, %al
	jne	.L253
.L4:
	addl	$4, %ebx
	jmp	.L163
.L240:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	*%eax
	movl	80(%edi), %ebp
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L3
.L170:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L171:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L172:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L173:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L174:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L175:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L179:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L180:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L181:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L182:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L183:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L184:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L185:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L186:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L204:
	movl	%ecx, %ebp
	jmp	.L3
.L206:
	movl	%ecx, %ebp
	jmp	.L3
.L249:
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L251:
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L250:
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L187:
	movl	$5, 84(%edi)
	jmp	.L1
.L203:
	movl	%ecx, %ebp
	jmp	.L3
.L205:
	movl	%ecx, %ebp
	jmp	.L3
.L154:
	movl	$8, 84(%edi)
	jmp	.L1
.L158:
	movl	$2, 84(%edi)
	jmp	.L1
.L248:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movss	(%ebx), %xmm3
	fstps	4(%esp)
	movss	4(%esp), %xmm1
	jmp	.L200
.L243:
	movl	%ecx, 12(%esp)
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	12(%esp), %ecx
	fstps	4(%esp)
	movss	4(%esp), %xmm0
	jmp	.L192
.L247:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	movss	4(%esp), %xmm1
	jmp	.L198
.L252:
	movl	$7, 84(%edi)
	jmp	.L1
.L242:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	movss	4(%esp), %xmm0
	jmp	.L194
.L239:
	movl	$13, 84(%edi)
	jmp	.L1
.L241:
	movl	$11, 84(%edi)
	jmp	.L1
.L246:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	8(%esp)
	movss	8(%esp), %xmm1
	jmp	.L196
.L245:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	8(%esp)
	movss	8(%esp), %xmm0
	jmp	.L188
.L244:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	movss	4(%esp), %xmm0
	jmp	.L190
	.cfi_endproc
.LFE119:
	.size	_ZN3GVM11Interpreter7executeEv, .-_ZN3GVM11Interpreter7executeEv
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1065353216
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
