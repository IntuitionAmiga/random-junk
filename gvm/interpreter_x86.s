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
	cmpb	$-57, %al
	movl	%ecx, 8(%esp)
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
	.long	.L202
	.long	.L203
	.long	.L204
	.text
.L203:
	leal	3(%ebp), %eax
	vmovss	68(%edi), %xmm1
	vmulss	%xmm1, %xmm1, %xmm1
	vmovss	64(%edi), %xmm0
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	vmovss	72(%edi), %xmm2
	movzbl	2(%ebp), %edx
	vfmadd231ss	%xmm0, %xmm0, %xmm1
	vfmadd132ss	%xmm2, %xmm1, %xmm2
	vsqrtss	%xmm2, %xmm3, %xmm3
	vucomiss	%xmm3, %xmm3
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	jp	.L362
.L296:
	vmovss	.LC3, %xmm1
	movl	80(%edi), %ebp
	vdivss	%xmm3, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, (%ebx)
	vmulss	68(%edi), %xmm1, %xmm0
	vmovss	%xmm0, 4(%ebx)
	vmulss	72(%edi), %xmm1, %xmm1
	vmovss	%xmm1, 8(%ebx)
	jmp	.L2
.L202:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	vmovss	4(%ebx), %xmm0
	vmulss	%xmm0, %xmm0, %xmm0
	vmovss	(%ebx), %xmm1
	vmovss	8(%ebx), %xmm2
	vfmadd231ss	%xmm1, %xmm1, %xmm0
	vfmadd132ss	%xmm2, %xmm0, %xmm2
	vsqrtss	%xmm2, %xmm3, %xmm3
	vucomiss	%xmm3, %xmm3
	jp	.L363
.L294:
	vmovss	.LC3, %xmm0
	movl	80(%edi), %ebp
	vdivss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, 64(%edi)
	vmulss	4(%ebx), %xmm0, %xmm1
	vmovss	%xmm1, 68(%edi)
	vmulss	8(%ebx), %xmm0, %xmm0
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L201:
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
	vmovss	4(%ebx), %xmm0
	vmulss	%xmm0, %xmm0, %xmm0
	vmovss	(%ebx), %xmm1
	vmovss	8(%ebx), %xmm2
	movl	(%edi,%eax,4), %eax
	vfmadd231ss	%xmm1, %xmm1, %xmm0
	vfmadd132ss	%xmm2, %xmm0, %xmm2
	vsqrtss	%xmm2, %xmm3, %xmm3
	vucomiss	%xmm3, %xmm3
	leal	(%eax,%edx,4), %esi
	jp	.L364
.L292:
	vmovss	.LC3, %xmm0
	movl	80(%edi), %ebp
	vdivss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, (%esi)
	vmulss	4(%ebx), %xmm0, %xmm1
	vmovss	%xmm1, 4(%esi)
	vmulss	8(%ebx), %xmm0, %xmm0
	vmovss	%xmm0, 8(%esi)
	jmp	.L2
.L200:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	vmovss	4(%ebx), %xmm1
	vmulss	%xmm1, %xmm1, %xmm3
	vmovss	(%ebx), %xmm2
	vmovss	8(%ebx), %xmm0
	vfmadd231ss	%xmm2, %xmm2, %xmm3
	vfmadd231ss	%xmm0, %xmm0, %xmm3
	vsqrtss	%xmm3, %xmm4, %xmm4
	vucomiss	%xmm4, %xmm4
	jp	.L365
.L290:
	vmovss	.LC3, %xmm3
	movl	80(%edi), %ebp
	vdivss	%xmm4, %xmm3, %xmm3
	vmulss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm3, %xmm1, %xmm1
	vmulss	%xmm3, %xmm0, %xmm0
	vmovss	%xmm2, (%ebx)
	vmovss	%xmm1, 4(%ebx)
	vmovss	%xmm0, 8(%ebx)
	jmp	.L2
.L199:
	vmovss	68(%edi), %xmm2
	vmulss	%xmm2, %xmm2, %xmm2
	vmovss	64(%edi), %xmm1
	vmovss	72(%edi), %xmm0
	vfmadd132ss	%xmm1, %xmm2, %xmm1
	vfmadd132ss	%xmm0, %xmm1, %xmm0
	vsqrtss	%xmm0, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm1
	jp	.L366
.L288:
	movl	80(%edi), %eax
	vmovss	%xmm1, 76(%edi)
	leal	-1(%eax), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L198:
	leal	3(%ebp), %eax
	vmovss	68(%edi), %xmm2
	vmulss	%xmm2, %xmm2, %xmm2
	vmovss	64(%edi), %xmm1
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	vmovss	72(%edi), %xmm0
	movzbl	2(%ebp), %edx
	vfmadd132ss	%xmm1, %xmm2, %xmm1
	vfmadd132ss	%xmm0, %xmm1, %xmm0
	vsqrtss	%xmm0, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm1
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	jp	.L367
.L286:
	vmovss	%xmm1, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L2
.L197:
	vmovss	68(%edi), %xmm2
	vmulss	%xmm2, %xmm2, %xmm2
	vmovss	64(%edi), %xmm1
	vmovss	72(%edi), %xmm0
	vfmadd132ss	%xmm1, %xmm2, %xmm1
	vfmadd132ss	%xmm0, %xmm1, %xmm0
	vsqrtss	%xmm0, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm1
	jp	.L368
.L284:
	movzbl	4(%esp), %eax
	vmovss	%xmm1, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L2
.L196:
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
	jp	.L369
.L282:
	vmovss	%xmm1, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L2
.L195:
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
	jp	.L370
.L280:
	movzbl	4(%esp), %eax
	vmovss	%xmm1, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L2
.L194:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	vmovss	68(%edi), %xmm0
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %ecx
	movzbl	3(%ebp), %ebx
	vmovss	64(%edi), %xmm5
	vmovss	72(%edi), %xmm6
	movl	%edx, %ebp
	leal	(%ecx,%eax,4), %eax
	movzbl	4(%esp), %ecx
	vmulss	4(%eax), %xmm0, %xmm0
	movl	(%edi,%ecx,4), %ecx
	vfmadd231ss	(%eax), %xmm5, %xmm0
	vfmadd231ss	8(%eax), %xmm6, %xmm0
	vmovss	%xmm0, (%ecx,%ebx,4)
	jmp	.L2
.L193:
	leal	3(%ebp), %edx
	movl	8(%esp), %eax
	vmovss	68(%edi), %xmm0
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	vmovss	64(%edi), %xmm7
	vmovss	72(%edi), %xmm4
	leal	(%eax,%ecx,4), %eax
	movzbl	4(%esp), %ecx
	vmulss	4(%eax), %xmm0, %xmm0
	vfmadd231ss	(%eax), %xmm7, %xmm0
	vfmadd231ss	8(%eax), %xmm4, %xmm0
	vmovss	%xmm0, (%edi,%ecx,4)
	jmp	.L2
.L192:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %eax
	movzbl	4(%esp), %edx
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ebx,4), %edx
	vmovss	4(%edx), %xmm0
	vmulss	4(%eax), %xmm0, %xmm0
	vmovss	(%edx), %xmm5
	vmovss	8(%edx), %xmm6
	vfmadd231ss	(%eax), %xmm5, %xmm0
	vfmadd231ss	8(%eax), %xmm6, %xmm0
	vmovss	%xmm0, 76(%edi)
	jmp	.L2
.L191:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %eax
	movzbl	4(%esp), %edx
	vmovss	8(%eax), %xmm0
	vmulss	68(%edi), %xmm0, %xmm0
	vmovss	4(%eax), %xmm5
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ebx,4), %edx
	vfmsub231ss	72(%edi), %xmm5, %xmm0
	vmovss	%xmm0, (%edx)
	vmovss	(%eax), %xmm0
	vmulss	72(%edi), %xmm0, %xmm0
	vmovss	8(%eax), %xmm6
	vfmsub231ss	64(%edi), %xmm6, %xmm0
	vmovss	%xmm0, 4(%edx)
	vmovss	4(%eax), %xmm0
	vmulss	64(%edi), %xmm0, %xmm0
	vmovss	(%eax), %xmm7
	vfmsub231ss	68(%edi), %xmm7, %xmm0
	vmovss	%xmm0, 8(%edx)
	jmp	.L2
.L190:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	vmovss	72(%edi), %xmm0
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	vmovss	68(%edi), %xmm5
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %eax
	movzbl	4(%esp), %edx
	vmulss	4(%eax), %xmm0, %xmm0
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ebx,4), %edx
	vfmsub231ss	8(%eax), %xmm5, %xmm0
	vmovss	%xmm0, (%edx)
	vmovss	64(%edi), %xmm0
	vmulss	8(%eax), %xmm0, %xmm0
	vmovss	72(%edi), %xmm6
	vfmsub231ss	(%eax), %xmm6, %xmm0
	vmovss	%xmm0, 4(%edx)
	vmovss	68(%edi), %xmm0
	vmulss	(%eax), %xmm0, %xmm0
	vmovss	64(%edi), %xmm7
	vfmsub231ss	4(%eax), %xmm7, %xmm0
	vmovss	%xmm0, 8(%edx)
	jmp	.L2
.L189:
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
	vmovss	8(%edx), %xmm0
	vmovss	4(%edx), %xmm5
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	vmulss	4(%eax), %xmm0, %xmm0
	vfmsub231ss	8(%eax), %xmm5, %xmm0
	vmovss	%xmm0, 64(%edi)
	vmovss	(%edx), %xmm0
	vmulss	8(%eax), %xmm0, %xmm0
	vmovss	8(%edx), %xmm6
	vfmsub231ss	(%eax), %xmm6, %xmm0
	vmovss	%xmm0, 68(%edi)
	vmovss	4(%edx), %xmm0
	vmulss	(%eax), %xmm0, %xmm0
	vmovss	(%edx), %xmm7
	vfmsub231ss	4(%eax), %xmm7, %xmm0
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L188:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	vmovss	64(%edi), %xmm0
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %edx
	movzbl	4(%esp), %eax
	vsubss	(%edx), %xmm0, %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	vmovss	%xmm0, (%eax)
	vmovss	68(%edi), %xmm0
	vsubss	4(%edx), %xmm0, %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	72(%edi), %xmm0
	vsubss	8(%edx), %xmm0, %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L2
.L187:
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
	vsubss	64(%edi), %xmm0, %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	vmovss	%xmm0, (%eax)
	vmovss	4(%edx), %xmm0
	vsubss	68(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	8(%edx), %xmm0
	vsubss	72(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L2
.L186:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %eax
	movzbl	4(%esp), %edx
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ebx,4), %edx
	vmovss	(%edx), %xmm0
	vsubss	(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 64(%edi)
	vmovss	4(%edx), %xmm0
	vsubss	4(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 68(%edi)
	vmovss	8(%edx), %xmm0
	vsubss	8(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L185:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	vmovss	(%eax), %xmm0
	vsubss	64(%edi), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	4(%eax), %xmm0
	vsubss	68(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	8(%eax), %xmm0
	vsubss	72(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L2
.L184:
	leal	3(%ebp), %edx
	movl	8(%esp), %eax
	vmovss	64(%edi), %xmm0
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	vsubss	(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 64(%edi)
	vmovss	68(%edi), %xmm0
	vsubss	4(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 68(%edi)
	vmovss	72(%edi), %xmm0
	vsubss	8(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L183:
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
	jmp	.L2
.L182:
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
	vaddss	64(%edi), %xmm0, %xmm0
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ebx,4), %eax
	vmovss	%xmm0, (%eax)
	vmovss	4(%edx), %xmm0
	vaddss	68(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	8(%edx), %xmm0
	vaddss	72(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L2
.L181:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %edx
	movzbl	3(%ebp), %ebx
	movl	%ecx, %ebp
	leal	(%edx,%eax,4), %eax
	movzbl	4(%esp), %edx
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%ebx,4), %edx
	vmovss	(%edx), %xmm0
	vaddss	(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 64(%edi)
	vmovss	4(%edx), %xmm0
	vaddss	4(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 68(%edi)
	vmovss	8(%edx), %xmm0
	vaddss	8(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L180:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	vmovss	(%eax), %xmm0
	vaddss	64(%edi), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	4(%eax), %xmm0
	vaddss	68(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	8(%eax), %xmm0
	vaddss	72(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L2
.L179:
	leal	3(%ebp), %edx
	movl	8(%esp), %eax
	vmovss	64(%edi), %xmm0
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	vaddss	(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 64(%edi)
	vmovss	68(%edi), %xmm0
	vaddss	4(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 68(%edi)
	vmovss	72(%edi), %xmm0
	vaddss	8(%eax), %xmm0, %xmm0
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L178:
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
	jmp	.L2
.L177:
	vmovss	76(%edi), %xmm0
	movl	12(%esp), %eax
	vmulss	64(%edi), %xmm0, %xmm1
	movl	%eax, 80(%edi)
	movl	%eax, %ebp
	vmovss	%xmm1, 64(%edi)
	vmulss	68(%edi), %xmm0, %xmm1
	vmulss	72(%edi), %xmm0, %xmm0
	vmovss	%xmm1, 68(%edi)
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L176:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %edx
	vmovss	(%edx,%ecx,4), %xmm0
	vmulss	64(%edi), %xmm0, %xmm1
	vmovss	%xmm1, 64(%edi)
	vmulss	68(%edi), %xmm0, %xmm1
	vmulss	72(%edi), %xmm0, %xmm0
	vmovss	%xmm1, 68(%edi)
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L175:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	vmovss	(%edi,%eax,4), %xmm0
	vmulss	64(%edi), %xmm0, %xmm1
	vmovss	%xmm1, 64(%edi)
	vmulss	68(%edi), %xmm0, %xmm1
	vmulss	72(%edi), %xmm0, %xmm0
	vmovss	%xmm1, 68(%edi)
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L174:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	vmovss	(%eax), %xmm0
	vmulss	76(%edi), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	4(%eax), %xmm0
	vmulss	76(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	8(%eax), %xmm0
	vmulss	76(%edi), %xmm0, %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L2
.L173:
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
	vmulss	(%eax), %xmm0, %xmm1
	vmovss	%xmm1, (%eax)
	vmulss	4(%eax), %xmm0, %xmm1
	vmulss	8(%eax), %xmm0, %xmm0
	vmovss	%xmm1, 4(%eax)
	vmovss	%xmm0, 8(%eax)
	jmp	.L2
.L172:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %ecx
	movl	8(%esp), %esi
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %eax
	leal	(%edi,%esi,4), %edx
	vmovss	(%eax), %xmm0
	vmulss	(%edx), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	vmovss	4(%eax), %xmm0
	vmulss	(%edx), %xmm0, %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	8(%eax), %xmm0
	vmulss	(%edx), %xmm0, %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L2
.L171:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L170:
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movl	(%edi,%esi,4), %ebx
	leal	0(,%eax,4), %esi
	movl	(%edi,%edx,4), %ecx
	movzbl	3(%ebp), %edx
	movl	%esi, 8(%esp)
	leal	0(,%edx,4), %esi
	movl	(%ecx,%edx,4), %edx
	cmpl	%edx, (%ebx,%eax,4)
	je	.L371
.L278:
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
.L169:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L168:
	leal	3(%ebp), %eax
	leal	4(%ebp), %edx
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%edx, 80(%edi)
	movzbl	4(%esp), %edx
	movl	(%edi,%esi,4), %ebx
	leal	0(,%eax,4), %esi
	movl	(%edi,%edx,4), %ecx
	movzbl	3(%ebp), %edx
	movl	%esi, 8(%esp)
	leal	0(,%edx,4), %esi
	movl	(%ecx,%edx,4), %edx
	cmpl	%edx, (%ebx,%eax,4)
	je	.L372
.L277:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L167:
	movzbl	4(%esp), %eax
	leal	3(%ebp), %edx
	vmovss	64(%edi), %xmm0
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	vmovss	%xmm0, (%eax)
	vmovss	68(%edi), %xmm0
	vmovss	%xmm0, 4(%eax)
	vmovss	72(%edi), %xmm0
	vmovss	%xmm0, 8(%eax)
	jmp	.L2
.L166:
	leal	3(%ebp), %edx
	movl	8(%esp), %eax
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%ecx,4), %eax
	vmovss	(%eax), %xmm0
	vmovss	%xmm0, 64(%edi)
	vmovss	4(%eax), %xmm0
	vmovss	%xmm0, 68(%edi)
	vmovss	8(%eax), %xmm0
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L165:
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
	jmp	.L2
.L164:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %edx
	vmovss	(%edx,%ecx,4), %xmm0
	vmovss	%xmm0, 64(%edi)
	vmovss	%xmm0, 68(%edi)
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L163:
	movl	8(%esp), %eax
	movl	%ebx, %ebp
	vmovss	(%edi,%eax,4), %xmm0
	vmovss	%xmm0, 64(%edi)
	vmovss	%xmm0, 68(%edi)
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L162:
	vxorps	%xmm0, %xmm0, %xmm0
	movl	%ebx, %ebp
	vcvtsi2ss	8(%esp), %xmm0, %xmm0
	vmovss	%xmm0, 64(%edi)
	vmovss	%xmm0, 68(%edi)
	vmovss	%xmm0, 72(%edi)
	jmp	.L2
.L161:
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
	jmp	.L2
.L160:
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
	jmp	.L2
.L159:
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
	jmp	.L2
.L158:
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
	jmp	.L2
.L157:
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
	jmp	.L2
.L156:
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
	jmp	.L2
.L155:
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
	jmp	.L2
.L154:
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
	jmp	.L2
.L153:
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
	jmp	.L2
.L152:
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
	jmp	.L2
.L151:
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
	jmp	.L2
.L150:
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
	jmp	.L2
.L149:
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
	jmp	.L2
.L148:
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
	jmp	.L2
.L147:
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
	jmp	.L2
.L146:
	movzbl	4(%esp), %ecx
.L205:
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
	jp	.L373
.L275:
	vmovss	%xmm0, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L2
.L145:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%esi,4), %edx
	vsqrtss	(%edx,%eax,4), %xmm0, %xmm0
	vucomiss	%xmm0, %xmm0
	jp	.L374
.L273:
	vmovss	%xmm0, (%edi,%ecx,4)
	movl	80(%edi), %ebx
	jmp	.L205
.L144:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %ebx
	movl	8(%esp), %eax
	vsqrtss	(%edi,%eax,4), %xmm0, %xmm0
	vucomiss	%xmm0, %xmm0
	jp	.L375
.L271:
	vmovss	%xmm0, (%ebx)
	movl	80(%edi), %ebp
	jmp	.L2
.L143:
	movl	8(%esp), %eax
	vsqrtss	(%edi,%eax,4), %xmm0, %xmm0
	vucomiss	%xmm0, %xmm0
	jp	.L376
.L269:
	movzbl	4(%esp), %eax
	vmovss	%xmm0, (%edi,%eax,4)
	movl	80(%edi), %ebp
	jmp	.L2
.L142:
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
	jbe	.L354
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
.L141:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	vmovss	(%edx,%ecx,4), %xmm0
	vucomiss	(%edi,%eax,4), %xmm0
	jbe	.L353
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
.L140:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	vmovss	(%edi,%esi,4), %xmm0
	movl	(%edi,%eax,4), %eax
	vucomiss	(%eax,%edx,4), %xmm0
	jbe	.L352
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
.L139:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	vmovss	(%edi,%esi,4), %xmm0
	vucomiss	(%edi,%eax,4), %xmm0
	jbe	.L351
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
.L138:
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
	jb	.L350
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
.L134:
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
	jb	.L250
	vmovss	.LC2, %xmm1
	vucomiss	%xmm0, %xmm1
	jb	.L250
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
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	vmovss	(%edi,%esi,4), %xmm0
	movl	(%edi,%eax,4), %eax
	vucomiss	(%eax,%edx,4), %xmm0
	jb	.L348
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
.L132:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	vmovss	(%edi,%esi,4), %xmm0
	movl	(%edi,%eax,4), %eax
	vsubss	(%eax,%edx,4), %xmm0, %xmm0
	vucomiss	.LC1, %xmm0
	jb	.L244
	vmovss	.LC2, %xmm1
	vucomiss	%xmm0, %xmm1
	jb	.L244
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
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	vmovss	(%edx,%ecx,4), %xmm0
	vucomiss	(%edi,%eax,4), %xmm0
	jb	.L349
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
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	vmovss	(%edx,%ecx,4), %xmm0
	vsubss	(%edi,%eax,4), %xmm0, %xmm0
	vucomiss	.LC1, %xmm0
	jb	.L247
	vmovss	.LC2, %xmm1
	vucomiss	%xmm0, %xmm1
	jb	.L247
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
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	vmovss	(%edi,%esi,4), %xmm0
	vucomiss	(%edi,%eax,4), %xmm0
	jb	.L347
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
.L131:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	vmovss	(%edi,%esi,4), %xmm0
	vsubss	(%edi,%eax,4), %xmm0, %xmm0
	vucomiss	.LC1, %xmm0
	jb	.L241
	vmovss	.LC2, %xmm1
	vucomiss	%xmm0, %xmm1
	jb	.L241
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
.L130:
	movzbl	4(%esp), %edx
.L206:
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
	jmp	.L2
.L66:
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
	jmp	.L2
.L65:
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
.L64:
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
	jmp	.L2
.L63:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %edx
	movl	(%edx), %eax
	imull	(%edi,%esi,4), %eax
	movl	%eax, (%edx)
	jmp	.L2
.L62:
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
	jmp	.L2
.L61:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$2, %esi
	leal	(%edi,%eax,4), %eax
	imull	(%eax), %esi
	movl	%esi, (%eax)
	jmp	.L2
.L60:
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
	jmp	.L2
.L59:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	subl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L58:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	subl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L57:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	subl	%edx, (%edi,%eax,4)
	jmp	.L2
.L56:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	addl	$1, %esi
	movl	(%edi,%edx,4), %edx
	subl	%esi, (%edx,%ecx,4)
	jmp	.L2
.L55:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$1, %esi
	subl	%esi, (%edi,%eax,4)
	jmp	.L2
.L54:
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
	jmp	.L2
.L53:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	addl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L52:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	addl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L51:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	addl	%edx, (%edi,%eax,4)
	jmp	.L2
.L50:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	addl	$1, %esi
	movl	(%edi,%edx,4), %edx
	addl	%esi, (%edx,%ecx,4)
	jmp	.L2
.L49:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$1, %esi
	addl	%esi, (%edi,%eax,4)
	jmp	.L2
.L48:
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
	jmp	.L2
.L47:
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
	jmp	.L2
.L46:
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
.L45:
	movl	8(%esp), %eax
	movzbl	4(%esp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	negl	%eax
	movl	%eax, (%edi,%edx,4)
	jmp	.L2
.L44:
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
	jle	.L239
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
.L43:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jle	.L238
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
.L42:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jle	.L237
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
.L38:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jl	.L233
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
.L40:
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
	jl	.L235
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
.L36:
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
	je	.L377
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L41:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jle	.L236
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
.L37:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	jl	.L232
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
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %edx
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edx,%ecx,4)
	jl	.L234
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
.L35:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	je	.L378
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L34:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	(%edi,%eax,4), %eax
	cmpl	%eax, (%edi,%esi,4)
	je	.L379
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L18:
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	sall	$8, %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	orl	%edx, %eax
	movl	88(%edi), %edx
	cmpl	100(%edi), %edx
	jnb	.L215
	leal	4(%edx), %ebx
	cwtl
	movl	%ebx, 88(%edi)
	movl	%ecx, (%edx)
	addl	80(%edi), %eax
	movl	%eax, %ebp
	movl	%eax, 80(%edi)
	jmp	.L2
.L26:
	movl	92(%edi), %ecx
	leal	4(%ecx,%esi,4), %eax
	cmpl	108(%edi), %eax
	jnb	.L219
	movzbl	4(%esp), %edx
	movl	%ebx, %ebp
	movl	%ecx, (%edi,%edx,4)
	movl	%eax, 92(%edi)
	jmp	.L2
.L10:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %edx
	movl	(%edx,%ecx,4), %ecx
	movzbl	4(%esp), %edx
	movl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L9:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
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
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	movl	%esi, (%edx,%ecx,4)
	jmp	.L2
.L6:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	%esi, (%edi,%eax,4)
	jmp	.L2
.L4:
	movl	12(%esp), %eax
	movl	%eax, 80(%edi)
	movl	%eax, %ebp
	jmp	.L2
.L204:
	vmovss	68(%edi), %xmm2
	vmulss	%xmm2, %xmm2, %xmm3
	vmovss	64(%edi), %xmm0
	vmovss	72(%edi), %xmm1
	vfmadd231ss	%xmm0, %xmm0, %xmm3
	vfmadd231ss	%xmm1, %xmm1, %xmm3
	vsqrtss	%xmm3, %xmm4, %xmm4
	vucomiss	%xmm4, %xmm4
	jp	.L380
.L298:
	vmovss	.LC3, %xmm3
	movl	80(%edi), %eax
	vdivss	%xmm4, %xmm3, %xmm3
	leal	-1(%eax), %ebp
	movl	%ebp, 80(%edi)
	vmulss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm3, %xmm1, %xmm1
	vmovss	%xmm0, 64(%edi)
	vmovss	%xmm2, 68(%edi)
	vmovss	%xmm1, 72(%edi)
	jmp	.L2
.L14:
	movsbl	%dl, %edx
	leal	(%ebx,%edx), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L13:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	vmovss	76(%edi), %xmm0
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%edx,4), %edx
	vmovss	%xmm0, (%edx,%ecx,4)
	jmp	.L2
.L12:
	movzbl	4(%esp), %eax
	vmovss	76(%edi), %xmm0
	movl	%ebx, %ebp
	vmovss	%xmm0, (%edi,%eax,4)
	jmp	.L2
.L11:
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
	jmp	.L2
.L16:
	movzbl	4(%esp), %eax
	movzbl	8(%esp), %edx
	movl	(%edi,%eax,4), %eax
	addl	$2, %edx
	cmpb	%al, %dl
	jnb	.L208
	movzbl	%dl, %edx
	leal	(%ebx,%edx), %ebp
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
.L17:
	leal	3(%ebp), %edx
	movzbl	4(%esp), %ecx
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%ecx,4), %ecx
	addl	$2, %eax
	cmpw	%cx, %ax
	jnb	.L209
	movzwl	%ax, %eax
	leal	(%edx,%eax), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L30:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %ebx
	testl	%ebx, %ebx
	jne	.L225
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
.L22:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	%esi, %eax
	sall	$8, %eax
	orl	%edx, %eax
	cmpw	124(%edi), %ax
	jnb	.L381
	movl	116(%edi), %edx
	movzwl	%ax, %eax
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	je	.L217
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
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %edx
	testl	%edx, %edx
	je	.L227
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
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ecx
	testl	%ecx, %ecx
	jne	.L226
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
	movzbl	4(%esp), %ecx
	movl	8(%esp), %esi
	movl	%esi, %eax
	addl	$1, %ecx
	subl	%eax, %ecx
	movl	92(%edi), %eax
	movzbl	%cl, %edx
	leal	(%eax,%edx,4), %edx
	cmpl	%edx, 108(%edi)
	jbe	.L219
	testb	%cl, %cl
	leal	(%edi,%esi,4), %edx
	leal	-1(%ecx), %esi
	je	.L300
	movl	%esi, %ecx
	addl	$4, %eax
	movzbl	%cl, %ecx
	leal	4(%edx,%ecx,4), %ebp
	.p2align 4,,10
	.p2align 3
.L220:
	movl	(%edx), %ecx
	addl	$4, %edx
	movl	%eax, %esi
	addl	$4, %eax
	movl	%ecx, -8(%eax)
	cmpl	%ebp, %edx
	jne	.L220
	movl	%esi, 92(%edi)
	movl	%ebx, %ebp
	jmp	.L2
.L28:
	movzbl	4(%esp), %eax
	leal	(%edi,%eax,4), %edx
	subl	$1, (%edx)
	je	.L223
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
.L20:
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %eax
	testw	%ax, %ax
	je	.L212
	cmpw	%ax, 124(%edi)
	jbe	.L212
	movl	88(%edi), %edx
	cmpl	100(%edi), %edx
	jb	.L382
.L215:
	movl	$8, 84(%edi)
.L358:
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
.L33:
	.cfi_restore_state
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movzbl	4(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L228
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
.L25:
	movl	92(%edi), %eax
	subl	$80, %eax
	cmpl	%eax, 104(%edi)
	jnb	.L219
	movl	%ebx, %ebp
	jmp	.L2
.L23:
	movl	88(%edi), %eax
	cmpl	96(%edi), %eax
	jbe	.L218
	leal	-4(%eax), %edx
	movl	%edx, 88(%edi)
	movl	-4(%eax), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L29:
	leal	3(%ebp), %eax
	movl	%eax, 80(%edi)
	movl	8(%esp), %eax
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %eax
	movzbl	4(%esp), %edx
	testl	%eax, %eax
	movl	%eax, (%edi,%edx,4)
	je	.L224
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
.L27:
	movzbl	4(%esp), %eax
	movl	(%edi,%eax,4), %eax
	cmpl	104(%edi), %eax
	jb	.L383
	cmpl	108(%edi), %eax
	jnb	.L219
	movl	%eax, 92(%edi)
	movl	%ebx, %ebp
	jmp	.L2
.L21:
	leal	3(%ebp), %edx
	movl	8(%esp), %eax
	movl	%edx, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%ecx,4), %eax
	testw	%ax, %ax
	je	.L212
	cmpw	124(%edi), %ax
	jnb	.L212
	movl	88(%edi), %ecx
	cmpl	100(%edi), %ecx
	jnb	.L215
	leal	4(%ecx), %ebx
	movzwl	%ax, %eax
	movl	%ebx, 88(%edi)
	movl	%edx, (%ecx)
	movl	112(%edi), %edx
	movl	(%edx,%eax,4), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L19:
	leal	3(%ebp), %ecx
	movl	%esi, %eax
	sall	$8, %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	orw	%dx, %ax
	je	.L212
	cmpw	%ax, 124(%edi)
	jbe	.L212
	movl	88(%edi), %edx
	cmpl	100(%edi), %edx
	jnb	.L215
	leal	4(%edx), %ebx
	movzwl	%ax, %eax
	movl	%ebx, 88(%edi)
	movl	%ecx, (%edx)
	movl	112(%edi), %edx
	movl	(%edx,%eax,4), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L98:
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
	jmp	.L2
.L114:
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
	jmp	.L2
.L113:
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
	jmp	.L2
.L112:
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
	jmp	.L2
.L111:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	vmovss	(%eax), %xmm0
	vaddss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	jmp	.L2
.L110:
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
	jmp	.L2
.L109:
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
	jmp	.L2
.L108:
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
	jmp	.L2
.L107:
	movl	8(%esp), %esi
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	vmovss	(%edi,%esi,4), %xmm0
	vxorps	.LC0, %xmm0, %xmm0
	vmovss	%xmm0, (%edi,%eax,4)
	jmp	.L2
.L106:
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
	jmp	.L2
.L105:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	shrl	%cl, (%edi,%edx,4)
	jmp	.L2
.L104:
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
	jmp	.L2
.L103:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %ecx
	shrl	%cl, (%edi,%eax,4)
	jmp	.L2
.L102:
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
	jmp	.L2
.L101:
	movzbl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	addl	$1, %ecx
	shrl	%cl, (%edi,%eax,4)
	jmp	.L2
.L100:
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
	jmp	.L2
.L99:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	sall	%cl, (%edi,%edx,4)
	jmp	.L2
.L122:
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
	jmp	.L2
.L121:
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
	jmp	.L2
.L120:
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
	jmp	.L2
.L119:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	vmovss	(%eax), %xmm0
	vmulss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	jmp	.L2
.L118:
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
	jmp	.L2
.L117:
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
	jmp	.L2
.L116:
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
	jmp	.L2
.L115:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	vmovss	(%eax), %xmm0
	vsubss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	jmp	.L2
.L126:
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
	jmp	.L2
.L125:
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
	jmp	.L2
.L124:
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
	jmp	.L2
.L123:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %eax
	vmovss	(%eax), %xmm0
	vdivss	(%edi,%esi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%eax)
	jmp	.L2
.L128:
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
	jmp	.L2
.L127:
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
	jmp	.L2
.L129:
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
	jmp	.L206
.L82:
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
	jmp	.L2
.L81:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	andl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L80:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	andl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L79:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	andl	%edx, (%edi,%eax,4)
	jmp	.L2
.L78:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%edx, 80(%edi)
	movl	(%edi,%esi,4), %ebx
	movzbl	3(%ebp), %eax
	movl	(%ebx,%ecx,4), %ecx
	testl	%ecx, %ecx
	je	.L240
	movzbl	4(%esp), %ebx
	movl	%edx, %ebp
	movl	(%edi,%ebx,4), %ebx
	andl	%ecx, (%ebx,%eax,4)
	jmp	.L2
.L77:
	leal	3(%ebp), %ecx
	movl	8(%esp), %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L240
	movzbl	4(%esp), %eax
	movl	%ecx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%edx, (%esi)
	jmp	.L2
.L76:
	movl	8(%esp), %esi
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%esi,4), %ebx
	testl	%ebx, %ebx
	je	.L240
	movzbl	4(%esp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%edx, (%esi)
	jmp	.L2
.L75:
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %ecx
	testl	%ecx, %ecx
	je	.L240
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ecx
	movl	%edx, (%esi)
	jmp	.L2
.L74:
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
	jmp	.L2
.L73:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$2, %esi
	leal	(%edi,%eax,4), %ecx
	movl	(%ecx), %eax
	cltd
	idivl	%esi
	movl	%edx, (%ecx)
	jmp	.L2
.L72:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	leal	4(%ebp), %ecx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	%ecx, 80(%edi)
	movl	(%edi,%esi,4), %ebx
	movzbl	3(%ebp), %edx
	movl	(%ebx,%eax,4), %ebx
	testl	%ebx, %ebx
	je	.L240
	movzbl	4(%esp), %eax
	movl	%ecx, %ebp
	movl	(%edi,%eax,4), %eax
	leal	(%eax,%edx,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%eax, (%esi)
	jmp	.L2
.L71:
	leal	3(%ebp), %ecx
	movl	8(%esp), %eax
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %edx
	movl	(%edi,%eax,4), %eax
	movl	(%eax,%edx,4), %ebx
	testl	%ebx, %ebx
	je	.L240
	movzbl	4(%esp), %eax
	movl	%ecx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%eax, (%esi)
	jmp	.L2
.L70:
	movl	8(%esp), %esi
	leal	3(%ebp), %ecx
	movl	%ecx, 80(%edi)
	movzbl	2(%ebp), %eax
	movl	(%edi,%esi,4), %ebx
	testl	%ebx, %ebx
	je	.L240
	movzbl	4(%esp), %edx
	movl	%ecx, %ebp
	movl	(%edi,%edx,4), %edx
	leal	(%edx,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ebx
	movl	%eax, (%esi)
	jmp	.L2
.L69:
	movl	8(%esp), %eax
	movl	(%edi,%eax,4), %ecx
	testl	%ecx, %ecx
	je	.L240
	movzbl	4(%esp), %eax
	movl	%ebx, %ebp
	leal	(%edi,%eax,4), %esi
	movl	(%esi), %eax
	cltd
	idivl	%ecx
	movl	%eax, (%esi)
	jmp	.L2
.L68:
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
	jmp	.L2
.L67:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	addl	$2, %esi
	leal	(%edi,%eax,4), %ecx
	movl	(%ecx), %eax
	cltd
	idivl	%esi
	movl	%eax, (%ecx)
	jmp	.L2
.L90:
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
	jmp	.L2
.L89:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	xorl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L88:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	xorl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L87:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	xorl	%edx, (%edi,%eax,4)
	jmp	.L2
.L86:
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
	jmp	.L2
.L85:
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movzbl	4(%esp), %edx
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ebx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ecx
	movl	(%ecx,%ebx,4), %ecx
	orl	%ecx, (%edi,%edx,4)
	jmp	.L2
.L84:
	movzbl	4(%esp), %edx
	leal	3(%ebp), %eax
	movl	8(%esp), %esi
	movl	%eax, 80(%edi)
	movzbl	2(%ebp), %ecx
	movl	%eax, %ebp
	movl	(%edi,%esi,4), %ebx
	movl	(%edi,%edx,4), %edx
	orl	%ebx, (%edx,%ecx,4)
	jmp	.L2
.L83:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %edx
	orl	%edx, (%edi,%eax,4)
	jmp	.L2
.L94:
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
	jmp	.L2
.L93:
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
	jmp	.L2
.L92:
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
.L91:
	movl	8(%esp), %eax
	movzbl	4(%esp), %edx
	movl	%ebx, %ebp
	movl	(%edi,%eax,4), %eax
	notl	%eax
	movl	%eax, (%edi,%edx,4)
	jmp	.L2
.L96:
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
	jmp	.L2
.L95:
	movzbl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	%ebx, %ebp
	addl	$1, %ecx
	sall	%cl, (%edi,%eax,4)
	jmp	.L2
.L97:
	movzbl	4(%esp), %eax
	movl	8(%esp), %esi
	movl	%ebx, %ebp
	movl	(%edi,%esi,4), %ecx
	sall	%cl, (%edi,%eax,4)
	jmp	.L2
.L3:
.L211:
	movl	$4, 84(%edi)
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
.L241:
	.cfi_restore_state
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L244:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L250:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L247:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L212:
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
.L354:
	.cfi_restore_state
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L239:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L350:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L349:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L348:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L347:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L238:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L233:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L232:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L237:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L236:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L235:
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L234:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L351:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L227:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L353:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L352:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L208:
	movzbl	%al, %eax
	movsbl	(%ebx,%eax), %ebp
	addl	%ebx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L225:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L226:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L209:
	leal	(%ecx,%ecx), %eax
	movzwl	%ax, %eax
	movzbl	3(%ebp,%eax), %ecx
	movzbl	1(%edx,%eax), %ebp
	sall	$8, %ecx
	orl	%ecx, %ebp
	movswl	%bp, %ebp
	addl	%edx, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L224:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L223:
	addl	$4, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L228:
	addl	$5, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L382:
	leal	4(%edx), %ecx
	movzwl	%ax, %eax
	movl	%ecx, 88(%edi)
	movl	%ebx, (%edx)
	movl	112(%edi), %edx
	movl	(%edx,%eax,4), %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
.L377:
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
.L379:
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
.L378:
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
.L371:
	movl	8(%esp), %eax
	movl	4(%ecx,%esi), %edx
	cmpl	%edx, 4(%ebx,%eax)
	jne	.L278
	movl	8(%ecx,%esi), %esi
	cmpl	%esi, 8(%ebx,%eax)
	jne	.L278
	addl	$6, %ebp
	movl	%ebp, 80(%edi)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L372:
	movl	8(%esp), %eax
	movl	4(%ecx,%esi), %edx
	cmpl	%edx, 4(%ebx,%eax)
	jne	.L277
	movl	8(%ecx,%esi), %esi
	cmpl	%esi, 8(%ebx,%eax)
	jne	.L277
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
.L240:
	movl	$5, 84(%edi)
	jmp	.L358
.L300:
	movl	%ebx, %ebp
	jmp	.L2
.L219:
	movl	$6, 84(%edi)
	jmp	.L358
.L362:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm2, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	64(%edi), %xmm0
	vmovss	4(%esp), %xmm3
	jmp	.L296
.L363:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm2, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	(%ebx), %xmm1
	vmovss	4(%esp), %xmm3
	jmp	.L294
.L364:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm2, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	(%ebx), %xmm1
	vmovss	4(%esp), %xmm3
	jmp	.L292
.L365:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm3, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	(%ebx), %xmm2
	vmovss	4(%esp), %xmm4
	vmovss	4(%ebx), %xmm1
	vmovss	8(%ebx), %xmm0
	jmp	.L290
.L366:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	4(%esp), %xmm1
	jmp	.L288
.L367:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	4(%esp), %xmm1
	jmp	.L286
.L368:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	8(%esp)
	vmovss	8(%esp), %xmm1
	jmp	.L284
.L369:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	4(%esp), %xmm1
	jmp	.L282
.L370:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm0, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	8(%esp)
	vmovss	8(%esp), %xmm1
	jmp	.L280
.L373:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	(%edx,%eax,4)
	.cfi_def_cfa_offset 64
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	4(%esp), %xmm0
	jmp	.L275
.L374:
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
	jmp	.L273
.L375:
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
	jmp	.L271
.L380:
	subl	$16, %esp
	.cfi_def_cfa_offset 64
	vmovss	%xmm3, (%esp)
	call	sqrtf
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fstps	4(%esp)
	vmovss	64(%edi), %xmm0
	vmovss	4(%esp), %xmm4
	vmovss	68(%edi), %xmm2
	vmovss	72(%edi), %xmm1
	jmp	.L298
.L381:
	movl	$13, 84(%edi)
	jmp	.L358
.L376:
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
	jmp	.L269
.L217:
	movl	$10, 84(%edi)
	jmp	.L358
.L218:
	movl	$2, 84(%edi)
	jmp	.L358
.L383:
	movl	$7, 84(%edi)
	jmp	.L358
	.cfi_endproc
.LFE119:
	.size	_ZN3GVM11Interpreter7executeEv, .-_ZN3GVM11Interpreter7executeEv
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.text.unlikely
	.align 2
.LCOLDB6:
	.text
.LHOTB6:
	.align 2
	.p2align 4,,15
	.globl	_ZN3GVM11Interpreter4callEt
	.type	_ZN3GVM11Interpreter4callEt, @function
_ZN3GVM11Interpreter4callEt:
.LFB120:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	12(%esp), %edx
	movl	8(%esp), %eax
	testw	%dx, %dx
	je	.L385
	cmpw	124(%eax), %dx
	jnb	.L385
	movl	88(%eax), %ecx
	cmpl	100(%eax), %ecx
	jb	.L391
	movl	$8, 84(%eax)
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L385:
	.cfi_restore_state
	movl	$11, 84(%eax)
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L391:
	.cfi_restore_state
	leal	4(%ecx), %ebx
	movzwl	%dx, %edx
	movl	%ebx, 88(%eax)
	movl	80(%eax), %ebx
	movl	%ebx, (%ecx)
	movl	112(%eax), %ecx
	movl	(%ecx,%edx,4), %edx
	movl	%edx, 80(%eax)
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE120:
	.size	_ZN3GVM11Interpreter4callEt, .-_ZN3GVM11Interpreter4callEt
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
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
