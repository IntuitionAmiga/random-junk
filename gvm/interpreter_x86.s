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
.L2:
	leal	1(%ebp), %eax
	leal	2(%ebp), %ebx
	movl	%eax, 80(%edi)
	movl	%eax, 12(%esp)
	movzbl	0(%ebp), %eax
	movl	%ebx, 80(%edi)
	movzbl	1(%ebp), %esi
	movl	%esi, %ecx
	movl	%esi, %edx
	andl	$15, %ecx
	movb	%cl, 4(%esp)
	movl	%esi, %ecx
	sarl	$4, %ecx
	movl	%ecx, 8(%esp)
	cmpb	$-59, %al
	ja	.L3
	jmp	*.L5(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L4
	.long	.L6
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
	.long	.L1
	.long	.L1
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
	.long	.L158
	.long	.L159
	.long	.L160
	.long	.L161
	.long	.L162
	.long	.L163
	.long	.L164
	.long	.L165
	.long	.L166
	.long	.L167
	.long	.L168
	.long	.L169
	.long	.L170
	.long	.L171
	.long	.L172
	.long	.L173
	.long	.L174
	.long	.L175
	.long	.L176
	.long	.L177
	.long	.L178
	.long	.L179
	.long	.L180
	.long	.L181
	.long	.L182
	.long	.L183
	.long	.L184
	.long	.L185
	.long	.L186
	.long	.L187
	.long	.L188
	.long	.L189
	.long	.L190
	.long	.L191
	.long	.L192
	.long	.L193
	.long	.L194
	.long	.L195
	.long	.L196
	.long	.L197
	.long	.L198
	.long	.L199
	.long	.L200
	.long	.L201
	.text
.L3:
	movl	$4, 84(%edi)
.L18:
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
.L17:
	.cfi_restore_state
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	sall	$8, %eax
	orw	%dx, %ax
	je	.L206
	cmpw	124(%edi), %ax
	jnb	.L206
	movl	88(%edi), %edx
	cmpl	100(%edi), %edx
	jnb	.L205
	movzwl	%ax, %eax
	leal	4(%edx), %ebx
	movl	%ebx, 88(%edi)
	movl	%ecx, (%edx)
	movl	112(%edi), %edx
	movl	(%edx,%eax,4), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L16:
	leal	3(%ebp), %edx
	movl	%esi, %eax
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movl	88(%edi), %eax
	cmpl	100(%edi), %eax
	jnb	.L205
	movswl	%bp, %ebp
	leal	4(%eax), %ecx
	movl	%ecx, 88(%edi)
	movl	%edx, (%eax)
	addl	80(%edi), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L15:
	movzbl	2(%ebp), %ebp
	movl	%esi, %eax
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%ebx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L14:
	movsbl	%dl, %edx
	leal	(%ebx,%edx), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L13:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movss	76(%edi), %xmm0
	movl	(%edi,%edx,4), %edx
	movss	%xmm0, (%edx,%ecx,4)
	jmp	.L2
.L12:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movss	76(%edi), %xmm0
	movss	%xmm0, (%edi,%eax,4)
	jmp	.L2
.L11:
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
	jmp	.L2
.L10:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %edx
	movl	(%edx,%ecx,4), %ecx
	movzbl	4(%esp), %edx
	movl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L9:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	movl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L8:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	%edx, (%edi,%eax,4)
	jmp	.L2
.L7:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	%esi, (%edx,%ecx,4)
	jmp	.L2
.L6:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	%esi, (%edi,%eax,4)
	jmp	.L2
.L4:
	movl	12(%esp), %eax
	movl	%eax, 80(%edi)
	movl	%eax, %ebp
	jmp	.L2
.L200:
	movss	64(%edi), %xmm0
	leal	3(%ebp), %eax
	movss	68(%edi), %xmm2
	movl	%eax, 80(%edi)
	movaps	%xmm0, %xmm3
	movss	72(%edi), %xmm1
	mulss	%xmm0, %xmm3
	movzbl	4(%esp), %eax
	mulss	%xmm2, %xmm2
	movzbl	2(%ebp), %edx
	mulss	%xmm1, %xmm1
	movl	(%edi,%eax,4), %eax
	addss	%xmm3, %xmm2
	addss	%xmm2, %xmm1
	leal	(%eax,%edx,4), %ebx
	sqrtss	%xmm1, %xmm2
	ucomiss	%xmm2, %xmm2
	jp	.L353
.L288:
	movss	.LC3, %xmm1
	movl	80(%edi), %ebp
	divss	%xmm2, %xmm1
	mulss	%xmm1, %xmm0
	movss	%xmm0, (%ebx)
	movss	68(%edi), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, 4(%ebx)
	mulss	72(%edi), %xmm1
	movss	%xmm1, 8(%ebx)
	jmp	.L2
.L199:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movss	(%ebx), %xmm2
	movss	4(%ebx), %xmm1
	movaps	%xmm2, %xmm3
	movss	8(%ebx), %xmm0
	mulss	%xmm2, %xmm3
	mulss	%xmm1, %xmm1
	mulss	%xmm0, %xmm0
	addss	%xmm3, %xmm1
	addss	%xmm1, %xmm0
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm1
	jp	.L354
.L286:
	movss	.LC3, %xmm0
	movl	80(%edi), %ebp
	divss	%xmm1, %xmm0
	mulss	%xmm0, %xmm2
	movss	%xmm2, 64(%edi)
	movss	4(%ebx), %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, 68(%edi)
	mulss	8(%ebx), %xmm0
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L198:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	leal	(%edx,%eax,4), %ebx
	movzbl	4(%esp), %eax
	movss	(%ebx), %xmm2
	movss	4(%ebx), %xmm1
	movaps	%xmm2, %xmm3
	movss	8(%ebx), %xmm0
	mulss	%xmm2, %xmm3
	movzbl	3(%ebp), %edx
	mulss	%xmm1, %xmm1
	movl	(%edi,%eax,4), %eax
	mulss	%xmm0, %xmm0
	addss	%xmm3, %xmm1
	leal	(%eax,%edx,4), %esi
	addss	%xmm1, %xmm0
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm1
	jp	.L355
.L284:
	movss	.LC3, %xmm0
	movl	80(%edi), %ebp
	divss	%xmm1, %xmm0
	mulss	%xmm0, %xmm2
	movss	%xmm2, (%esi)
	movss	4(%ebx), %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, 4(%esi)
	mulss	8(%ebx), %xmm0
	movss	%xmm0, 8(%esi)
	jmp	.L2
.L197:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movss	(%ebx), %xmm2
	movss	4(%ebx), %xmm1
	movaps	%xmm2, %xmm4
	movss	8(%ebx), %xmm3
	mulss	%xmm2, %xmm4
	movaps	%xmm1, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm0, %xmm4
	movaps	%xmm3, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm4, %xmm0
	sqrtss	%xmm0, %xmm4
	ucomiss	%xmm4, %xmm4
	jp	.L356
.L282:
	movss	.LC3, %xmm0
	movl	80(%edi), %ebp
	divss	%xmm4, %xmm0
	mulss	%xmm0, %xmm2
	mulss	%xmm0, %xmm1
	mulss	%xmm3, %xmm0
	movss	%xmm2, (%ebx)
	movss	%xmm1, 4(%ebx)
	movss	%xmm0, 8(%ebx)
	jmp	.L2
.L196:
	movss	64(%edi), %xmm2
	movss	68(%edi), %xmm1
	mulss	%xmm2, %xmm2
	movss	72(%edi), %xmm0
	mulss	%xmm1, %xmm1
	mulss	%xmm0, %xmm0
	addss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm1
	jp	.L357
.L280:
	movl	80(%edi), %eax
	movss	%xmm1, 76(%edi)
	leal	-1(%eax), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L195:
	movss	64(%edi), %xmm2
	leal	3(%ebp), %eax
	movss	68(%edi), %xmm1
	movl	%eax, 80(%edi)
	mulss	%xmm2, %xmm2
	movss	72(%edi), %xmm0
	mulss	%xmm1, %xmm1
	movzbl	4(%esp), %eax
	mulss	%xmm0, %xmm0
	movzbl	2(%ebp), %edx
	addss	%xmm2, %xmm1
	movl	(%edi,%eax,4), %eax
	addss	%xmm1, %xmm0
	leal	(%eax,%edx,4), %ebx
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm1
	jp	.L358
.L278:
	movss	%xmm1, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L2
.L194:
	movss	64(%edi), %xmm2
	movss	68(%edi), %xmm1
	mulss	%xmm2, %xmm2
	movss	72(%edi), %xmm0
	mulss	%xmm1, %xmm1
	mulss	%xmm0, %xmm0
	addss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	sqrtss	%xmm0, %xmm1
	ucomiss	%xmm1, %xmm1
	jp	.L359
.L276:
	movzbl	4(%esp), %eax
	movss	%xmm1, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L2
.L193:
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
	jp	.L360
.L274:
	movss	%xmm1, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L2
.L192:
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
	jp	.L361
.L272:
	movzbl	4(%esp), %eax
	movss	%xmm1, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L2
.L191:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movss	64(%edi), %xmm1
	movss	72(%edi), %xmm0
	movl	(%edi,%esi,4), %ecx
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	leal	(%ecx,%eax,4), %eax
	movzbl	4(%esp), %ecx
	movss	(%eax), %xmm2
	mulss	8(%eax), %xmm0
	mulss	%xmm1, %xmm2
	movss	68(%edi), %xmm1
	mulss	4(%eax), %xmm1
	movl	(%edi,%ecx,4), %ecx
	addss	%xmm1, %xmm2
	addss	%xmm2, %xmm0
	movss	%xmm0, (%ecx,%ebx,4)
	jmp	.L2
.L190:
	movl	8(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movss	64(%edi), %xmm1
	movss	72(%edi), %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	movzbl	4(%esp), %ecx
	movss	(%eax), %xmm2
	mulss	8(%eax), %xmm0
	mulss	%xmm1, %xmm2
	movss	68(%edi), %xmm1
	mulss	4(%eax), %xmm1
	addss	%xmm1, %xmm2
	addss	%xmm2, %xmm0
	movss	%xmm0, (%edi,%ecx,4)
	jmp	.L2
.L189:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	leal	4(%ebp), %eax
	movzbl	2(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%ecx,%edx,4), %edx
	movzbl	4(%esp), %ecx
	movss	(%edx), %xmm2
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movss	(%ecx), %xmm1
	movss	8(%ecx), %xmm0
	mulss	%xmm1, %xmm2
	movss	4(%ecx), %xmm1
	mulss	4(%edx), %xmm1
	mulss	8(%edx), %xmm0
	addss	%xmm1, %xmm2
	addss	%xmm2, %xmm0
	movss	%xmm0, 76(%edi)
	jmp	.L2
.L188:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%ecx,%eax,4), %eax
	movzbl	4(%esp), %ecx
	movss	4(%eax), %xmm0
	movss	8(%eax), %xmm1
	mulss	72(%edi), %xmm0
	mulss	68(%edi), %xmm1
	movl	(%edi,%ecx,4), %ecx
	subss	%xmm1, %xmm0
	leal	(%ecx,%ebx,4), %ecx
	movss	%xmm0, (%ecx)
	movss	8(%eax), %xmm0
	movss	(%eax), %xmm1
	mulss	64(%edi), %xmm0
	mulss	72(%edi), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, 4(%ecx)
	movss	(%eax), %xmm0
	movss	4(%eax), %xmm1
	mulss	68(%edi), %xmm0
	mulss	64(%edi), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, 8(%ecx)
	jmp	.L2
.L187:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movss	68(%edi), %xmm0
	movss	72(%edi), %xmm1
	movl	(%edi,%esi,4), %ecx
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	leal	(%ecx,%eax,4), %eax
	movzbl	4(%esp), %ecx
	mulss	4(%eax), %xmm1
	mulss	8(%eax), %xmm0
	movl	(%edi,%ecx,4), %ecx
	subss	%xmm1, %xmm0
	leal	(%ecx,%ebx,4), %ecx
	movss	%xmm0, (%ecx)
	movss	72(%edi), %xmm0
	movss	64(%edi), %xmm1
	mulss	(%eax), %xmm0
	mulss	8(%eax), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, 4(%ecx)
	movss	64(%edi), %xmm0
	movss	68(%edi), %xmm1
	mulss	4(%eax), %xmm0
	mulss	(%eax), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, 8(%ecx)
	jmp	.L2
.L186:
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
	movss	4(%edx), %xmm0
	movss	8(%edx), %xmm1
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	mulss	4(%eax), %xmm1
	mulss	8(%eax), %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, 64(%edi)
	movss	8(%edx), %xmm0
	movss	(%edx), %xmm1
	mulss	(%eax), %xmm0
	mulss	8(%eax), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, 68(%edi)
	movss	(%edx), %xmm0
	movss	4(%edx), %xmm1
	mulss	4(%eax), %xmm0
	mulss	(%eax), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L185:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%edx, %ebp
	movss	64(%edi), %xmm0
	movl	(%edi,%esi,4), %ecx
	leal	(%ecx,%eax,4), %ecx
	movzbl	4(%esp), %eax
	subss	(%ecx), %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	movss	%xmm0, (%eax)
	movss	68(%edi), %xmm0
	subss	4(%ecx), %xmm0
	movss	%xmm0, 4(%eax)
	movss	72(%edi), %xmm0
	subss	8(%ecx), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L2
.L184:
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
	movss	(%ecx), %xmm0
	subss	64(%edi), %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	movss	%xmm0, (%eax)
	movss	4(%ecx), %xmm0
	subss	68(%edi), %xmm0
	movss	%xmm0, 4(%eax)
	movss	8(%ecx), %xmm0
	subss	72(%edi), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L2
.L183:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	leal	4(%ebp), %eax
	movzbl	2(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%ecx,%edx,4), %edx
	movzbl	4(%esp), %ecx
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movss	(%ecx), %xmm0
	subss	(%edx), %xmm0
	movss	%xmm0, 64(%edi)
	movss	4(%ecx), %xmm0
	subss	4(%edx), %xmm0
	movss	%xmm0, 68(%edi)
	movss	8(%ecx), %xmm0
	subss	8(%edx), %xmm0
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L182:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	movss	(%eax), %xmm0
	subss	64(%edi), %xmm0
	movss	%xmm0, (%eax)
	movss	4(%eax), %xmm0
	subss	68(%edi), %xmm0
	movss	%xmm0, 4(%eax)
	movss	8(%eax), %xmm0
	subss	72(%edi), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L2
.L181:
	movl	8(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movss	64(%edi), %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	subss	(%eax), %xmm0
	movss	%xmm0, 64(%edi)
	movss	68(%edi), %xmm0
	subss	4(%eax), %xmm0
	movss	%xmm0, 68(%edi)
	movss	72(%edi), %xmm0
	subss	8(%eax), %xmm0
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L180:
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
	jmp	.L2
.L179:
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
	movss	(%ecx), %xmm0
	addss	64(%edi), %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	movss	%xmm0, (%eax)
	movss	4(%ecx), %xmm0
	addss	68(%edi), %xmm0
	movss	%xmm0, 4(%eax)
	movss	8(%ecx), %xmm0
	addss	72(%edi), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L2
.L178:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	leal	4(%ebp), %eax
	movzbl	2(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	3(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	leal	(%ecx,%edx,4), %edx
	movzbl	4(%esp), %ecx
	movl	(%edi,%ecx,4), %ecx
	leal	(%ecx,%ebx,4), %ecx
	movss	(%ecx), %xmm0
	addss	(%edx), %xmm0
	movss	%xmm0, 64(%edi)
	movss	4(%ecx), %xmm0
	addss	4(%edx), %xmm0
	movss	%xmm0, 68(%edi)
	movss	8(%ecx), %xmm0
	addss	8(%edx), %xmm0
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L177:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	movss	(%eax), %xmm0
	addss	64(%edi), %xmm0
	movss	%xmm0, (%eax)
	movss	4(%eax), %xmm0
	addss	68(%edi), %xmm0
	movss	%xmm0, 4(%eax)
	movss	8(%eax), %xmm0
	addss	72(%edi), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L2
.L176:
	movl	8(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movss	64(%edi), %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	addss	(%eax), %xmm0
	movss	%xmm0, 64(%edi)
	movss	68(%edi), %xmm0
	addss	4(%eax), %xmm0
	movss	%xmm0, 68(%edi)
	movss	72(%edi), %xmm0
	addss	8(%eax), %xmm0
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L175:
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
	jmp	.L2
.L174:
	movss	76(%edi), %xmm0
	movss	64(%edi), %xmm1
	movl	12(%esp), %eax
	mulss	%xmm0, %xmm1
	movl	%eax, 80(%edi)
	movl	%eax, %ebp
	movss	%xmm1, 64(%edi)
	movss	68(%edi), %xmm1
	mulss	%xmm0, %xmm1
	mulss	72(%edi), %xmm0
	movss	%xmm1, 68(%edi)
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L173:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movss	64(%edi), %xmm1
	movl	(%edi,%esi,4), %edx
	movss	(%edx,%ecx,4), %xmm0
	mulss	%xmm0, %xmm1
	movss	%xmm1, 64(%edi)
	movss	68(%edi), %xmm1
	mulss	%xmm0, %xmm1
	mulss	72(%edi), %xmm0
	movss	%xmm1, 68(%edi)
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L172:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	movss	64(%edi), %xmm1
	movss	(%edi,%eax,4), %xmm0
	mulss	%xmm0, %xmm1
	movss	%xmm1, 64(%edi)
	movss	68(%edi), %xmm1
	mulss	%xmm0, %xmm1
	mulss	72(%edi), %xmm0
	movss	%xmm1, 68(%edi)
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L171:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	movss	(%eax), %xmm0
	mulss	76(%edi), %xmm0
	movss	%xmm0, (%eax)
	movss	4(%eax), %xmm0
	mulss	76(%edi), %xmm0
	movss	%xmm0, 4(%eax)
	movss	8(%eax), %xmm0
	mulss	76(%edi), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L2
.L170:
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
	movss	(%eax), %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, (%eax)
	movss	4(%eax), %xmm1
	mulss	%xmm0, %xmm1
	mulss	8(%eax), %xmm0
	movss	%xmm1, 4(%eax)
	movss	%xmm0, 8(%eax)
	jmp	.L2
.L169:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	leal	(%edi,%esi,4), %ecx
	movss	(%eax), %xmm0
	mulss	(%ecx), %xmm0
	movss	%xmm0, (%eax)
	movss	4(%eax), %xmm0
	mulss	(%ecx), %xmm0
	movss	%xmm0, 4(%eax)
	movss	8(%eax), %xmm0
	mulss	(%ecx), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L2
.L168:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L167:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movl	(%edi,%esi,4), %ebx
	leal	0(,%eax,4), %esi
	movl	(%edi,%edx,4), %ecx
	movl	%esi, 8(%esp)
	movzbl	3(%ebp), %edx
	leal	0(,%edx,4), %esi
	movl	(%ecx,%edx,4), %edx
	cmpl	%edx, (%ebx,%eax,4)
	je	.L362
.L270:
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L166:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L165:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movl	(%edi,%esi,4), %ebx
	leal	0(,%eax,4), %esi
	movl	(%edi,%edx,4), %ecx
	movl	%esi, 8(%esp)
	movzbl	3(%ebp), %edx
	leal	0(,%edx,4), %esi
	movl	(%ecx,%edx,4), %edx
	cmpl	%edx, (%ebx,%eax,4)
	je	.L363
.L269:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L164:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movss	64(%edi), %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	movss	%xmm0, (%eax)
	movss	68(%edi), %xmm0
	movss	%xmm0, 4(%eax)
	movss	72(%edi), %xmm0
	movss	%xmm0, 8(%eax)
	jmp	.L2
.L163:
	movl	8(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	movss	(%eax), %xmm0
	movss	%xmm0, 64(%edi)
	movss	4(%eax), %xmm0
	movss	%xmm0, 68(%edi)
	movss	8(%eax), %xmm0
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L162:
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
	jmp	.L2
.L161:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %edx
	movss	(%edx,%ecx,4), %xmm0
	movss	%xmm0, 64(%edi)
	movss	%xmm0, 68(%edi)
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L160:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	movss	(%edi,%eax,4), %xmm0
	movss	%xmm0, 64(%edi)
	movss	%xmm0, 68(%edi)
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L159:
	pxor	%xmm0, %xmm0
	cvtsi2ss	8(%esp), %xmm0
	movl	%ebx, %ebp
	movss	%xmm0, 64(%edi)
	movss	%xmm0, 68(%edi)
	movss	%xmm0, 72(%edi)
	jmp	.L2
.L158:
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
	jmp	.L2
.L157:
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
	jmp	.L2
.L156:
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
	jmp	.L2
.L155:
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
	jmp	.L2
.L154:
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
	jmp	.L2
.L153:
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
	jmp	.L2
.L152:
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
	jmp	.L2
.L151:
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
	jmp	.L2
.L150:
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
	jmp	.L2
.L149:
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
	jmp	.L2
.L148:
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
	jmp	.L2
.L147:
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
	jmp	.L2
.L146:
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
	jmp	.L2
.L145:
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
	jmp	.L2
.L144:
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
	jmp	.L2
.L143:
	movzbl	4(%esp), %ecx
.L202:
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
	jp	.L364
.L267:
	movss	%xmm0, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L2
.L142:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	4(%esp), %ecx
	movl	(%edi,%esi,4), %edx
	sqrtss	(%edx,%eax,4), %xmm0
	ucomiss	%xmm0, %xmm0
	jp	.L365
.L265:
	movss	%xmm0, (%edi,%ecx,4)
	movl	80(%edi), %ebx
	jmp	.L202
.L141:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movl	8(%esp), %eax
	sqrtss	(%edi,%eax,4), %xmm0
	ucomiss	%xmm0, %xmm0
	jp	.L366
.L263:
	movss	%xmm0, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L2
.L140:
	movl	8(%esp), %eax
	sqrtss	(%edi,%eax,4), %xmm0
	ucomiss	%xmm0, %xmm0
	jp	.L367
.L261:
	movzbl	4(%esp), %eax
	movss	%xmm0, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L2
.L139:
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
	movss	(%ebx,%eax,4), %xmm0
	ucomiss	(%edx,%ecx,4), %xmm0
	jbe	.L346
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L138:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movss	(%edx,%ecx,4), %xmm0
	ucomiss	(%edi,%eax,4), %xmm0
	jbe	.L345
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L137:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movss	(%edi,%esi,4), %xmm0
	movl	(%edi,%eax,4), %eax
	ucomiss	(%eax,%edx,4), %xmm0
	jbe	.L344
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L133:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movss	(%edi,%esi,4), %xmm0
	movl	(%edi,%eax,4), %eax
	ucomiss	(%eax,%edx,4), %xmm0
	jb	.L340
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L135:
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
	movss	(%ebx,%eax,4), %xmm0
	ucomiss	(%edx,%ecx,4), %xmm0
	jb	.L342
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L131:
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
	movss	(%ebx,%eax,4), %xmm0
	subss	(%edx,%ecx,4), %xmm0
	ucomiss	.LC1, %xmm0
	jb	.L242
	movss	.LC2, %xmm1
	ucomiss	%xmm0, %xmm1
	jb	.L242
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L136:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movss	(%edi,%esi,4), %xmm0
	ucomiss	(%edi,%eax,4), %xmm0
	jbe	.L343
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L132:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movss	(%edi,%esi,4), %xmm0
	ucomiss	(%edi,%eax,4), %xmm0
	jb	.L339
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L134:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movss	(%edx,%ecx,4), %xmm0
	ucomiss	(%edi,%eax,4), %xmm0
	jb	.L341
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L130:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movss	(%edx,%ecx,4), %xmm0
	subss	(%edi,%eax,4), %xmm0
	ucomiss	.LC1, %xmm0
	jb	.L239
	movss	.LC2, %xmm1
	ucomiss	%xmm0, %xmm1
	jb	.L239
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L129:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movss	(%edi,%esi,4), %xmm0
	movl	(%edi,%eax,4), %eax
	subss	(%eax,%edx,4), %xmm0
	ucomiss	.LC1, %xmm0
	jb	.L236
	movss	.LC2, %xmm1
	ucomiss	%xmm0, %xmm1
	jb	.L236
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L121:
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
	jmp	.L2
.L125:
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
	jmp	.L2
.L124:
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
	jmp	.L2
.L123:
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
	jmp	.L2
.L122:
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
	jmp	.L2
.L127:
	movzbl	4(%esp), %edx
.L203:
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
	jmp	.L2
.L126:
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
	jmp	.L203
.L128:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movss	(%edi,%esi,4), %xmm0
	subss	(%edi,%eax,4), %xmm0
	ucomiss	.LC1, %xmm0
	jb	.L233
	movss	.LC2, %xmm1
	ucomiss	%xmm0, %xmm1
	jb	.L233
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L117:
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
	jmp	.L2
.L119:
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
	jmp	.L2
.L118:
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
	jmp	.L2
.L120:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	movss	(%eax), %xmm0
	divss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%eax)
	jmp	.L2
.L115:
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
	jmp	.L2
.L114:
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
	jmp	.L2
.L116:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	movss	(%eax), %xmm0
	mulss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%eax)
	jmp	.L2
.L113:
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
	jmp	.L2
.L112:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	movss	(%eax), %xmm0
	subss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%eax)
	jmp	.L2
.L111:
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
	jmp	.L2
.L110:
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
	jmp	.L2
.L109:
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
	jmp	.L2
.L108:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	movss	(%eax), %xmm0
	addss	(%edi,%esi,4), %xmm0
	movss	%xmm0, (%eax)
	jmp	.L2
.L107:
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
	jmp	.L2
.L106:
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
	jmp	.L2
.L105:
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
	jmp	.L2
.L104:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movss	(%edi,%esi,4), %xmm0
	xorps	.LC0, %xmm0
	movss	%xmm0, (%edi,%eax,4)
	jmp	.L2
.L103:
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
	jmp	.L2
.L102:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	shrl	%cl, (%edi,%edx,4)
	jmp	.L2
.L101:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ecx
	shrl	%cl, (%edx,%ebx,4)
	jmp	.L2
.L100:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %ecx
	shrl	%cl, (%edi,%eax,4)
	jmp	.L2
.L99:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %ecx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	addl	$1, %ecx
	shrl	%cl, (%edx,%ebx,4)
	jmp	.L2
.L98:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %ecx
	addl	$1, %ecx
	shrl	%cl, (%edi,%eax,4)
	jmp	.L2
.L97:
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
	jmp	.L2
.L96:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	sall	%cl, (%edi,%edx,4)
	jmp	.L2
.L95:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ecx
	sall	%cl, (%edx,%ebx,4)
	jmp	.L2
.L94:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %ecx
	sall	%cl, (%edi,%eax,4)
	jmp	.L2
.L93:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %ecx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	addl	$1, %ecx
	sall	%cl, (%edx,%ebx,4)
	jmp	.L2
.L92:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %ecx
	addl	$1, %ecx
	sall	%cl, (%edi,%eax,4)
	jmp	.L2
.L91:
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
	jmp	.L2
.L90:
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
	jmp	.L2
.L89:
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
	jmp	.L2
.L88:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	movzbl	4(%esp), %edx
	movl	(%edi,%eax,4), %eax
	notl	%eax
	movl	%eax, (%edi,%edx,4)
	jmp	.L2
.L87:
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
	jmp	.L2
.L86:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	xorl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L85:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	xorl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L84:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	xorl	%edx, (%edi,%eax,4)
	jmp	.L2
.L83:
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
	jmp	.L2
.L82:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	orl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L81:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	orl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L80:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	orl	%edx, (%edi,%eax,4)
	jmp	.L2
.L79:
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
	jmp	.L2
.L78:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	andl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L77:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	andl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L76:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	andl	%edx, (%edi,%eax,4)
	jmp	.L2
.L75:
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
	je	.L232
	movzbl	4(%esp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%ecx,4), %ecx
	andl	%ebx, (%ecx,%eax,4)
	jmp	.L2
.L74:
	movl	8(%esp), %eax
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L232
	movzbl	4(%esp), %eax
	movl	%ecx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%edx, (%esi)
	jmp	.L2
.L73:
	movl	8(%esp), %esi
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%esi,4), %ebx
	testl	%ebx, %ebx
	je	.L232
	movzbl	4(%esp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%edx, (%esi)
	jmp	.L2
.L72:
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %ecx
	testl	%ecx, %ecx
	je	.L232
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ecx
	movl	%edx, (%esi)
	jmp	.L2
.L71:
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
	jmp	.L2
.L70:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %ecx
	movl	(%ecx), %eax
	addl	$2, %esi
	cltd
	idivl	%esi
	movl	%edx, (%ecx)
	jmp	.L2
.L69:
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
	je	.L232
	movzbl	4(%esp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%eax, (%esi)
	jmp	.L2
.L68:
	movl	8(%esp), %eax
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L232
	movzbl	4(%esp), %eax
	movl	%ecx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%eax, (%esi)
	jmp	.L2
.L67:
	movl	8(%esp), %esi
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%esi,4), %ebx
	testl	%ebx, %ebx
	je	.L232
	movzbl	4(%esp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%eax, (%esi)
	jmp	.L2
.L66:
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %ecx
	testl	%ecx, %ecx
	je	.L232
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ecx
	movl	%eax, (%esi)
	jmp	.L2
.L65:
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
	jmp	.L2
.L64:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %ecx
	movl	(%ecx), %eax
	addl	$2, %esi
	cltd
	idivl	%esi
	movl	%eax, (%ecx)
	jmp	.L2
.L63:
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
	jmp	.L2
.L62:
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
	jmp	.L2
.L61:
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
	jmp	.L2
.L60:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %edx
	movl	(%edx), %eax
	imull	(%edi,%esi,4), %eax
	movl	%eax, (%edx)
	jmp	.L2
.L59:
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
	jmp	.L2
.L58:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	leal	(%edi,%eax,4), %eax
	addl	$2, %esi
	imull	(%eax), %esi
	movl	%esi, (%eax)
	jmp	.L2
.L57:
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
	jmp	.L2
.L56:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	subl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L55:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	subl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L54:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	subl	%edx, (%edi,%eax,4)
	jmp	.L2
.L53:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	addl	$1, %esi
	subl	%esi, (%edx,%ecx,4)
	jmp	.L2
.L52:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	addl	$1, %esi
	subl	%esi, (%edi,%eax,4)
	jmp	.L2
.L51:
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
	jmp	.L2
.L50:
	movl	8(%esp), %esi
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %edx
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	addl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L49:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	(%edi,%esi,4), %ebx
	addl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L48:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	movl	(%edi,%esi,4), %edx
	addl	%edx, (%edi,%eax,4)
	jmp	.L2
.L47:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %esi
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	addl	$1, %esi
	addl	%esi, (%edx,%ecx,4)
	jmp	.L2
.L46:
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	movl	8(%esp), %esi
	addl	$1, %esi
	addl	%esi, (%edi,%eax,4)
	jmp	.L2
.L45:
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
	jmp	.L2
.L44:
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
	jmp	.L2
.L43:
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
	jmp	.L2
.L42:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	movzbl	4(%esp), %edx
	movl	(%edi,%eax,4), %eax
	negl	%eax
	movl	%eax, (%edi,%edx,4)
	jmp	.L2
.L41:
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
	jle	.L231
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L40:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jle	.L230
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L33:
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
	je	.L368
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L37:
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
	jl	.L227
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L25:
	movzbl	4(%esp), %eax
	leal	(%edi,%eax,4), %edx
	subl	$1, (%edx)
	je	.L215
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L39:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jle	.L229
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L29:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %edx
	testl	%edx, %edx
	je	.L219
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L35:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jl	.L225
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L21:
	movzbl	4(%esp), %ecx
	movl	8(%esp), %esi
	addl	$1, %ecx
	movl	%esi, %eax
	subl	%eax, %ecx
	movl	92(%edi), %eax
	movzbl	%cl, %edx
	leal	(%eax,%edx,4), %edx
	cmpl	%edx, 108(%edi)
	jbe	.L211
	leal	(%edi,%esi,4), %edx
	leal	-1(%ecx), %esi
	testb	%cl, %cl
	je	.L292
	movl	%esi, %ecx
	addl	$4, %eax
	movzbl	%cl, %esi
	leal	4(%edx,%esi,4), %ebp
	.p2align 4,,10
	.p2align 3
.L212:
	movl	(%edx), %ecx
	addl	$4, %edx
	movl	%eax, %esi
	addl	$4, %eax
	movl	%ecx, -8(%eax)
	cmpl	%ebp, %edx
	jne	.L212
	movl	%esi, 92(%edi)
	movl	%ebx, %ebp
	jmp	.L2
.L38:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jle	.L228
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L31:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	je	.L369
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L36:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jl	.L226
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L23:
	movl	92(%edi), %ecx
	leal	4(%ecx,%esi,4), %eax
	cmpl	108(%edi), %eax
	jnb	.L211
	movzbl	4(%esp), %edx
	movl	%ebx, %ebp
	movl	%ecx, (%edi,%edx,4)
	movl	%eax, 92(%edi)
	jmp	.L2
.L34:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jl	.L224
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L27:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %ebx
	testl	%ebx, %ebx
	jne	.L217
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L19:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%esi, %eax
	sall	$8, %eax
	orl	%edx, %eax
	cmpw	124(%edi), %ax
	jnb	.L370
	movl	116(%edi), %edx
	movzwl	%ax, %eax
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	je	.L209
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	*%eax
	movl	80(%edi), %ebp
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L2
.L32:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	je	.L371
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L30:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L220
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L24:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	104(%edi), %eax
	jb	.L372
	cmpl	108(%edi), %eax
	jnb	.L211
	movl	%eax, 92(%edi)
	movl	%ebx, %ebp
	jmp	.L2
.L28:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ecx
	testl	%ecx, %ecx
	jne	.L218
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L26:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	movzbl	4(%esp), %edx
	movl	%eax, (%edi,%edx,4)
	testl	%eax, %eax
	je	.L216
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L20:
	movl	88(%edi), %eax
	cmpl	96(%edi), %eax
	jbe	.L210
	leal	-4(%eax), %edx
	movl	%edx, 88(%edi)
	movl	-4(%eax), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L22:
	movl	92(%edi), %eax
	subl	$72, %eax
	cmpl	%eax, 104(%edi)
	jnb	.L211
	movl	%ebx, %ebp
	jmp	.L2
.L201:
	movss	64(%edi), %xmm0
	movss	68(%edi), %xmm2
	movaps	%xmm0, %xmm4
	movss	72(%edi), %xmm3
	mulss	%xmm0, %xmm4
	movaps	%xmm2, %xmm1
	mulss	%xmm2, %xmm1
	addss	%xmm1, %xmm4
	movaps	%xmm3, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm4, %xmm1
	sqrtss	%xmm1, %xmm4
	ucomiss	%xmm4, %xmm4
	jp	.L373
.L290:
	movss	.LC3, %xmm1
	movl	80(%edi), %eax
	divss	%xmm4, %xmm1
	leal	-1(%eax), %ebp
	movl	%ebp, 80(%edi)
	mulss	%xmm1, %xmm0
	mulss	%xmm1, %xmm2
	mulss	%xmm3, %xmm1
	movss	%xmm0, 64(%edi)
	movss	%xmm2, 68(%edi)
	movss	%xmm1, 72(%edi)
	jmp	.L2
.L233:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L239:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L236:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L242:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L345:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L340:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L339:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L224:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L218:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L225:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L216:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L229:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L226:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L227:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L220:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L219:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L230:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L228:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L344:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L343:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L342:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L341:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L346:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L231:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L217:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L215:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L362:
	movl	8(%esp), %eax
	movl	4(%ecx,%esi), %edx
	cmpl	%edx, 4(%ebx,%eax)
	jne	.L270
	movl	8(%ecx,%esi), %esi
	cmpl	%esi, 8(%ebx,%eax)
	jne	.L270
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L371:
	leal	4(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	3(%ebp), %eax
	movzbl	4(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L363:
	movl	8(%esp), %eax
	movl	4(%ecx,%esi), %edx
	cmpl	%edx, 4(%ebx,%eax)
	jne	.L269
	movl	8(%ecx,%esi), %esi
	cmpl	%esi, 8(%ebx,%eax)
	jne	.L269
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L368:
	leal	5(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	4(%ebp), %eax
	movzbl	5(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L369:
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movzbl	3(%ebp), %ebp
	sall	$8, %eax
	orl	%eax, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L232:
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
.L292:
	.cfi_restore_state
	movl	%ebx, %ebp
	jmp	.L2
.L211:
	movl	$6, 84(%edi)
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
.L206:
	.cfi_restore_state
	movl	$11, 84(%edi)
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
.L205:
	.cfi_restore_state
	movl	$8, 84(%edi)
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
.L353:
	.cfi_restore_state
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm1, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movss	64(%edi), %xmm0
	fstps	4(%esp)
	movss	4(%esp), %xmm2
	jmp	.L288
.L354:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movss	(%ebx), %xmm2
	fstps	4(%esp)
	movss	4(%esp), %xmm1
	jmp	.L286
.L359:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	8(%esp)
	movss	8(%esp), %xmm1
	jmp	.L276
.L360:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	movss	4(%esp), %xmm1
	jmp	.L274
.L361:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	8(%esp)
	movss	8(%esp), %xmm1
	jmp	.L272
.L364:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	movss	4(%esp), %xmm0
	jmp	.L267
.L370:
	movl	$13, 84(%edi)
	jmp	.L1
.L209:
	movl	$10, 84(%edi)
	jmp	.L1
.L372:
	movl	$7, 84(%edi)
	jmp	.L1
.L210:
	movl	$2, 84(%edi)
	jmp	.L1
.L365:
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
	jmp	.L265
.L366:
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
	jmp	.L263
.L367:
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
	jmp	.L261
.L373:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm1, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movss	64(%edi), %xmm0
	fstps	4(%esp)
	movss	68(%edi), %xmm2
	movss	4(%esp), %xmm4
	movss	72(%edi), %xmm3
	jmp	.L290
.L355:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movss	(%ebx), %xmm2
	fstps	4(%esp)
	movss	4(%esp), %xmm1
	jmp	.L284
.L356:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movss	(%ebx), %xmm2
	fstps	4(%esp)
	movss	4(%ebx), %xmm1
	movss	4(%esp), %xmm4
	movss	8(%ebx), %xmm3
	jmp	.L282
.L357:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	movss	4(%esp), %xmm1
	jmp	.L280
.L358:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	movss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	movss	4(%esp), %xmm1
	jmp	.L278
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
