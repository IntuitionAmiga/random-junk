	.file	"interpreter.cpp"
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB5:
	.text
.LHOTB5:
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
	cmpb	$-95, %al
	movl	%ecx, 8(%esp)
	ja	.L301
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
	.long	.L146
	.long	.L147
	.long	.L148
	.long	.L149
	.long	.L150
	.long	.L151
	.long	.L152
	.long	.L153
	.long	.L154
	.long	.L155
	.long	.L156
	.long	.L157
	.long	.L242
	.long	.L242
	.long	.L158
	.long	.L159
	.long	.L242
	.long	.L242
	.long	.L242
	.long	.L160
	.long	.L161
	.long	.L162
	.text
.L169:
	movl	$10, 84(%edi)
.L18:
	movl	88(%edi), %eax
	cmpl	96(%edi), %eax
	jbe	.L170
	leal	-4(%eax), %edx
	movl	%edx, 88(%edi)
	movl	-4(%eax), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L17:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%esi, %eax
	sall	$8, %eax
	orl	%edx, %eax
	cmpw	124(%edi), %ax
	jnb	.L304
	movl	116(%edi), %edx
	movzwl	%ax, %eax
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	je	.L169
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	*%eax
	movl	80(%edi), %ebp
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L3
.L16:
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	sall	$8, %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	orl	%edx, %eax
	cmpw	124(%edi), %ax
	jnb	.L305
	movl	88(%edi), %edx
	cmpl	100(%edi), %edx
	jnb	.L166
	leal	4(%edx), %ebx
	movzwl	%ax, %eax
	movl	%ebx, 88(%edi)
	movl	%ecx, (%edx)
	movl	112(%edi), %edx
	movl	(%edx,%eax,4), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L15:
	leal	3(%ebp), %edx
	movl	%esi, %eax
	sall	$8, %eax
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ebp
	orl	%eax, %ebp
	movl	88(%edi), %eax
	cmpl	100(%edi), %eax
	jnb	.L166
	leal	4(%eax), %ecx
	movswl	%bp, %ebp
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
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
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
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
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
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
	movl	%eax, %ebp
	jmp	.L3
.L160:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %eax
	vmovss	4(%eax), %xmm2
	vmulss	%xmm2, %xmm2, %xmm2
	vmovss	(%eax), %xmm1
	vmovss	8(%eax), %xmm0
	vfmadd132ss	%xmm1, %xmm2, %xmm1
	vfmadd132ss	%xmm0, %xmm1, %xmm0
	vsqrtss	%xmm0, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm1
	jp	.L306
.L236:
	movzbl	4(%esp), %eax
	vmovss	%xmm1, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L3
.L161:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ecx
	leal	(%edx,%eax,4), %eax
	movzbl	4(%esp), %edx
	vmovss	4(%eax), %xmm2
	vmulss	%xmm2, %xmm2, %xmm2
	vmovss	(%eax), %xmm1
	vmovss	8(%eax), %xmm0
	movl	(%edi,%edx,4), %edx
	vfmadd132ss	%xmm1, %xmm2, %xmm1
	vfmadd132ss	%xmm0, %xmm1, %xmm0
	vsqrtss	%xmm0, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm1
	leal	(%edx,%ecx,4), %ebx
	jp	.L307
.L238:
	vmovss	%xmm1, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L3
.L159:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	vmovss	(%eax), %xmm0
	vsubss	(%edx), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	4(%eax), %xmm0
	vsubss	4(%edx), %xmm0, %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	8(%eax), %xmm0
	vsubss	8(%edx), %xmm0, %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L3
.L158:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	vmovss	(%eax), %xmm0
	vaddss	(%edx), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	4(%eax), %xmm0
	vaddss	4(%edx), %xmm0, %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	8(%eax), %xmm0
	vaddss	8(%edx), %xmm0, %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L3
.L162:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	leal	(%edx,%eax,4), %ebx
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %edx
	vmovss	4(%ebx), %xmm1
	vmulss	%xmm1, %xmm1, %xmm1
	vmovss	8(%ebx), %xmm0
	vmovss	(%ebx), %xmm2
	movl	(%edi,%eax,4), %eax
	vfmadd231ss	%xmm2, %xmm2, %xmm1
	vfmadd231ss	%xmm0, %xmm0, %xmm1
	vsqrtss	%xmm1, %xmm0, %xmm0
	vucomiss	%xmm0, %xmm0
	leal	(%eax,%edx,4), %esi
	jp	.L308
.L240:
	vmovss	.LC3, %xmm1
	movl	80(%edi), %ebp
	vdivss	%xmm0, %xmm1, %xmm0
	vmulss	%xmm0, %xmm2, %xmm2
	vmovss	%xmm2, (%esi)
	vmulss	4(%ebx), %xmm0, %xmm1
	vmovss	%xmm1, 4(%esi)
	vmulss	8(%ebx), %xmm0, %xmm0
	vmovss	%xmm0, 8(%esi)
	jmp	.L3
.L242:
	movl	%ebx, %ebp
	jmp	.L3
.L157:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %edx
	movzbl	4(%esp), %eax
	vmovss	(%edx), %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	vmovss	%xmm0, (%eax)
	vmovss	4(%edx), %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	8(%edx), %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L3
.L156:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %ecx
	vmovss	(%ecx,%eax,4), %xmm0
	movzbl	4(%esp), %eax
	movzbl	3(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 4(%eax)
	vmovss	%xmm0, 8(%eax)
	jmp	.L3
.L155:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %ecx
	movl	8(%esp), %esi
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %eax
	leal	(%edi,%esi,4), %edx
	vmovss	(%edx), %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	(%edx), %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	(%edx), %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L3
.L154:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	vxorps	%xmm0, %xmm0, %xmm0
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	vcvtsi2ss	8(%esp), %xmm0, %xmm0
	leal	(%eax,%ecx,4), %eax
	vmovss	%xmm0, (%eax)
	vmovss	%xmm0, 4(%eax)
	vmovss	%xmm0, 8(%eax)
	jmp	.L3
.L153:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %eax
	leal	4(%ebp), %ebx
	movl	20(%esp), %esi
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
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	%ecx, (%eax,%edx,4)
	jmp	.L3
.L152:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
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
	movl	8(%esp), %edx
	movl	%edx, (%edi,%eax,4)
	jmp	.L3
.L151:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
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
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	%ecx, (%eax,%edx,4)
	jmp	.L3
.L150:
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
	movl	8(%esp), %edx
	movl	%edx, (%edi,%eax,4)
	jmp	.L3
.L149:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %eax
	leal	4(%ebp), %ebx
	movl	20(%esp), %esi
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
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	%ecx, (%eax,%edx,4)
	jmp	.L3
.L148:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
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
	movl	8(%esp), %edx
	movl	%edx, (%edi,%eax,4)
	jmp	.L3
.L147:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
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
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	%ecx, (%eax,%edx,4)
	jmp	.L3
.L146:
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
	movl	8(%esp), %edx
	movl	%edx, (%edi,%eax,4)
	jmp	.L3
.L145:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %eax
	leal	4(%ebp), %ebx
	movl	20(%esp), %esi
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
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	%ecx, (%eax,%edx,4)
	jmp	.L3
.L144:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
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
	movl	8(%esp), %edx
	movl	%edx, (%edi,%eax,4)
	jmp	.L3
.L143:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	leal	3(%ebp), %ebx
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
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	movl	%ecx, (%eax,%edx,4)
	jmp	.L3
.L142:
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
	movl	8(%esp), %edx
	movl	%edx, (%edi,%eax,4)
	jmp	.L3
.L141:
	movzbl	4(%esp), %ecx
.L163:
	leal	1(%ebx), %eax
	leal	2(%ebx), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	(%ebx), %eax
	movl	%edx, 80(%edi)
	movzbl	1(%ebx), %ebx
	movl	(%edi,%ecx,4), %edx
	leal	(%edx,%ebx,4), %ebx
	movl	(%edi,%esi,4), %edx
	vsqrtss	(%edx,%eax,4), %xmm0, %xmm0
	vucomiss	%xmm0, %xmm0
	jp	.L309
.L234:
	vmovss	%xmm0, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L3
.L140:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%esi,4), %edx
	vsqrtss	(%edx,%eax,4), %xmm0, %xmm0
	vucomiss	%xmm0, %xmm0
	jp	.L310
.L232:
	vmovss	%xmm0, (%edi,%ecx,4)
	movl	80(%edi), %ebx
	jmp	.L163
.L139:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movl	8(%esp), %eax
	vsqrtss	(%edi,%eax,4), %xmm0, %xmm0
	vucomiss	%xmm0, %xmm0
	jp	.L311
.L230:
	vmovss	%xmm0, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L3
.L138:
	movl	8(%esp), %eax
	vsqrtss	(%edi,%eax,4), %xmm0, %xmm0
	vucomiss	%xmm0, %xmm0
	jp	.L312
.L228:
	movzbl	4(%esp), %eax
	vmovss	%xmm0, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L3
.L137:
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movl	(%edi,%esi,4), %ebx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%edx,4), %edx
	vmovss	(%ebx,%eax,4), %xmm0
	vucomiss	(%edx,%ecx,4), %xmm0
	jbe	.L294
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
.L136:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	vmovss	(%edx,%ecx,4), %xmm0
	vucomiss	(%edi,%eax,4), %xmm0
	jbe	.L293
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
.L135:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	vmovss	(%edi,%esi,4), %xmm0
	movl	(%edi,%eax,4), %eax
	vucomiss	(%eax,%edx,4), %xmm0
	jbe	.L292
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
.L134:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	vmovss	(%edi,%esi,4), %xmm0
	vucomiss	(%edi,%eax,4), %xmm0
	jbe	.L291
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
.L133:
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movl	(%edi,%esi,4), %ebx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%edx,4), %edx
	vmovss	(%ebx,%eax,4), %xmm0
	vucomiss	(%edx,%ecx,4), %xmm0
	jb	.L290
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
.L132:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	vmovss	(%edx,%ecx,4), %xmm0
	vucomiss	(%edi,%eax,4), %xmm0
	jb	.L289
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
.L131:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	vmovss	(%edi,%esi,4), %xmm0
	movl	(%edi,%eax,4), %eax
	vucomiss	(%eax,%edx,4), %xmm0
	jb	.L288
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
.L130:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	vmovss	(%edi,%esi,4), %xmm0
	vucomiss	(%edi,%eax,4), %xmm0
	jb	.L287
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
.L129:
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movl	(%edi,%esi,4), %ebx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%edx,4), %edx
	vmovss	(%ebx,%eax,4), %xmm0
	vsubss	(%edx,%ecx,4), %xmm0, %xmm0
	vucomiss	.LC1, %xmm0
	jb	.L209
	vmovss	.LC2, %xmm1
	vucomiss	%xmm0, %xmm1
	jb	.L209
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
.L128:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	vmovss	(%edx,%ecx,4), %xmm0
	vsubss	(%edi,%eax,4), %xmm0, %xmm0
	vucomiss	.LC1, %xmm0
	jb	.L206
	vmovss	.LC2, %xmm1
	vucomiss	%xmm0, %xmm1
	jb	.L206
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
.L127:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	vmovss	(%edi,%esi,4), %xmm0
	movl	(%edi,%eax,4), %eax
	vsubss	(%eax,%edx,4), %xmm0, %xmm0
	vucomiss	.LC1, %xmm0
	jb	.L203
	vmovss	.LC2, %xmm1
	vucomiss	%xmm0, %xmm1
	jb	.L203
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
.L126:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	vmovss	(%edi,%esi,4), %xmm0
	vsubss	(%edi,%eax,4), %xmm0, %xmm0
	vucomiss	.LC1, %xmm0
	jb	.L200
	vmovss	.LC2, %xmm1
	vucomiss	%xmm0, %xmm1
	jb	.L200
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
	movl	20(%esp), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	12(%esp), %edx
	movl	%eax, (%ebx)
	movl	80(%edi), %ebx
.L164:
	leal	1(%ebx), %eax
	leal	2(%ebx), %ecx
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	movl	16(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	(%ebx), %eax
	movl	%ecx, 80(%edi)
	movzbl	1(%ebx), %ecx
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %ebx
	movl	(%edi,%esi,4), %edx
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 60
	pushl	(%ebx)
	.cfi_def_cfa_offset 64
	call	fmodf
	fstps	20(%esp)
	movl	20(%esp), %eax
	movl	80(%edi), %ebp
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	%eax, (%ebx)
	jmp	.L3
.L125:
	movzbl	4(%esp), %edx
	jmp	.L164
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
	fstps	20(%esp)
	movl	20(%esp), %eax
	movl	80(%edi), %ebp
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	%eax, (%ebx)
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
	movl	20(%esp), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	%eax, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L3
.L121:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	vmovss	(%ecx), %xmm0
	vdivss	(%ebx,%eax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%ecx)
	jmp	.L3
.L120:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	vmovss	(%edx), %xmm0
	vdivss	(%ecx,%ebx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%edx)
	jmp	.L3
.L119:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	vmovss	(%edx), %xmm0
	vdivss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%edx)
	jmp	.L3
.L118:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	vmovss	(%eax), %xmm0
	vdivss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	jmp	.L3
.L117:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	vmovss	(%ecx), %xmm0
	vmulss	(%ebx,%eax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%ecx)
	jmp	.L3
.L116:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	vmovss	(%edx), %xmm0
	vmulss	(%ecx,%ebx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%edx)
	jmp	.L3
.L115:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	vmovss	(%edx), %xmm0
	vmulss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%edx)
	jmp	.L3
.L114:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	vmovss	(%eax), %xmm0
	vmulss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	jmp	.L3
.L113:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	vmovss	(%ecx), %xmm0
	vsubss	(%ebx,%eax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%ecx)
	jmp	.L3
.L112:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	vmovss	(%edx), %xmm0
	vsubss	(%ecx,%ebx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%edx)
	jmp	.L3
.L111:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	vmovss	(%edx), %xmm0
	vsubss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%edx)
	jmp	.L3
.L110:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	vmovss	(%eax), %xmm0
	vsubss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	jmp	.L3
.L109:
	movzbl	4(%esp), %ecx
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movl	(%edi,%esi,4), %ebx
	vmovss	(%ecx), %xmm0
	vaddss	(%ebx,%eax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%ecx)
	jmp	.L3
.L108:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%edi,%edx,4), %edx
	vmovss	(%edx), %xmm0
	vaddss	(%ecx,%ebx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%edx)
	jmp	.L3
.L107:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ecx,4), %edx
	vmovss	(%edx), %xmm0
	vaddss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%edx)
	jmp	.L3
.L106:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	vmovss	(%eax), %xmm0
	vaddss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	jmp	.L3
.L105:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movzbl	4(%esp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %esi
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	vmovss	(%esi,%eax,4), %xmm0
	vxorps	.LC0, %xmm0, %xmm0
	vmovss	%xmm0, (%ecx,%ebx,4)
	jmp	.L3
.L104:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	vmovss	(%ecx,%ebx,4), %xmm0
	vxorps	.LC0, %xmm0, %xmm0
	vmovss	%xmm0, (%edi,%edx,4)
	jmp	.L3
.L103:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	vmovss	(%edi,%esi,4), %xmm0
	vxorps	.LC0, %xmm0, %xmm0
	movl	(%edi,%edx,4), %edx
	vmovss	%xmm0, (%edx,%ecx,4)
	jmp	.L3
.L102:
	movl	8(%esp), %esi
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	vmovss	(%edi,%esi,4), %xmm0
	vxorps	.LC0, %xmm0, %xmm0
	vmovss	%xmm0, (%edi,%eax,4)
	jmp	.L3
.L101:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movzbl	4(%esp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %esi
	movzbl	3(%ebp), %ebx
	movl	(%edi,%ecx,4), %ebp
	movl	(%esi,%eax,4), %eax
	movl	%eax, %ecx
	shrl	%cl, 0(%ebp,%ebx,4)
	movl	%edx, %ebp
	jmp	.L3
.L100:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	%ebx, %ecx
	shrl	%cl, (%edx,%ebp,4)
	movl	%eax, %ebp
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
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	addl	$1, %esi
	movl	(%edi,%edx,4), %edx
	movl	%esi, %ecx
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
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movzbl	4(%esp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %esi
	movzbl	3(%ebp), %ebx
	movl	(%edi,%ecx,4), %ebp
	movl	(%esi,%eax,4), %eax
	movl	%eax, %ecx
	sall	%cl, 0(%ebp,%ebx,4)
	movl	%edx, %ebp
	jmp	.L3
.L94:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	%ebx, %ecx
	sall	%cl, (%edx,%ebp,4)
	movl	%eax, %ebp
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
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	addl	$1, %esi
	movl	(%edi,%edx,4), %edx
	movl	%esi, %ecx
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
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
	movl	%edx, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %ebx
	movzbl	3(%ebp), %eax
	movl	(%ebx,%ecx,4), %ebx
	testl	%ebx, %ebx
	je	.L199
	movzbl	4(%esp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	andl	%ebx, (%ecx,%eax,4)
	jmp	.L3
.L72:
	leal	3(%ebp), %ecx
	movl	8(%esp), %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L199
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
	je	.L199
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
	je	.L199
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
	movl	%ecx, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %ebx
	movzbl	3(%ebp), %eax
	movl	(%ebx,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L199
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
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L199
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
	je	.L199
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
	je	.L199
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
	movl	%ecx, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
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
	movl	8(%esp), %esi
	movl	%edx, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
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
	movl	%edx, 80(%edi)
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
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	(%edx,%ecx,4), %esi
	cmpl	%esi, (%ebx,%eax,4)
	jle	.L198
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
	jle	.L197
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
	jle	.L196
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
	jle	.L195
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
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	(%edx,%ecx,4), %esi
	cmpl	%esi, (%ebx,%eax,4)
	jl	.L194
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
	jl	.L193
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
	jl	.L192
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
	jl	.L191
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
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	3(%ebp), %ecx
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	(%edx,%ecx,4), %esi
	cmpl	%esi, (%ebx,%eax,4)
	je	.L313
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
	je	.L314
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L29:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	je	.L315
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
	je	.L187
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
	je	.L186
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
	jne	.L185
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
	jne	.L184
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
	testl	%eax, %eax
	movl	%eax, (%edi,%edx,4)
	je	.L183
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
	je	.L182
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
	jb	.L316
	cmpl	108(%edi), %eax
	jnb	.L180
	movl	%eax, 92(%edi)
	movl	%ebx, %ebp
	jmp	.L3
.L21:
	movl	92(%edi), %ecx
	leal	4(%ecx,%esi,4), %eax
	cmpl	108(%edi), %eax
	jnb	.L180
	movzbl	4(%esp), %edx
	movl	%ebx, %ebp
	movl	%ecx, (%edi,%edx,4)
	movl	%eax, 92(%edi)
	jmp	.L3
.L20:
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	leal	60(%edi), %ebx
	sall	$8, %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	orw	%dx, %ax
	je	.L245
	movl	92(%edi), %edx
	movl	104(%edi), %esi
	cmpl	%esi, %edx
	ja	.L177
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L178:
	subl	$4, %ebx
	cmpl	%esi, %edx
	jbe	.L180
.L177:
	testw	%ax, %ax
	jns	.L178
	leal	-4(%edx), %ebp
	movl	-4(%edx), %edx
	subl	$4, %ebx
	movl	%ebp, 92(%edi)
	movl	%edx, 4(%ebx)
	addw	%ax, %ax
	je	.L246
	movl	%ebp, %edx
	cmpl	%esi, %edx
	ja	.L177
.L180:
	movl	$6, 84(%edi)
.L301:
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
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	orw	%dx, %ax
	je	.L243
	movl	92(%edi), %edx
	movl	108(%edi), %esi
	cmpl	%esi, %edx
	jnb	.L180
	movl	%edx, %ebp
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L317:
	leal	4(%ebp), %edx
	addl	$4, %ebx
	movl	%edx, 92(%edi)
	movl	-4(%ebx), %edx
	movl	%edx, 0(%ebp)
	movzwl	%ax, %edx
	sarl	%edx
	testw	%dx, %dx
	movl	%edx, %eax
	je	.L244
	movl	92(%edi), %ebp
.L175:
	cmpl	%esi, %ebp
	jnb	.L180
.L173:
	testb	$1, %al
	jne	.L317
.L4:
	addl	$4, %ebx
	jmp	.L175
.L200:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L209:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L206:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L203:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L182:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L183:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L184:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L185:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L186:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L187:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L191:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L192:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L193:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L194:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L195:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L196:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L197:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L198:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L287:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L288:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L289:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L290:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L291:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L292:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L293:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L294:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L3
.L244:
	movl	%ecx, %ebp
	jmp	.L3
.L246:
	movl	%ecx, %ebp
	jmp	.L3
.L315:
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
.L314:
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
.L313:
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
.L199:
	movl	$5, 84(%edi)
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
.L243:
	.cfi_restore_state
	movl	%ecx, %ebp
	jmp	.L3
.L245:
	movl	%ecx, %ebp
	jmp	.L3
.L166:
	movl	$8, 84(%edi)
	jmp	.L301
.L170:
	movl	$2, 84(%edi)
	jmp	.L301
.L304:
	movl	$13, 84(%edi)
	jmp	.L301
.L312:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	8(%esp)
	vmovss	8(%esp), %xmm0
	jmp	.L228
.L316:
	movl	$7, 84(%edi)
	jmp	.L301
.L308:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm1, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	(%ebx), %xmm2
	vmovss	4(%esp), %xmm0
	jmp	.L240
.L310:
	movl	%ecx, 12(%esp)
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	movl	12(%esp), %ecx
	vmovss	4(%esp), %xmm0
	jmp	.L232
.L309:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	4(%esp), %xmm0
	jmp	.L234
.L305:
	movl	$11, 84(%edi)
	jmp	.L301
.L307:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	4(%esp), %xmm1
	jmp	.L238
.L306:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	8(%esp)
	vmovss	8(%esp), %xmm1
	jmp	.L236
.L311:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movl	20(%esp), %eax
	pushl	(%edi,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	4(%esp), %xmm0
	jmp	.L230
	.cfi_endproc
.LFE119:
	.size	_ZN3GVM11Interpreter7executeEv, .-_ZN3GVM11Interpreter7executeEv
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
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
	.long	3019898880
	.align 4
.LC2:
	.long	872415232
	.align 4
.LC3:
	.long	1065353216
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
