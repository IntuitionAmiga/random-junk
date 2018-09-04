	.file	"interpreter.cpp"
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB2:
	.text
.LHOTB2:
	.align 2
	.p2align 4,,15
	.globl	_ZN3GVM11Interpreter7executeEv
	.type	_ZN3GVM11Interpreter7executeEv, @function
_ZN3GVM11Interpreter7executeEv:
.LFB138:
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
	movl	64(%edi), %ebp
	movl	$0, 68(%edi)
	.p2align 4,,10
	.p2align 3
.L3:
	leal	1(%ebp), %eax
	leal	2(%ebp), %ebx
	movl	%eax, 64(%edi)
	movl	%eax, 12(%esp)
	movzbl	0(%ebp), %eax
	movl	%ebx, 64(%edi)
	movzbl	-1(%ebx), %esi
	movl	%esi, %ecx
	movl	%esi, %edx
	andl	$15, %ecx
	movb	%cl, 4(%esp)
	movl	%esi, %ecx
	sarl	$4, %ecx
	cmpb	$-95, %al
	movl	%ecx, 8(%esp)
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
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %edx
	movl	%esi, %eax
	sall	$8, %eax
	orl	%edx, %eax
	cmpw	108(%edi), %ax
	jnb	.L239
	movl	100(%edi), %edx
	movzwl	%ax, %eax
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	jne	.L240
	movl	$10, 68(%edi)
.L18:
	movl	72(%edi), %eax
	cmpl	80(%edi), %eax
	jbe	.L158
	leal	-4(%eax), %edx
	movl	%edx, 72(%edi)
	movl	-4(%eax), %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L16:
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	sall	$8, %eax
	movl	%ecx, 64(%edi)
	movzbl	2(%ebp), %edx
	orl	%edx, %eax
	cmpw	108(%edi), %ax
	jnb	.L241
	movl	72(%edi), %edx
	cmpl	84(%edi), %edx
	jnb	.L154
	leal	4(%edx), %ebx
	movzwl	%ax, %eax
	movl	%ebx, 72(%edi)
	movl	%ecx, (%edx)
	movl	96(%edi), %edx
	movl	(%edx,%eax,4), %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L15:
	leal	3(%ebp), %edx
	movl	%esi, %eax
	sall	$8, %eax
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %ebp
	orl	%eax, %ebp
	movl	72(%edi), %eax
	cmpl	84(%edi), %eax
	jnb	.L154
	leal	4(%eax), %ecx
	movswl	%bp, %ebp
	movl	%ecx, 72(%edi)
	movl	%edx, (%eax)
	addl	64(%edi), %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L14:
	movzbl	2(%ebp), %ebp
	movl	%esi, %eax
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%ebx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L13:
	movsbl	%dl, %edx
	leal	(%ebx,%edx), %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L12:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%eax,4), %ebx
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	%ebx, (%eax,%ecx,4)
	jmp	.L3
.L11:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %edx
	movl	(%edx,%ecx,4), %ecx
	movzbl	4(%esp), %edx
	movl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L10:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
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
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	%esi, (%edx,%ecx,4)
	jmp	.L3
.L7:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	%esi, (%edi,%eax,4)
	jmp	.L3
.L5:
	movl	12(%esp), %eax
	movl	%eax, 64(%edi)
	movl	%eax, %ebp
	jmp	.L3
.L139:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
	movl	20(%esp), %eax
	movl	%ebx, 64(%edi)
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	tanf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	fstps	(%eax,%edx,4)
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
	fstps	(%edi,%eax,4)
	jmp	.L3
.L137:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %eax
	leal	4(%ebp), %ebx
	movl	20(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%ebx, 64(%edi)
	movl	(%edi,%esi,4), %edx
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	cosf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	fstps	(%eax,%edx,4)
	jmp	.L3
.L136:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
	movl	20(%esp), %eax
	movl	%ebx, 64(%edi)
	movzbl	2(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	pushl	(%eax,%edx,4)
	.cfi_def_cfa_offset 64
	call	cosf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	fstps	(%edi,%eax,4)
	jmp	.L3
.L135:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
	movl	20(%esp), %eax
	movl	%ebx, 64(%edi)
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	cosf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	fstps	(%eax,%edx,4)
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
	fstps	(%edi,%eax,4)
	jmp	.L3
.L133:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %eax
	leal	4(%ebp), %ebx
	movl	20(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%ebx, 64(%edi)
	movl	(%edi,%esi,4), %edx
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	sinf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	fstps	(%eax,%edx,4)
	jmp	.L3
.L132:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
	movl	20(%esp), %eax
	movl	%ebx, 64(%edi)
	movzbl	2(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	pushl	(%eax,%edx,4)
	.cfi_def_cfa_offset 64
	call	sinf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	fstps	(%edi,%eax,4)
	jmp	.L3
.L131:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
	movl	20(%esp), %eax
	movl	%ebx, 64(%edi)
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	sinf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	fstps	(%eax,%edx,4)
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
	fstps	(%edi,%eax,4)
	jmp	.L3
.L129:
	movzbl	4(%esp), %ecx
.L151:
	leal	1(%ebx), %eax
	leal	2(%ebx), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	(%ebx), %eax
	movl	%edx, 64(%edi)
	movzbl	1(%ebx), %ebx
	movl	(%edi,%ecx,4), %edx
	leal	(%edx,%ebx,4), %ebx
	movl	(%edi,%esi,4), %edx
	flds	(%edx,%eax,4)
	fld	%st(0)
	fsqrt
	fucomi	%st(0), %st
	jp	.L242
	fstp	%st(1)
.L194:
	fstps	(%ebx)
	movl	64(%edi), %ebp
	jmp	.L3
.L128:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%esi,4), %edx
	flds	(%edx,%eax,4)
	fld	%st(0)
	fsqrt
	fucomi	%st(0), %st
	jp	.L243
	fstp	%st(1)
.L192:
	fstps	(%edi,%ecx,4)
	movl	64(%edi), %ebx
	jmp	.L151
.L127:
	leal	3(%ebp), %eax
	movl	%eax, 64(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movl	8(%esp), %eax
	flds	(%edi,%eax,4)
	fld	%st(0)
	fsqrt
	fucomi	%st(0), %st
	jp	.L244
	fstp	%st(1)
.L190:
	fstps	(%ebx)
	movl	64(%edi), %ebp
	jmp	.L3
.L126:
	movl	8(%esp), %eax
	flds	(%edi,%eax,4)
	fld	%st(0)
	fsqrt
	fucomi	%st(0), %st
	jp	.L245
	fstp	%st(1)
.L188:
	movzbl	4(%esp), %eax
	fstps	(%edi,%eax,4)
	movl	64(%edi), %ebp
	jmp	.L3
.L145:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 64(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %edx
	movzbl	4(%esp), %eax
	flds	(%edx)
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	fstps	(%eax)
	flds	4(%edx)
	fstps	4(%eax)
	flds	8(%edx)
	fstps	8(%eax)
	jmp	.L3
.L144:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movl	(%edi,%esi,4), %ecx
	flds	(%ecx,%eax,4)
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	fsts	(%eax)
	fsts	4(%eax)
	fstps	8(%eax)
	jmp	.L3
.L143:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %ecx
	movl	8(%esp), %esi
	movl	%ecx, 64(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %eax
	leal	(%edi,%esi,4), %edx
	flds	(%edx)
	fstps	(%eax)
	flds	(%edx)
	fstps	4(%eax)
	flds	(%edx)
	fstps	8(%eax)
	jmp	.L3
.L146:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 64(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	flds	(%eax)
	fadds	(%edx)
	fstps	(%eax)
	flds	4(%eax)
	fadds	4(%edx)
	fstps	4(%eax)
	flds	8(%eax)
	fadds	8(%edx)
	fstps	8(%eax)
	jmp	.L3
.L147:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 64(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	flds	(%eax)
	fsubs	(%edx)
	fstps	(%eax)
	flds	4(%eax)
	fsubs	4(%edx)
	fstps	4(%eax)
	flds	8(%eax)
	fsubs	8(%edx)
	fstps	8(%eax)
	jmp	.L3
.L142:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	filds	8(%esp)
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	fsts	(%eax)
	fsts	4(%eax)
	fstps	8(%eax)
	jmp	.L3
.L141:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %eax
	leal	4(%ebp), %ebx
	movl	20(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%ebx, 64(%edi)
	movl	(%edi,%esi,4), %edx
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	tanf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	fstps	(%eax,%edx,4)
	jmp	.L3
.L140:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
	movl	20(%esp), %eax
	movl	%ebx, 64(%edi)
	movzbl	2(%ebp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	pushl	(%eax,%edx,4)
	.cfi_def_cfa_offset 64
	call	tanf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movzbl	4(%esp), %eax
	fstps	(%edi,%eax,4)
	jmp	.L3
.L148:
	leal	3(%ebp), %eax
	movl	%eax, 64(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %eax
	flds	(%eax)
	flds	4(%eax)
	flds	8(%eax)
	fxch	%st(2)
	fmul	%st(0), %st
	fxch	%st(1)
	fmul	%st(0), %st
	faddp	%st, %st(1)
	fxch	%st(1)
	fmul	%st(0), %st
	faddp	%st, %st(1)
	fld	%st(0)
	fsqrt
	fucomi	%st(0), %st
	jp	.L246
	fstp	%st(1)
.L196:
	movzbl	4(%esp), %eax
	fstps	(%edi,%eax,4)
	movl	64(%edi), %ebp
	jmp	.L3
.L149:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ecx
	leal	(%edx,%eax,4), %eax
	movzbl	4(%esp), %edx
	flds	(%eax)
	flds	4(%eax)
	movl	(%edi,%edx,4), %edx
	flds	8(%eax)
	fxch	%st(2)
	leal	(%edx,%ecx,4), %ebx
	fmul	%st(0), %st
	fxch	%st(1)
	fmul	%st(0), %st
	faddp	%st, %st(1)
	fxch	%st(1)
	fmul	%st(0), %st
	faddp	%st, %st(1)
	fld	%st(0)
	fsqrt
	fucomi	%st(0), %st
	jp	.L247
	fstp	%st(1)
.L198:
	fstps	(%ebx)
	movl	64(%edi), %ebp
	jmp	.L3
.L150:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movl	(%edi,%esi,4), %edx
	leal	(%edx,%eax,4), %ebx
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %edx
	flds	(%ebx)
	flds	4(%ebx)
	movl	(%edi,%eax,4), %eax
	flds	8(%ebx)
	leal	(%eax,%edx,4), %esi
	fld	%st(2)
	fmul	%st(3), %st
	fxch	%st(2)
	fmul	%st(0), %st
	faddp	%st, %st(2)
	fmul	%st(0), %st
	faddp	%st, %st(1)
	fld	%st(0)
	fsqrt
	fucomi	%st(0), %st
	jp	.L248
	fstp	%st(1)
.L200:
	fdivrs	.LC0
	movl	64(%edi), %ebp
	fmul	%st, %st(1)
	fxch	%st(1)
	fstps	(%esi)
	flds	4(%ebx)
	fmul	%st(1), %st
	fstps	4(%esi)
	fmuls	8(%ebx)
	fstps	8(%esi)
	jmp	.L3
.L202:
	movl	%ebx, %ebp
	jmp	.L3
.L125:
	movzbl	4(%esp), %edx
.L152:
	leal	1(%ebx), %eax
	leal	2(%ebx), %ecx
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	movl	16(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	(%ebx), %eax
	movl	%ecx, 64(%edi)
	movzbl	1(%ebx), %ecx
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %ebx
	movl	(%edi,%esi,4), %edx
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 60
	pushl	(%ebx)
	.cfi_def_cfa_offset 64
	call	fmodf
	movl	64(%edi), %ebp
	fstps	(%ebx)
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L3
.L124:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, 12(%esp)
	movl	16(%esp), %eax
	leal	(%edi,%edx,4), %ebx
	movl	(%edi,%eax,4), %eax
	pushl	(%eax,%ecx,4)
	.cfi_def_cfa_offset 60
	pushl	(%ebx)
	.cfi_def_cfa_offset 64
	call	fmodf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	(%ebx)
	movl	4(%esp), %edx
	movl	64(%edi), %ebx
	jmp	.L152
.L123:
	leal	3(%ebp), %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	movl	%eax, 64(%edi)
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
	movl	64(%edi), %ebp
	fstps	(%ebx)
	addl	$16, %esp
	.cfi_def_cfa_offset 48
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
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	(%ebx)
	movl	64(%edi), %ebp
	jmp	.L3
.L121:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	flds	(%ecx)
	fdivs	(%ebx,%eax,4)
	fstps	(%ecx)
	jmp	.L3
.L120:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	flds	(%edx)
	fdivs	(%ecx,%ebx,4)
	fstps	(%edx)
	jmp	.L3
.L119:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	flds	(%edx)
	fdivs	(%edi,%esi,4)
	fstps	(%edx)
	jmp	.L3
.L118:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	flds	(%eax)
	fdivs	(%edi,%esi,4)
	fstps	(%eax)
	jmp	.L3
.L117:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	flds	(%ecx)
	fmuls	(%ebx,%eax,4)
	fstps	(%ecx)
	jmp	.L3
.L116:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	flds	(%edx)
	fmuls	(%ecx,%ebx,4)
	fstps	(%edx)
	jmp	.L3
.L115:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	flds	(%edx)
	fmuls	(%edi,%esi,4)
	fstps	(%edx)
	jmp	.L3
.L114:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	flds	(%eax)
	fmuls	(%edi,%esi,4)
	fstps	(%eax)
	jmp	.L3
.L113:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	flds	(%ecx)
	fsubs	(%ebx,%eax,4)
	fstps	(%ecx)
	jmp	.L3
.L112:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	flds	(%edx)
	fsubs	(%ecx,%ebx,4)
	fstps	(%edx)
	jmp	.L3
.L111:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	flds	(%edx)
	fsubs	(%edi,%esi,4)
	fstps	(%edx)
	jmp	.L3
.L110:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	flds	(%eax)
	fsubs	(%edi,%esi,4)
	fstps	(%eax)
	jmp	.L3
.L109:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	flds	(%ecx)
	fadds	(%ebx,%eax,4)
	fstps	(%ecx)
	jmp	.L3
.L108:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	flds	(%edx)
	fadds	(%ecx,%ebx,4)
	fstps	(%edx)
	jmp	.L3
.L107:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	flds	(%edx)
	fadds	(%edi,%esi,4)
	fstps	(%edx)
	jmp	.L3
.L106:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	flds	(%eax)
	fadds	(%edi,%esi,4)
	fstps	(%eax)
	jmp	.L3
.L105:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movzbl	4(%esp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movl	(%edi,%esi,4), %esi
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	flds	(%esi,%eax,4)
	fchs
	fstps	(%ecx,%ebx,4)
	jmp	.L3
.L104:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	flds	(%ecx,%ebx,4)
	fchs
	fstps	(%edi,%edx,4)
	jmp	.L3
.L103:
	leal	3(%ebp), %eax
	movzbl	4(%esp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	flds	(%edi,%esi,4)
	movl	(%edi,%edx,4), %edx
	fchs
	fstps	(%edx,%ecx,4)
	jmp	.L3
.L102:
	movl	8(%esp), %esi
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	flds	(%edi,%esi,4)
	fchs
	fstps	(%edi,%eax,4)
	jmp	.L3
.L101:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebp
	movl	(%edi,%ecx,4), %ebx
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%eax,4), %ecx
	shrl	%cl, (%ebx,%ebp,4)
	movl	%edx, %ebp
	jmp	.L3
.L100:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	shrl	%cl, (%edi,%edx,4)
	jmp	.L3
.L99:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%edi,%edx,4), %edx
	shrl	%cl, (%edx,%ebx,4)
	jmp	.L3
.L98:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %ecx
	shrl	%cl, (%edi,%eax,4)
	jmp	.L3
.L97:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	addl	$1, %ecx
	movl	(%edi,%edx,4), %edx
	shrl	%cl, (%edx,%ebx,4)
	jmp	.L3
.L96:
	movzbl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	addl	$1, %ecx
	shrl	%cl, (%edi,%eax,4)
	jmp	.L3
.L95:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebp
	movl	(%edi,%ecx,4), %ebx
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%eax,4), %ecx
	sall	%cl, (%ebx,%ebp,4)
	movl	%edx, %ebp
	jmp	.L3
.L94:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	sall	%cl, (%edi,%edx,4)
	jmp	.L3
.L93:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%edi,%edx,4), %edx
	sall	%cl, (%edx,%ebx,4)
	jmp	.L3
.L92:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %ecx
	sall	%cl, (%edi,%eax,4)
	jmp	.L3
.L91:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	addl	$1, %ecx
	movl	(%edi,%edx,4), %edx
	sall	%cl, (%edx,%ebx,4)
	jmp	.L3
.L90:
	movzbl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	addl	$1, %ecx
	sall	%cl, (%edi,%eax,4)
	jmp	.L3
.L89:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movzbl	4(%esp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movl	(%edi,%esi,4), %esi
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	notl	%eax
	movl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L88:
	leal	3(%ebp), %edx
	movl	8(%esp), %eax
	movzbl	4(%esp), %ecx
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%ebx,4), %eax
	notl	%eax
	movl	%eax, (%edi,%ecx,4)
	jmp	.L3
.L87:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 64(%edi)
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
	movzbl	4(%esp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	notl	%eax
	movl	%eax, (%edi,%edx,4)
	jmp	.L3
.L85:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %esi
	movl	(%edi,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	xorl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L84:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	xorl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L83:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	xorl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L82:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	xorl	%edx, (%edi,%eax,4)
	jmp	.L3
.L81:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %esi
	movl	(%edi,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	orl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L80:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	orl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L79:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	orl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L78:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	orl	%edx, (%edi,%eax,4)
	jmp	.L3
.L77:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %esi
	movl	(%edi,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	andl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L76:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	andl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L75:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	andl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L74:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	andl	%edx, (%edi,%eax,4)
	jmp	.L3
.L73:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, 64(%edi)
	movl	(%edi,%esi,4), %ebx
	movzbl	3(%ebp), %eax
	movl	(%ebx,%ecx,4), %ebx
	testl	%ebx, %ebx
	je	.L187
	movzbl	4(%esp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	andl	%ebx, (%ecx,%eax,4)
	jmp	.L3
.L72:
	leal	3(%ebp), %ecx
	movl	8(%esp), %eax
	movl	%ecx, 64(%edi)
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
	movl	%ecx, 64(%edi)
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
	movl	8(%esp), %esi
	movl	%ecx, 64(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, %ebp
	addl	$2, %esi
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movl	(%ebx), %eax
	cltd
	idivl	%esi
	movl	%edx, (%ebx)
	jmp	.L3
.L68:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$2, %esi
	leal	(%edi,%eax,4), %ecx
	movl	(%ecx), %eax
	cltd
	idivl	%esi
	movl	%edx, (%ecx)
	jmp	.L3
.L67:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, 64(%edi)
	movl	(%edi,%esi,4), %ebx
	movzbl	3(%ebp), %eax
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
	leal	3(%ebp), %ecx
	movl	8(%esp), %eax
	movl	%ecx, 64(%edi)
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
	movl	%ecx, 64(%edi)
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
	movl	8(%esp), %esi
	movl	%ecx, 64(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, %ebp
	addl	$2, %esi
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movl	(%ebx), %eax
	cltd
	idivl	%esi
	movl	%eax, (%ebx)
	jmp	.L3
.L62:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$2, %esi
	leal	(%edi,%eax,4), %ecx
	movl	(%ecx), %eax
	cltd
	idivl	%esi
	movl	%eax, (%ecx)
	jmp	.L3
.L61:
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 64(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	%edx, 64(%edi)
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
	movl	%edx, 64(%edi)
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
	movl	8(%esp), %esi
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %ecx
	movl	(%ecx), %eax
	imull	(%edi,%esi,4), %eax
	movl	%eax, (%ecx)
	jmp	.L3
.L58:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %edx
	movl	(%edx), %eax
	imull	(%edi,%esi,4), %eax
	movl	%eax, (%edx)
	jmp	.L3
.L57:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	addl	$2, %esi
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	imull	(%edx), %esi
	movl	%esi, (%edx)
	jmp	.L3
.L56:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$2, %esi
	leal	(%edi,%eax,4), %eax
	imull	(%eax), %esi
	movl	%esi, (%eax)
	jmp	.L3
.L55:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %esi
	movl	(%edi,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	subl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L54:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	subl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L53:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	subl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L52:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	subl	%edx, (%edi,%eax,4)
	jmp	.L3
.L51:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	addl	$1, %esi
	movl	(%edi,%edx,4), %edx
	subl	%esi, (%edx,%ecx,4)
	jmp	.L3
.L50:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$1, %esi
	subl	%esi, (%edi,%eax,4)
	jmp	.L3
.L49:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %esi
	movl	(%edi,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	addl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L48:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	addl	%ecx, (%edi,%edx,4)
	jmp	.L3
.L47:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	addl	%ebx, (%edx,%ecx,4)
	jmp	.L3
.L46:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	addl	%edx, (%edi,%eax,4)
	jmp	.L3
.L45:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	addl	$1, %esi
	movl	(%edi,%edx,4), %edx
	addl	%esi, (%edx,%ecx,4)
	jmp	.L3
.L44:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$1, %esi
	addl	%esi, (%edi,%eax,4)
	jmp	.L3
.L43:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movzbl	4(%esp), %ecx
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movl	(%edi,%esi,4), %esi
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	movl	(%esi,%eax,4), %eax
	negl	%eax
	movl	%eax, (%ecx,%ebx,4)
	jmp	.L3
.L42:
	leal	3(%ebp), %edx
	movl	8(%esp), %eax
	movzbl	4(%esp), %ecx
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%ebx,4), %eax
	negl	%eax
	movl	%eax, (%edi,%ecx,4)
	jmp	.L3
.L41:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 64(%edi)
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
	movzbl	4(%esp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	negl	%eax
	movl	%eax, (%edi,%edx,4)
	jmp	.L3
.L39:
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	4(%esp), %edx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	(%edx,%ecx,4), %esi
	cmpl	%esi, (%ebx,%eax,4)
	jle	.L186
	leal	5(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L38:
	leal	3(%ebp), %eax
	movl	%eax, 64(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jle	.L185
	leal	4(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L37:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jle	.L184
	leal	4(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L36:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jle	.L183
	leal	3(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L35:
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	4(%esp), %edx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	(%edx,%ecx,4), %esi
	cmpl	%esi, (%ebx,%eax,4)
	jl	.L182
	leal	5(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L34:
	leal	3(%ebp), %eax
	movl	%eax, 64(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jl	.L181
	leal	4(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L33:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jl	.L180
	leal	4(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L32:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jl	.L179
	leal	3(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L31:
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 64(%edi)
	movzbl	4(%esp), %edx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	(%edx,%ecx,4), %esi
	cmpl	%esi, (%ebx,%eax,4)
	je	.L249
	addl	$6, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L30:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 64(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	je	.L250
	addl	$5, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L29:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	je	.L251
	addl	$4, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L28:
	leal	3(%ebp), %eax
	movl	%eax, 64(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L175
	leal	4(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L27:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %edx
	testl	%edx, %edx
	je	.L174
	leal	3(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L26:
	leal	3(%ebp), %eax
	movl	%eax, 64(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ecx
	testl	%ecx, %ecx
	jne	.L173
	leal	4(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L25:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %ebx
	testl	%ebx, %ebx
	jne	.L172
	leal	3(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L24:
	leal	3(%ebp), %eax
	movl	%eax, 64(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	movzbl	4(%esp), %edx
	testl	%eax, %eax
	movl	%eax, (%edi,%edx,4)
	je	.L171
	leal	4(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L23:
	movzbl	4(%esp), %eax
	leal	(%edi,%eax,4), %edx
	subl	$1, (%edx)
	je	.L170
	leal	3(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L22:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	88(%edi), %eax
	jb	.L252
	cmpl	92(%edi), %eax
	jnb	.L168
	movl	%eax, 76(%edi)
	movl	%ebx, %ebp
	jmp	.L3
.L21:
	movl	76(%edi), %ecx
	leal	4(%ecx,%esi,4), %eax
	cmpl	92(%edi), %eax
	jnb	.L168
	movzbl	4(%esp), %edx
	movl	%ebx, %ebp
	movl	%ecx, (%edi,%edx,4)
	movl	%eax, 76(%edi)
	jmp	.L3
.L20:
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	leal	60(%edi), %ebx
	sall	$8, %eax
	movl	%ecx, 64(%edi)
	movzbl	2(%ebp), %edx
	orw	%dx, %ax
	je	.L205
	movl	76(%edi), %edx
	movl	88(%edi), %esi
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
	movl	%ebp, 76(%edi)
	movl	%edx, 4(%ebx)
	addw	%ax, %ax
	je	.L206
	movl	%ebp, %edx
	cmpl	%esi, %edx
	ja	.L165
.L168:
	movl	$6, 68(%edi)
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
	sall	$8, %eax
	movl	%ecx, 64(%edi)
	movzbl	2(%ebp), %edx
	orw	%dx, %ax
	je	.L203
	movl	76(%edi), %edx
	movl	92(%edi), %esi
	cmpl	%esi, %edx
	jnb	.L168
	movl	%edx, %ebp
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L253:
	leal	4(%ebp), %edx
	addl	$4, %ebx
	movl	%edx, 76(%edi)
	movl	-4(%ebx), %edx
	movl	%edx, 0(%ebp)
	movzwl	%ax, %edx
	sarl	%edx
	testw	%dx, %dx
	movl	%edx, %eax
	je	.L204
	movl	76(%edi), %ebp
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
	movl	64(%edi), %ebp
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L3
.L170:
	addl	$4, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L171:
	addl	$5, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L172:
	addl	$4, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L173:
	addl	$5, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L174:
	addl	$4, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L175:
	addl	$5, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L179:
	addl	$4, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L180:
	addl	$5, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L181:
	addl	$5, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L182:
	addl	$6, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L183:
	addl	$4, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L184:
	addl	$5, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L185:
	addl	$5, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L186:
	addl	$6, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L204:
	movl	%ecx, %ebp
	jmp	.L3
.L206:
	movl	%ecx, %ebp
	jmp	.L3
.L249:
	leal	5(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L251:
	leal	3(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L250:
	leal	4(%ebp), %edx
	movl	%edx, 64(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 64(%edi)
	jmp	.L3
.L187:
	movl	$5, 68(%edi)
	jmp	.L1
.L203:
	movl	%ecx, %ebp
	jmp	.L3
.L205:
	movl	%ecx, %ebp
	jmp	.L3
.L154:
	movl	$8, 68(%edi)
	jmp	.L1
.L158:
	movl	$2, 68(%edi)
	jmp	.L1
.L248:
	fstp	%st(0)
	fstp	%st(1)
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	fstps	(%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	flds	(%ebx)
	fxch	%st(1)
	jmp	.L200
.L243:
	fstp	%st(0)
	movl	%ecx, 4(%esp)
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	fstps	(%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	4(%esp), %ecx
	jmp	.L192
.L247:
	fstp	%st(0)
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	fstps	(%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L198
.L252:
	movl	$7, 68(%edi)
	jmp	.L1
.L242:
	fstp	%st(0)
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	fstps	(%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L194
.L239:
	movl	$13, 68(%edi)
	jmp	.L1
.L241:
	movl	$11, 68(%edi)
	jmp	.L1
.L246:
	fstp	%st(0)
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	fstps	(%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L196
.L245:
	fstp	%st(0)
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	fstps	(%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L188
.L244:
	fstp	%st(0)
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	fstps	(%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L190
	.cfi_endproc
.LFE138:
	.size	_ZN3GVM11Interpreter7executeEv, .-_ZN3GVM11Interpreter7executeEv
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1065353216
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
