	.file	"test_code.cpp"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"opcode_control.hpp\n\tNOP     : %d\n\tVBNE_IA : %d\nopcode_data_move.hpp\n\tMOVE_LR : %d\n\tVMVE_AI : %d\nopcode_arithmetic.hpp\n\tNEG_RR : %d\n\tVNRM_A : %d\nopcode_logic.hpp\n\tAND_RR : %d\n\tLSR_II : %d\nMAX      : %d\nDeclared : %d\n"
	.align 4
.LC1:
	.string	"Instruction %d\n\tvasm: %s\n\tsize: %d\n\tcode: "
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"\n"
.LC3:
	.string	"0x%02X "
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB146:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	movl	$1, %esi
	subl	$8, %esp
	pushl	$204
	pushl	$204
	pushl	$203
	pushl	$176
	pushl	$175
	pushl	$64
	pushl	$63
	pushl	$43
	pushl	$42
	pushl	$0
	pushl	$.LC0
	pushl	$1
	call	__printf_chk
	addl	$48, %esp
	.p2align 4,,10
	.p2align 3
.L4:
	subl	$12, %esp
	pushl	opcode_tests(,%esi,4)
	xorl	%ebx, %ebx
	call	strlen
	movl	%eax, (%esp)
	pushl	assembler(,%esi,4)
	movl	%eax, %edi
	pushl	%esi
	pushl	$.LC1
	pushl	$1
	call	__printf_chk
	addl	$32, %esp
	testl	%edi, %edi
	jle	.L5
	.p2align 4,,10
	.p2align 3
.L7:
	movl	opcode_tests(,%esi,4), %eax
	subl	$4, %esp
	movzbl	(%eax,%ebx), %eax
	addl	$1, %ebx
	pushl	%eax
	pushl	$.LC3
	pushl	$1
	call	__printf_chk
	addl	$16, %esp
	cmpl	%ebx, %edi
	jne	.L7
.L5:
	subl	$12, %esp
	addl	$1, %esi
	pushl	$.LC2
	call	puts
	addl	$16, %esp
	cmpl	$204, %esi
	jne	.L4
	leal	-16(%ebp), %esp
	xorl	%eax, %eax
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE146:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.globl	assembler
	.section	.rodata.str1.1
.LC5:
	.string	"nop"
.LC6:
	.string	"bras -2"
.LC7:
	.string	"bra -2"
.LC8:
	.string	"tjmps"
.LC9:
	.string	"tjmp"
.LC10:
	.string	"bcall -1"
.LC11:
	.string	"call 0xFFFF"
.LC12:
	.string	"call_r r7"
.LC13:
	.string	"call_i 1(r7),"
.LC14:
	.string	"call_h 0xFFFF"
.LC15:
	.string	"ret"
.LC16:
	.string	"dbnz r7, -2"
.LC17:
	.string	"ldbnn 1(r7), r8, -2"
.LC18:
	.string	"bez_r r7, -2"
.LC19:
	.string	"bez_i 1(r7), -2"
.LC20:
	.string	"bnz_r r7, -2"
.LC21:
	.string	"bnz_i 1(r7), -2"
.LC22:
	.string	"beq_rr r7, r8, -2"
.LC23:
	.string	"beq_ri r7, 2(r8), -2"
.LC24:
	.string	"beq_ii 1(r7), 2(r8), -2"
.LC25:
	.string	"bge_rr r7, r8, -2"
.LC26:
	.string	"bge_ri r7, 2(r8), -2"
.LC27:
	.string	"bge_ir 1(r7), r8, -2"
.LC28:
	.string	"bge_ii 1(r7), 2(r8), -2"
.LC29:
	.string	"bgt_rr r7, r8, -2"
.LC30:
	.string	"bgt_ri r7, 2(r8), -2"
.LC31:
	.string	"bgt_ir 1(r7), r8, -2"
.LC32:
	.string	"bgt_ii 1(r7), 2(r8), -2"
.LC33:
	.string	"fbge_rr r7, r8, -2"
.LC34:
	.string	"fbge_ri r7, 2(r8), -2"
.LC35:
	.string	"fbge_ii 1(r7), 2(r8), -2"
.LC36:
	.string	"fbge_ir 1(r7), r8, -2"
.LC37:
	.string	"fbgt_rr r7, r8, -2"
.LC38:
	.string	"fbgt_ri r7, 2(r8), -2"
.LC39:
	.string	"fbgt_ir 1(r7), r8, -2"
.LC40:
	.string	"fbgt_ii 1(r7), 2(r8), -2"
.LC41:
	.string	"vbeq_ii 1(r7), 2(r8), -2"
.LC42:
	.string	"vbeq_ia 1(r7), -2"
.LC43:
	.string	"vbne_ii 1(r7), 2(r8), -2"
.LC44:
	.string	"vbne_ia 1(r7), -2"
.LC45:
	.string	"move_lr 3, r8"
.LC46:
	.string	"move_li 3, 2(r8)"
.LC47:
	.string	"move_rr r7, r8"
.LC48:
	.string	"move_ri r7, 2(r8)"
.LC49:
	.string	"move_ir 1(r7), r8"
.LC50:
	.string	"move_ii 1(r7), 2(r8)"
.LC51:
	.string	"move_mr r8"
.LC52:
	.string	"move_mi 2(r8)"
.LC53:
	.string	"pushr r7, r8"
.LC54:
	.string	"popr r7, r8"
.LC55:
	.string	"asf r8, 240"
.LC56:
	.string	"fsf r8, 240"
.LC57:
	.string	"vspl_li 3, 2(r8)"
.LC58:
	.string	"vspl_ri r7, 2(r8)"
.LC59:
	.string	"vspl_ii 1(r7), 2(r8)"
.LC60:
	.string	"vspl_la 3"
.LC61:
	.string	"vspl_ra r7"
.LC62:
	.string	"vspl_ia 1(r7),"
.LC63:
	.string	"vmve_ii 1(r7), 2(r8)"
.LC64:
	.string	"vmve_ia 1(r7),"
.LC65:
	.string	"vmve_ai 2(r8)"
.LC66:
	.string	"neg_rr r7, r8"
.LC67:
	.string	"neg_ri r7, 2(r8)"
.LC68:
	.string	"neg_ir 1(r7), r8"
.LC69:
	.string	"neg_ii 1(r7), 2(r8)"
.LC70:
	.string	"add_lr 3, r8"
.LC71:
	.string	"add_li 3, 2(r8)"
.LC72:
	.string	"add_rr r7, r8"
.LC73:
	.string	"add_ri r7, 2(r8)"
.LC74:
	.string	"add_ir 1(r7), r8"
.LC75:
	.string	"add_ii 1(r7), r8,2"
.LC76:
	.string	"sub_lr 3, r8"
.LC77:
	.string	"sub_li 3, 2(r8)"
.LC78:
	.string	"sub_rr r7, r8"
.LC79:
	.string	"sub_ri r7, 2(r8)"
.LC80:
	.string	"sub_ir 1(r7), r8"
.LC81:
	.string	"sub_ii 1(r7), 2(r8)"
.LC82:
	.string	"mul_lr 3, r8"
.LC83:
	.string	"mul_li 3, 2(r8)"
.LC84:
	.string	"mul_rr r7, r8"
.LC85:
	.string	"mul_ri r7, 2(r8)"
.LC86:
	.string	"mul_ir 1(r7), r8"
.LC87:
	.string	"mul_ii 1(r7), 2(r8)"
.LC88:
	.string	"div_lr 3, r8"
.LC89:
	.string	"div_li 3, 2(r8)"
.LC90:
	.string	"div_rr r7, r8"
.LC91:
	.string	"div_ri r7, 2(r8)"
.LC92:
	.string	"div_ir 1(r7), r8"
.LC93:
	.string	"div_ii 1(r7), 2(r8)"
.LC94:
	.string	"mod_lr 3, r8"
.LC95:
	.string	"mod_li 3, 2(r8)"
.LC96:
	.string	"mod_rr r7, r8"
.LC97:
	.string	"mod_ri r7, 2(r8)"
.LC98:
	.string	"mod_ir 1(r7), r8"
.LC99:
	.string	"mod_ii 1(r7), 2(r8)"
.LC100:
	.string	"fneg_rr r7, r8"
.LC101:
	.string	"fneg_ri r7, 2(r8)"
.LC102:
	.string	"fneg_ir 1(r7), r8"
.LC103:
	.string	"fneg_ii 1(r7), 2(r8)"
.LC104:
	.string	"fadd_rr r7, r8"
.LC105:
	.string	"fadd_ri r7, 2(r8)"
.LC106:
	.string	"fadd_ir 1(r7), r8"
.LC107:
	.string	"fadd_ii 1(r7), 2(r8)"
.LC108:
	.string	"fsub_rr r7, r8"
.LC109:
	.string	"fsub_ri r7, 2(r8)"
.LC110:
	.string	"fsub_ir 1(r7), r8"
.LC111:
	.string	"fsub_ii 1(r7), 2(r8)"
.LC112:
	.string	"fmul_rr r7, r8"
.LC113:
	.string	"fmul_ri r7, 2(r8)"
.LC114:
	.string	"fmul_ir 1(r7), r8"
.LC115:
	.string	"fmul_ii 1(r7), 2(r8)"
.LC116:
	.string	"fdiv_rr r7, r8"
.LC117:
	.string	"fdiv_ri r7, 2(r8)"
.LC118:
	.string	"fdiv_ir 1(r7), r8"
.LC119:
	.string	"fdiv_ii 1(r7), 2(r8)"
.LC120:
	.string	"fmod_rr r7, r8"
.LC121:
	.string	"fmod_ri r7, 2(r8)"
.LC122:
	.string	"fmod_ir 1(r7), r8"
.LC123:
	.string	"fmod_ii 1(r7), 2(r8)"
.LC124:
	.string	"fsqrt_rr r7, r8"
.LC125:
	.string	"fsqrt_ri r7, 2(r8)"
.LC126:
	.string	"fsqrt_ir 1(r7), r8"
.LC127:
	.string	"fsqrt_ii 1(r7), 2(r8)"
.LC128:
	.string	"fsin_rr r7, r8"
.LC129:
	.string	"fsin_ri r7, 2(r8)"
.LC130:
	.string	"fsin_ir 1(r7), r8"
.LC131:
	.string	"fsin_ii 1(r7), 2(r8)"
.LC132:
	.string	"fcos_rr r7, r8"
.LC133:
	.string	"fcos_ri r7, 2(r8)"
.LC134:
	.string	"fcos_ir 1(r7), r8"
.LC135:
	.string	"fcos_ii 1(r7), 2(r8)"
.LC136:
	.string	"ftan_rr r7, r8"
.LC137:
	.string	"ftan_ri r7, 2(r8)"
.LC138:
	.string	"ftan_ir 1(r7), r8"
.LC139:
	.string	"ftan_ii 1(r7), 2(r8)"
.LC140:
	.string	"vneg_i 2(r8)"
.LC141:
	.string	"vneg_ii 1(r7), 2(r8)"
.LC142:
	.string	"vneg_ia 1(r7),"
.LC143:
	.string	"vneg_ai 2(r8)"
.LC144:
	.string	"vneg_a"
.LC145:
	.string	"vscl_ri r7, 2(r8)"
.LC146:
	.string	"vscl_ii 1(r7), 2(r8)"
.LC147:
	.string	"vscl_mi 2(r8)"
.LC148:
	.string	"vscl_ra r7"
.LC149:
	.string	"vscl_ia 1(r7),"
.LC150:
	.string	"vscl_ma"
.LC151:
	.string	"vadd_ii 1(r7), 2(r8)"
.LC152:
	.string	"vadd_ia 1(r7),"
.LC153:
	.string	"vadd_ai 2(r8)"
.LC154:
	.string	"vadd_iia 1(r7), 2(r8)"
.LC155:
	.string	"vadd_iai 1(r7), 2(r8)"
.LC156:
	.string	"vsub_ii 1(r7), 2(r8)"
.LC157:
	.string	"vsub_ia 1(r7),"
.LC158:
	.string	"vsub_ai 2(r8)"
.LC159:
	.string	"vsub_iia 1(r7), 2(r8)"
.LC160:
	.string	"vsub_iai 1(r7), 2(r8)"
.LC161:
	.string	"vsub_aii 1(r7), 2(r8)"
.LC162:
	.string	"vmul_iia 1(r7), 2(r8)"
.LC163:
	.string	"vmul_aii 1(r7), 2(r8)"
.LC164:
	.string	"vmul_iai 1(r7), 2(r8)"
.LC165:
	.string	"vdot_iim 1(r7), 2(r8)"
.LC166:
	.string	"vdot_air 1(r7), r8"
.LC167:
	.string	"vdot_aii 1(r7), 2(r8)"
.LC168:
	.string	"vmag_ir 1(r7), r8"
.LC169:
	.string	"vmag_ii 1(r7), 2(r8)"
.LC170:
	.string	"vmag_ar r8"
.LC171:
	.string	"vmag_ai 2(r8)"
.LC172:
	.string	"vmag_m"
.LC173:
	.string	"vnrm_i 1(r7)"
.LC174:
	.string	"vnrm_ii 1(r7), 2(r8)"
.LC175:
	.string	"vnrm_ia 1(r7)"
.LC176:
	.string	"vnrm_ai 2(r8)"
.LC177:
	.string	"vnrm_a"
.LC178:
	.string	"and_rr r7, r8"
.LC179:
	.string	"and_ri r7, 2(r8)"
.LC180:
	.string	"and_ir 1(r7), r8"
.LC181:
	.string	"and_ii 1(r7), 2(r8)"
.LC182:
	.string	"or_rr r7, r8"
.LC183:
	.string	"or_ri r7, 2(r8)"
.LC184:
	.string	"or_ir 1(r7), r8"
.LC185:
	.string	"or_ii 1(r7), 2(r8)"
.LC186:
	.string	"xor_rr r7, r8"
.LC187:
	.string	"xor_ri r7, 2(r8)"
.LC188:
	.string	"xor_ir 1(r7), r8"
.LC189:
	.string	"xor_ii 1(r7), 2(r8)"
.LC190:
	.string	"not_rr r7, r8"
.LC191:
	.string	"not_ri r7, 2(r8)"
.LC192:
	.string	"not_ir 1(r7), r8"
.LC193:
	.string	"not_ii 1(r7), 2(r8)"
.LC194:
	.string	"lsl_lr 3, r8"
.LC195:
	.string	"lsl_li 3, 2(r8)"
.LC196:
	.string	"lsl_rr r7, r8"
.LC197:
	.string	"lsl_ri r7, 2(r8)"
.LC198:
	.string	"lsl_ir 1(r7), r8"
.LC199:
	.string	"lsl_ii 1(r7),2(r8)"
.LC200:
	.string	"lsr_lr 3, r8"
.LC201:
	.string	"lsr_li 3, 2(r8)"
.LC202:
	.string	"lsr_rr r7, r8"
.LC203:
	.string	"lsr_ri r7, 2(r8)"
.LC204:
	.string	"lsr_ir 1(r7), r8"
.LC205:
	.string	"lsr_ii 1(r7), 2(r8)"
	.data
	.align 32
	.type	assembler, @object
	.size	assembler, 816
assembler:
	.long	.LC5
	.long	.LC6
	.long	.LC7
	.long	.LC8
	.long	.LC9
	.long	.LC10
	.long	.LC11
	.long	.LC12
	.long	.LC13
	.long	.LC14
	.long	.LC15
	.long	.LC16
	.long	.LC17
	.long	.LC18
	.long	.LC19
	.long	.LC20
	.long	.LC21
	.long	.LC22
	.long	.LC23
	.long	.LC24
	.long	.LC25
	.long	.LC26
	.long	.LC27
	.long	.LC28
	.long	.LC29
	.long	.LC30
	.long	.LC31
	.long	.LC32
	.long	.LC33
	.long	.LC34
	.long	.LC35
	.long	.LC33
	.long	.LC34
	.long	.LC36
	.long	.LC35
	.long	.LC37
	.long	.LC38
	.long	.LC39
	.long	.LC40
	.long	.LC41
	.long	.LC42
	.long	.LC43
	.long	.LC44
	.long	.LC45
	.long	.LC46
	.long	.LC47
	.long	.LC48
	.long	.LC49
	.long	.LC50
	.long	.LC51
	.long	.LC52
	.long	.LC53
	.long	.LC54
	.long	.LC55
	.long	.LC56
	.long	.LC57
	.long	.LC58
	.long	.LC59
	.long	.LC60
	.long	.LC61
	.long	.LC62
	.long	.LC63
	.long	.LC64
	.long	.LC65
	.long	.LC66
	.long	.LC67
	.long	.LC68
	.long	.LC69
	.long	.LC70
	.long	.LC71
	.long	.LC72
	.long	.LC73
	.long	.LC74
	.long	.LC75
	.long	.LC76
	.long	.LC77
	.long	.LC78
	.long	.LC79
	.long	.LC80
	.long	.LC81
	.long	.LC82
	.long	.LC83
	.long	.LC84
	.long	.LC85
	.long	.LC86
	.long	.LC87
	.long	.LC88
	.long	.LC89
	.long	.LC90
	.long	.LC91
	.long	.LC92
	.long	.LC93
	.long	.LC94
	.long	.LC95
	.long	.LC96
	.long	.LC97
	.long	.LC98
	.long	.LC99
	.long	.LC100
	.long	.LC101
	.long	.LC102
	.long	.LC103
	.long	.LC104
	.long	.LC105
	.long	.LC106
	.long	.LC107
	.long	.LC108
	.long	.LC109
	.long	.LC110
	.long	.LC111
	.long	.LC112
	.long	.LC113
	.long	.LC114
	.long	.LC115
	.long	.LC116
	.long	.LC117
	.long	.LC118
	.long	.LC119
	.long	.LC120
	.long	.LC121
	.long	.LC122
	.long	.LC123
	.long	.LC124
	.long	.LC125
	.long	.LC126
	.long	.LC127
	.long	.LC128
	.long	.LC129
	.long	.LC130
	.long	.LC131
	.long	.LC132
	.long	.LC133
	.long	.LC134
	.long	.LC135
	.long	.LC136
	.long	.LC137
	.long	.LC138
	.long	.LC139
	.long	.LC140
	.long	.LC141
	.long	.LC142
	.long	.LC143
	.long	.LC144
	.long	.LC145
	.long	.LC146
	.long	.LC147
	.long	.LC148
	.long	.LC149
	.long	.LC150
	.long	.LC151
	.long	.LC152
	.long	.LC153
	.long	.LC154
	.long	.LC155
	.long	.LC156
	.long	.LC157
	.long	.LC158
	.long	.LC159
	.long	.LC160
	.long	.LC161
	.long	.LC162
	.long	.LC163
	.long	.LC164
	.long	.LC165
	.long	.LC166
	.long	.LC167
	.long	.LC168
	.long	.LC169
	.long	.LC170
	.long	.LC171
	.long	.LC172
	.long	.LC173
	.long	.LC174
	.long	.LC175
	.long	.LC176
	.long	.LC177
	.long	.LC178
	.long	.LC179
	.long	.LC180
	.long	.LC181
	.long	.LC182
	.long	.LC183
	.long	.LC184
	.long	.LC185
	.long	.LC186
	.long	.LC187
	.long	.LC188
	.long	.LC189
	.long	.LC190
	.long	.LC191
	.long	.LC192
	.long	.LC193
	.long	.LC194
	.long	.LC195
	.long	.LC196
	.long	.LC197
	.long	.LC198
	.long	.LC199
	.long	.LC200
	.long	.LC201
	.long	.LC202
	.long	.LC203
	.long	.LC204
	.long	.LC205
	.globl	opcode_tests
	.align 32
	.type	opcode_tests, @object
	.size	opcode_tests, 816
opcode_tests:
	.long	op_nop
	.long	op_bras
	.long	op_bra
	.long	op_tjmps
	.long	op_tjmp
	.long	op_bcall
	.long	op_call
	.long	op_call_r
	.long	op_call_i
	.long	op_call_h
	.long	op_ret
	.long	op_dbnz
	.long	op_ldbnn
	.long	op_bez_r
	.long	op_bez_i
	.long	op_bnz_r
	.long	op_bnz_i
	.long	op_beq_rr
	.long	op_beq_ri
	.long	op_beq_ii
	.long	op_bge_rr
	.long	op_bge_ri
	.long	op_bge_ir
	.long	op_bge_ii
	.long	op_bgt_rr
	.long	op_bgt_ri
	.long	op_bgt_ir
	.long	op_bgt_ii
	.long	op_fbeq_rr
	.long	op_fbeq_ri
	.long	op_fbeq_ii
	.long	op_fbge_rr
	.long	op_fbge_ri
	.long	op_fbge_ir
	.long	op_fbge_ii
	.long	op_fbgt_rr
	.long	op_fbgt_ri
	.long	op_fbgt_ir
	.long	op_fbgt_ii
	.long	op_vbeq_ii
	.long	op_vbeq_ia
	.long	op_vbne_ii
	.long	op_vbne_ia
	.long	op_move_lr
	.long	op_move_li
	.long	op_move_rr
	.long	op_move_ri
	.long	op_move_ir
	.long	op_move_ii
	.long	op_move_mr
	.long	op_move_mi
	.long	op_pushr
	.long	op_popr
	.long	op_asf
	.long	op_fsf
	.long	op_vspl_li
	.long	op_vspl_ri
	.long	op_vspl_ii
	.long	op_vspl_la
	.long	op_vspl_ra
	.long	op_vspl_ia
	.long	op_vmve_ii
	.long	op_vmve_ia
	.long	op_vmve_ai
	.long	op_neg_rr
	.long	op_neg_ri
	.long	op_neg_ir
	.long	op_neg_ii
	.long	op_add_lr
	.long	op_add_li
	.long	op_add_rr
	.long	op_add_ri
	.long	op_add_ir
	.long	op_add_ii
	.long	op_sub_lr
	.long	op_sub_li
	.long	op_sub_rr
	.long	op_sub_ri
	.long	op_sub_ir
	.long	op_sub_ii
	.long	op_mul_lr
	.long	op_mul_li
	.long	op_mul_rr
	.long	op_mul_ri
	.long	op_mul_ir
	.long	op_mul_ii
	.long	op_div_lr
	.long	op_div_li
	.long	op_div_rr
	.long	op_div_ri
	.long	op_div_ir
	.long	op_div_ii
	.long	op_mod_lr
	.long	op_mod_li
	.long	op_mod_rr
	.long	op_mod_ri
	.long	op_mod_ir
	.long	op_mod_ii
	.long	op_fneg_rr
	.long	op_fneg_ri
	.long	op_fneg_ir
	.long	op_fneg_ii
	.long	op_fadd_rr
	.long	op_fadd_ri
	.long	op_fadd_ir
	.long	op_fadd_ii
	.long	op_fsub_rr
	.long	op_fsub_ri
	.long	op_fsub_ir
	.long	op_fsub_ii
	.long	op_fmul_rr
	.long	op_fmul_ri
	.long	op_fmul_ir
	.long	op_fmul_ii
	.long	op_fdiv_rr
	.long	op_fdiv_ri
	.long	op_fdiv_ir
	.long	op_fdiv_ii
	.long	op_fmod_rr
	.long	op_fmod_ri
	.long	op_fmod_ir
	.long	op_fmod_ii
	.long	op_fsqrt_rr
	.long	op_fsqrt_ri
	.long	op_fsqrt_ir
	.long	op_fsqrt_ii
	.long	op_fsin_rr
	.long	op_fsin_ri
	.long	op_fsin_ir
	.long	op_fsin_ii
	.long	op_fcos_rr
	.long	op_fcos_ri
	.long	op_fcos_ir
	.long	op_fcos_ii
	.long	op_ftan_rr
	.long	op_ftan_ri
	.long	op_ftan_ir
	.long	op_ftan_ii
	.long	op_vneg_i
	.long	op_vneg_ii
	.long	op_vneg_ia
	.long	op_vneg_ai
	.long	op_vneg_a
	.long	op_vscl_ri
	.long	op_vscl_ii
	.long	op_vscl_mi
	.long	op_vscl_ra
	.long	op_vscl_ia
	.long	op_vscl_ma
	.long	op_vadd_ii
	.long	op_vadd_ia
	.long	op_vadd_ai
	.long	op_vadd_iia
	.long	op_vadd_iai
	.long	op_vsub_ii
	.long	op_vsub_ia
	.long	op_vsub_ai
	.long	op_vsub_iia
	.long	op_vsub_iai
	.long	op_vsub_aii
	.long	op_vmul_iia
	.long	op_vmul_aii
	.long	op_vmul_iai
	.long	op_vdot_iim
	.long	op_vdot_air
	.long	op_vdot_aii
	.long	op_vmag_ir
	.long	op_vmag_ii
	.long	op_vmag_ar
	.long	op_vmag_ai
	.long	op_vmag_m
	.long	op_vnrm_i
	.long	op_vnrm_ii
	.long	op_vnrm_ia
	.long	op_vnrm_ai
	.long	op_vnrm_a
	.long	op_and_rr
	.long	op_and_ri
	.long	op_and_ir
	.long	op_and_ii
	.long	op_or_rr
	.long	op_or_ri
	.long	op_or_ir
	.long	op_or_ii
	.long	op_xor_rr
	.long	op_xor_ri
	.long	op_xor_ir
	.long	op_xor_ii
	.long	op_not_rr
	.long	op_not_ri
	.long	op_not_ir
	.long	op_not_ii
	.long	op_lsl_lr
	.long	op_lsl_li
	.long	op_lsl_rr
	.long	op_lsl_ri
	.long	op_lsl_ir
	.long	op_lsl_ii
	.long	op_lsr_lr
	.long	op_lsr_li
	.long	op_lsr_rr
	.long	op_lsr_ri
	.long	op_lsr_ir
	.long	op_lsr_ii
	.globl	op_lsr_ii
	.align 4
	.type	op_lsr_ii, @object
	.size	op_lsr_ii, 5
op_lsr_ii:
	.byte	-53
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_lsr_ir
	.align 4
	.type	op_lsr_ir, @object
	.size	op_lsr_ir, 4
op_lsr_ir:
	.byte	-54
	.byte	120
	.byte	1
	.byte	0
	.globl	op_lsr_ri
	.align 4
	.type	op_lsr_ri, @object
	.size	op_lsr_ri, 4
op_lsr_ri:
	.byte	-55
	.byte	120
	.byte	2
	.byte	0
	.globl	op_lsr_rr
	.type	op_lsr_rr, @object
	.size	op_lsr_rr, 3
op_lsr_rr:
	.byte	-56
	.byte	120
	.byte	0
	.globl	op_lsr_li
	.align 4
	.type	op_lsr_li, @object
	.size	op_lsr_li, 4
op_lsr_li:
	.byte	-57
	.byte	56
	.byte	2
	.byte	0
	.globl	op_lsr_lr
	.type	op_lsr_lr, @object
	.size	op_lsr_lr, 3
op_lsr_lr:
	.byte	-58
	.byte	56
	.byte	0
	.globl	op_lsl_ii
	.align 4
	.type	op_lsl_ii, @object
	.size	op_lsl_ii, 5
op_lsl_ii:
	.byte	-59
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_lsl_ir
	.align 4
	.type	op_lsl_ir, @object
	.size	op_lsl_ir, 4
op_lsl_ir:
	.byte	-60
	.byte	120
	.byte	1
	.byte	0
	.globl	op_lsl_ri
	.align 4
	.type	op_lsl_ri, @object
	.size	op_lsl_ri, 4
op_lsl_ri:
	.byte	-61
	.byte	120
	.byte	2
	.byte	0
	.globl	op_lsl_rr
	.type	op_lsl_rr, @object
	.size	op_lsl_rr, 3
op_lsl_rr:
	.byte	-62
	.byte	120
	.byte	0
	.globl	op_lsl_li
	.align 4
	.type	op_lsl_li, @object
	.size	op_lsl_li, 4
op_lsl_li:
	.byte	-63
	.byte	56
	.byte	2
	.byte	0
	.globl	op_lsl_lr
	.type	op_lsl_lr, @object
	.size	op_lsl_lr, 3
op_lsl_lr:
	.byte	-64
	.byte	56
	.byte	0
	.globl	op_not_ii
	.align 4
	.type	op_not_ii, @object
	.size	op_not_ii, 5
op_not_ii:
	.byte	-65
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_not_ir
	.align 4
	.type	op_not_ir, @object
	.size	op_not_ir, 4
op_not_ir:
	.byte	-66
	.byte	120
	.byte	1
	.byte	0
	.globl	op_not_ri
	.align 4
	.type	op_not_ri, @object
	.size	op_not_ri, 4
op_not_ri:
	.byte	-67
	.byte	120
	.byte	2
	.byte	0
	.globl	op_not_rr
	.type	op_not_rr, @object
	.size	op_not_rr, 3
op_not_rr:
	.byte	-68
	.byte	120
	.byte	0
	.globl	op_xor_ii
	.align 4
	.type	op_xor_ii, @object
	.size	op_xor_ii, 5
op_xor_ii:
	.byte	-69
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_xor_ir
	.align 4
	.type	op_xor_ir, @object
	.size	op_xor_ir, 4
op_xor_ir:
	.byte	-70
	.byte	120
	.byte	1
	.byte	0
	.globl	op_xor_ri
	.align 4
	.type	op_xor_ri, @object
	.size	op_xor_ri, 4
op_xor_ri:
	.byte	-71
	.byte	120
	.byte	2
	.byte	0
	.globl	op_xor_rr
	.type	op_xor_rr, @object
	.size	op_xor_rr, 3
op_xor_rr:
	.byte	-72
	.byte	120
	.byte	0
	.globl	op_or_ii
	.align 4
	.type	op_or_ii, @object
	.size	op_or_ii, 5
op_or_ii:
	.byte	-73
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_or_ir
	.align 4
	.type	op_or_ir, @object
	.size	op_or_ir, 4
op_or_ir:
	.byte	-74
	.byte	120
	.byte	1
	.byte	0
	.globl	op_or_ri
	.align 4
	.type	op_or_ri, @object
	.size	op_or_ri, 4
op_or_ri:
	.byte	-75
	.byte	120
	.byte	2
	.byte	0
	.globl	op_or_rr
	.type	op_or_rr, @object
	.size	op_or_rr, 3
op_or_rr:
	.byte	-76
	.byte	120
	.byte	0
	.globl	op_and_ii
	.align 4
	.type	op_and_ii, @object
	.size	op_and_ii, 5
op_and_ii:
	.byte	-77
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_and_ir
	.align 4
	.type	op_and_ir, @object
	.size	op_and_ir, 4
op_and_ir:
	.byte	-78
	.byte	120
	.byte	1
	.byte	0
	.globl	op_and_ri
	.align 4
	.type	op_and_ri, @object
	.size	op_and_ri, 4
op_and_ri:
	.byte	-79
	.byte	120
	.byte	2
	.byte	0
	.globl	op_and_rr
	.type	op_and_rr, @object
	.size	op_and_rr, 3
op_and_rr:
	.byte	-80
	.byte	120
	.byte	0
	.globl	op_vnrm_a
	.type	op_vnrm_a, @object
	.size	op_vnrm_a, 2
op_vnrm_a:
	.byte	-81
	.byte	0
	.globl	op_vnrm_ai
	.align 4
	.type	op_vnrm_ai, @object
	.size	op_vnrm_ai, 4
op_vnrm_ai:
	.byte	-82
	.byte	8
	.byte	2
	.byte	0
	.globl	op_vnrm_ia
	.align 4
	.type	op_vnrm_ia, @object
	.size	op_vnrm_ia, 4
op_vnrm_ia:
	.byte	-83
	.byte	112
	.byte	1
	.byte	0
	.globl	op_vnrm_ii
	.align 4
	.type	op_vnrm_ii, @object
	.size	op_vnrm_ii, 5
op_vnrm_ii:
	.byte	-84
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vnrm_i
	.align 4
	.type	op_vnrm_i, @object
	.size	op_vnrm_i, 4
op_vnrm_i:
	.byte	-85
	.byte	7
	.byte	1
	.byte	0
	.globl	op_vmag_m
	.type	op_vmag_m, @object
	.size	op_vmag_m, 2
op_vmag_m:
	.byte	-86
	.byte	0
	.globl	op_vmag_ai
	.align 4
	.type	op_vmag_ai, @object
	.size	op_vmag_ai, 4
op_vmag_ai:
	.byte	-87
	.byte	8
	.byte	2
	.byte	0
	.globl	op_vmag_ar
	.type	op_vmag_ar, @object
	.size	op_vmag_ar, 3
op_vmag_ar:
	.byte	-88
	.byte	8
	.byte	0
	.globl	op_vmag_ii
	.align 4
	.type	op_vmag_ii, @object
	.size	op_vmag_ii, 5
op_vmag_ii:
	.byte	-89
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vmag_ir
	.align 4
	.type	op_vmag_ir, @object
	.size	op_vmag_ir, 4
op_vmag_ir:
	.byte	-90
	.byte	120
	.byte	1
	.byte	0
	.globl	op_vdot_aii
	.align 4
	.type	op_vdot_aii, @object
	.size	op_vdot_aii, 5
op_vdot_aii:
	.byte	-91
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vdot_air
	.align 4
	.type	op_vdot_air, @object
	.size	op_vdot_air, 4
op_vdot_air:
	.byte	-92
	.byte	120
	.byte	1
	.byte	0
	.globl	op_vdot_iim
	.align 4
	.type	op_vdot_iim, @object
	.size	op_vdot_iim, 5
op_vdot_iim:
	.byte	-93
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vmul_iai
	.align 4
	.type	op_vmul_iai, @object
	.size	op_vmul_iai, 5
op_vmul_iai:
	.byte	-94
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vmul_aii
	.align 4
	.type	op_vmul_aii, @object
	.size	op_vmul_aii, 5
op_vmul_aii:
	.byte	-95
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vmul_iia
	.align 4
	.type	op_vmul_iia, @object
	.size	op_vmul_iia, 5
op_vmul_iia:
	.byte	-96
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vsub_aii
	.align 4
	.type	op_vsub_aii, @object
	.size	op_vsub_aii, 5
op_vsub_aii:
	.byte	-97
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vsub_iai
	.align 4
	.type	op_vsub_iai, @object
	.size	op_vsub_iai, 5
op_vsub_iai:
	.byte	-98
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vsub_iia
	.align 4
	.type	op_vsub_iia, @object
	.size	op_vsub_iia, 5
op_vsub_iia:
	.byte	-99
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vsub_ai
	.align 4
	.type	op_vsub_ai, @object
	.size	op_vsub_ai, 4
op_vsub_ai:
	.byte	-100
	.byte	8
	.byte	2
	.byte	0
	.globl	op_vsub_ia
	.align 4
	.type	op_vsub_ia, @object
	.size	op_vsub_ia, 4
op_vsub_ia:
	.byte	-101
	.byte	112
	.byte	1
	.byte	0
	.globl	op_vsub_ii
	.align 4
	.type	op_vsub_ii, @object
	.size	op_vsub_ii, 5
op_vsub_ii:
	.byte	-102
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vadd_iai
	.align 4
	.type	op_vadd_iai, @object
	.size	op_vadd_iai, 5
op_vadd_iai:
	.byte	-103
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vadd_iia
	.align 4
	.type	op_vadd_iia, @object
	.size	op_vadd_iia, 5
op_vadd_iia:
	.byte	-104
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vadd_ai
	.align 4
	.type	op_vadd_ai, @object
	.size	op_vadd_ai, 4
op_vadd_ai:
	.byte	-105
	.byte	8
	.byte	2
	.byte	0
	.globl	op_vadd_ia
	.align 4
	.type	op_vadd_ia, @object
	.size	op_vadd_ia, 4
op_vadd_ia:
	.byte	-106
	.byte	112
	.byte	1
	.byte	0
	.globl	op_vadd_ii
	.align 4
	.type	op_vadd_ii, @object
	.size	op_vadd_ii, 5
op_vadd_ii:
	.byte	-107
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vscl_ma
	.type	op_vscl_ma, @object
	.size	op_vscl_ma, 2
op_vscl_ma:
	.byte	-108
	.byte	0
	.globl	op_vscl_ia
	.align 4
	.type	op_vscl_ia, @object
	.size	op_vscl_ia, 4
op_vscl_ia:
	.byte	-109
	.byte	112
	.byte	1
	.byte	0
	.globl	op_vscl_ra
	.type	op_vscl_ra, @object
	.size	op_vscl_ra, 3
op_vscl_ra:
	.byte	-110
	.byte	112
	.byte	0
	.globl	op_vscl_mi
	.align 4
	.type	op_vscl_mi, @object
	.size	op_vscl_mi, 4
op_vscl_mi:
	.byte	-111
	.byte	8
	.byte	2
	.byte	0
	.globl	op_vscl_ii
	.align 4
	.type	op_vscl_ii, @object
	.size	op_vscl_ii, 5
op_vscl_ii:
	.byte	-112
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vscl_ri
	.align 4
	.type	op_vscl_ri, @object
	.size	op_vscl_ri, 4
op_vscl_ri:
	.byte	-113
	.byte	120
	.byte	2
	.byte	0
	.globl	op_vneg_a
	.type	op_vneg_a, @object
	.size	op_vneg_a, 2
op_vneg_a:
	.byte	-114
	.byte	0
	.globl	op_vneg_ai
	.align 4
	.type	op_vneg_ai, @object
	.size	op_vneg_ai, 4
op_vneg_ai:
	.byte	-115
	.byte	8
	.byte	2
	.byte	0
	.globl	op_vneg_ia
	.align 4
	.type	op_vneg_ia, @object
	.size	op_vneg_ia, 4
op_vneg_ia:
	.byte	-116
	.byte	112
	.byte	1
	.byte	0
	.globl	op_vneg_ii
	.align 4
	.type	op_vneg_ii, @object
	.size	op_vneg_ii, 5
op_vneg_ii:
	.byte	-117
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vneg_i
	.align 4
	.type	op_vneg_i, @object
	.size	op_vneg_i, 4
op_vneg_i:
	.byte	-118
	.byte	8
	.byte	2
	.byte	0
	.globl	op_ftan_ii
	.align 4
	.type	op_ftan_ii, @object
	.size	op_ftan_ii, 5
op_ftan_ii:
	.byte	-119
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_ftan_ir
	.align 4
	.type	op_ftan_ir, @object
	.size	op_ftan_ir, 4
op_ftan_ir:
	.byte	-120
	.byte	120
	.byte	1
	.byte	0
	.globl	op_ftan_ri
	.align 4
	.type	op_ftan_ri, @object
	.size	op_ftan_ri, 4
op_ftan_ri:
	.byte	-121
	.byte	120
	.byte	2
	.byte	0
	.globl	op_ftan_rr
	.type	op_ftan_rr, @object
	.size	op_ftan_rr, 3
op_ftan_rr:
	.byte	-122
	.byte	120
	.byte	0
	.globl	op_fcos_ii
	.align 4
	.type	op_fcos_ii, @object
	.size	op_fcos_ii, 5
op_fcos_ii:
	.byte	-123
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_fcos_ir
	.align 4
	.type	op_fcos_ir, @object
	.size	op_fcos_ir, 4
op_fcos_ir:
	.byte	-124
	.byte	120
	.byte	1
	.byte	0
	.globl	op_fcos_ri
	.align 4
	.type	op_fcos_ri, @object
	.size	op_fcos_ri, 4
op_fcos_ri:
	.byte	-125
	.byte	120
	.byte	2
	.byte	0
	.globl	op_fcos_rr
	.type	op_fcos_rr, @object
	.size	op_fcos_rr, 3
op_fcos_rr:
	.byte	-126
	.byte	120
	.byte	0
	.globl	op_fsin_ii
	.align 4
	.type	op_fsin_ii, @object
	.size	op_fsin_ii, 5
op_fsin_ii:
	.byte	-127
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_fsin_ir
	.align 4
	.type	op_fsin_ir, @object
	.size	op_fsin_ir, 4
op_fsin_ir:
	.byte	-128
	.byte	120
	.byte	1
	.byte	0
	.globl	op_fsin_ri
	.align 4
	.type	op_fsin_ri, @object
	.size	op_fsin_ri, 4
op_fsin_ri:
	.byte	127
	.byte	120
	.byte	2
	.byte	0
	.globl	op_fsin_rr
	.type	op_fsin_rr, @object
	.size	op_fsin_rr, 3
op_fsin_rr:
	.byte	126
	.byte	120
	.byte	0
	.globl	op_fsqrt_ii
	.align 4
	.type	op_fsqrt_ii, @object
	.size	op_fsqrt_ii, 5
op_fsqrt_ii:
	.byte	125
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_fsqrt_ir
	.align 4
	.type	op_fsqrt_ir, @object
	.size	op_fsqrt_ir, 4
op_fsqrt_ir:
	.byte	124
	.byte	120
	.byte	1
	.byte	0
	.globl	op_fsqrt_ri
	.align 4
	.type	op_fsqrt_ri, @object
	.size	op_fsqrt_ri, 4
op_fsqrt_ri:
	.byte	123
	.byte	120
	.byte	2
	.byte	0
	.globl	op_fsqrt_rr
	.type	op_fsqrt_rr, @object
	.size	op_fsqrt_rr, 3
op_fsqrt_rr:
	.byte	122
	.byte	120
	.byte	0
	.globl	op_fmod_ii
	.align 4
	.type	op_fmod_ii, @object
	.size	op_fmod_ii, 5
op_fmod_ii:
	.byte	121
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_fmod_ir
	.align 4
	.type	op_fmod_ir, @object
	.size	op_fmod_ir, 4
op_fmod_ir:
	.byte	120
	.byte	120
	.byte	1
	.byte	0
	.globl	op_fmod_ri
	.align 4
	.type	op_fmod_ri, @object
	.size	op_fmod_ri, 4
op_fmod_ri:
	.byte	119
	.byte	120
	.byte	2
	.byte	0
	.globl	op_fmod_rr
	.type	op_fmod_rr, @object
	.size	op_fmod_rr, 3
op_fmod_rr:
	.byte	118
	.byte	120
	.byte	0
	.globl	op_fdiv_ii
	.align 4
	.type	op_fdiv_ii, @object
	.size	op_fdiv_ii, 5
op_fdiv_ii:
	.byte	117
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_fdiv_ir
	.align 4
	.type	op_fdiv_ir, @object
	.size	op_fdiv_ir, 4
op_fdiv_ir:
	.byte	116
	.byte	120
	.byte	1
	.byte	0
	.globl	op_fdiv_ri
	.align 4
	.type	op_fdiv_ri, @object
	.size	op_fdiv_ri, 4
op_fdiv_ri:
	.byte	115
	.byte	120
	.byte	2
	.byte	0
	.globl	op_fdiv_rr
	.type	op_fdiv_rr, @object
	.size	op_fdiv_rr, 3
op_fdiv_rr:
	.byte	114
	.byte	120
	.byte	0
	.globl	op_fmul_ii
	.align 4
	.type	op_fmul_ii, @object
	.size	op_fmul_ii, 5
op_fmul_ii:
	.byte	113
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_fmul_ir
	.align 4
	.type	op_fmul_ir, @object
	.size	op_fmul_ir, 4
op_fmul_ir:
	.byte	112
	.byte	120
	.byte	1
	.byte	0
	.globl	op_fmul_ri
	.align 4
	.type	op_fmul_ri, @object
	.size	op_fmul_ri, 4
op_fmul_ri:
	.byte	111
	.byte	120
	.byte	2
	.byte	0
	.globl	op_fmul_rr
	.type	op_fmul_rr, @object
	.size	op_fmul_rr, 3
op_fmul_rr:
	.byte	110
	.byte	120
	.byte	0
	.globl	op_fsub_ii
	.align 4
	.type	op_fsub_ii, @object
	.size	op_fsub_ii, 5
op_fsub_ii:
	.byte	109
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_fsub_ir
	.align 4
	.type	op_fsub_ir, @object
	.size	op_fsub_ir, 4
op_fsub_ir:
	.byte	108
	.byte	120
	.byte	1
	.byte	0
	.globl	op_fsub_ri
	.align 4
	.type	op_fsub_ri, @object
	.size	op_fsub_ri, 4
op_fsub_ri:
	.byte	107
	.byte	120
	.byte	2
	.byte	0
	.globl	op_fsub_rr
	.type	op_fsub_rr, @object
	.size	op_fsub_rr, 3
op_fsub_rr:
	.byte	106
	.byte	120
	.byte	0
	.globl	op_fadd_ii
	.align 4
	.type	op_fadd_ii, @object
	.size	op_fadd_ii, 5
op_fadd_ii:
	.byte	105
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_fadd_ir
	.align 4
	.type	op_fadd_ir, @object
	.size	op_fadd_ir, 4
op_fadd_ir:
	.byte	104
	.byte	120
	.byte	1
	.byte	0
	.globl	op_fadd_ri
	.align 4
	.type	op_fadd_ri, @object
	.size	op_fadd_ri, 4
op_fadd_ri:
	.byte	103
	.byte	120
	.byte	2
	.byte	0
	.globl	op_fadd_rr
	.type	op_fadd_rr, @object
	.size	op_fadd_rr, 3
op_fadd_rr:
	.byte	102
	.byte	120
	.byte	0
	.globl	op_fneg_ii
	.align 4
	.type	op_fneg_ii, @object
	.size	op_fneg_ii, 5
op_fneg_ii:
	.byte	101
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_fneg_ir
	.align 4
	.type	op_fneg_ir, @object
	.size	op_fneg_ir, 4
op_fneg_ir:
	.byte	100
	.byte	120
	.byte	1
	.byte	0
	.globl	op_fneg_ri
	.align 4
	.type	op_fneg_ri, @object
	.size	op_fneg_ri, 4
op_fneg_ri:
	.byte	99
	.byte	120
	.byte	2
	.byte	0
	.globl	op_fneg_rr
	.type	op_fneg_rr, @object
	.size	op_fneg_rr, 3
op_fneg_rr:
	.byte	98
	.byte	120
	.byte	0
	.globl	op_mod_ii
	.align 4
	.type	op_mod_ii, @object
	.size	op_mod_ii, 5
op_mod_ii:
	.byte	97
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_mod_ir
	.align 4
	.type	op_mod_ir, @object
	.size	op_mod_ir, 4
op_mod_ir:
	.byte	96
	.byte	120
	.byte	1
	.byte	0
	.globl	op_mod_ri
	.align 4
	.type	op_mod_ri, @object
	.size	op_mod_ri, 4
op_mod_ri:
	.byte	95
	.byte	120
	.byte	2
	.byte	0
	.globl	op_mod_rr
	.type	op_mod_rr, @object
	.size	op_mod_rr, 3
op_mod_rr:
	.byte	94
	.byte	120
	.byte	0
	.globl	op_mod_li
	.align 4
	.type	op_mod_li, @object
	.size	op_mod_li, 4
op_mod_li:
	.byte	93
	.byte	56
	.byte	2
	.byte	0
	.globl	op_mod_lr
	.type	op_mod_lr, @object
	.size	op_mod_lr, 3
op_mod_lr:
	.byte	92
	.byte	56
	.byte	0
	.globl	op_div_ii
	.align 4
	.type	op_div_ii, @object
	.size	op_div_ii, 5
op_div_ii:
	.byte	91
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_div_ir
	.align 4
	.type	op_div_ir, @object
	.size	op_div_ir, 4
op_div_ir:
	.byte	90
	.byte	120
	.byte	1
	.byte	0
	.globl	op_div_ri
	.align 4
	.type	op_div_ri, @object
	.size	op_div_ri, 4
op_div_ri:
	.byte	89
	.byte	120
	.byte	2
	.byte	0
	.globl	op_div_rr
	.type	op_div_rr, @object
	.size	op_div_rr, 3
op_div_rr:
	.byte	88
	.byte	120
	.byte	0
	.globl	op_div_li
	.align 4
	.type	op_div_li, @object
	.size	op_div_li, 4
op_div_li:
	.byte	87
	.byte	56
	.byte	2
	.byte	0
	.globl	op_div_lr
	.type	op_div_lr, @object
	.size	op_div_lr, 3
op_div_lr:
	.byte	86
	.byte	56
	.byte	0
	.globl	op_mul_ii
	.align 4
	.type	op_mul_ii, @object
	.size	op_mul_ii, 5
op_mul_ii:
	.byte	85
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_mul_ir
	.align 4
	.type	op_mul_ir, @object
	.size	op_mul_ir, 4
op_mul_ir:
	.byte	84
	.byte	120
	.byte	1
	.byte	0
	.globl	op_mul_ri
	.align 4
	.type	op_mul_ri, @object
	.size	op_mul_ri, 4
op_mul_ri:
	.byte	83
	.byte	120
	.byte	2
	.byte	0
	.globl	op_mul_rr
	.type	op_mul_rr, @object
	.size	op_mul_rr, 3
op_mul_rr:
	.byte	82
	.byte	120
	.byte	0
	.globl	op_mul_li
	.align 4
	.type	op_mul_li, @object
	.size	op_mul_li, 4
op_mul_li:
	.byte	81
	.byte	56
	.byte	2
	.byte	0
	.globl	op_mul_lr
	.type	op_mul_lr, @object
	.size	op_mul_lr, 3
op_mul_lr:
	.byte	80
	.byte	56
	.byte	0
	.globl	op_sub_ii
	.align 4
	.type	op_sub_ii, @object
	.size	op_sub_ii, 5
op_sub_ii:
	.byte	79
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_sub_ir
	.align 4
	.type	op_sub_ir, @object
	.size	op_sub_ir, 4
op_sub_ir:
	.byte	78
	.byte	120
	.byte	1
	.byte	0
	.globl	op_sub_ri
	.align 4
	.type	op_sub_ri, @object
	.size	op_sub_ri, 4
op_sub_ri:
	.byte	77
	.byte	120
	.byte	2
	.byte	0
	.globl	op_sub_rr
	.type	op_sub_rr, @object
	.size	op_sub_rr, 3
op_sub_rr:
	.byte	76
	.byte	120
	.byte	0
	.globl	op_sub_li
	.align 4
	.type	op_sub_li, @object
	.size	op_sub_li, 4
op_sub_li:
	.byte	75
	.byte	56
	.byte	2
	.byte	0
	.globl	op_sub_lr
	.type	op_sub_lr, @object
	.size	op_sub_lr, 3
op_sub_lr:
	.byte	74
	.byte	56
	.byte	0
	.globl	op_add_ii
	.align 4
	.type	op_add_ii, @object
	.size	op_add_ii, 5
op_add_ii:
	.byte	73
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_add_ir
	.align 4
	.type	op_add_ir, @object
	.size	op_add_ir, 4
op_add_ir:
	.byte	72
	.byte	120
	.byte	1
	.byte	0
	.globl	op_add_ri
	.align 4
	.type	op_add_ri, @object
	.size	op_add_ri, 4
op_add_ri:
	.byte	71
	.byte	120
	.byte	2
	.byte	0
	.globl	op_add_rr
	.type	op_add_rr, @object
	.size	op_add_rr, 3
op_add_rr:
	.byte	70
	.byte	120
	.byte	0
	.globl	op_add_li
	.align 4
	.type	op_add_li, @object
	.size	op_add_li, 4
op_add_li:
	.byte	69
	.byte	56
	.byte	2
	.byte	0
	.globl	op_add_lr
	.type	op_add_lr, @object
	.size	op_add_lr, 3
op_add_lr:
	.byte	68
	.byte	56
	.byte	0
	.globl	op_neg_ii
	.align 4
	.type	op_neg_ii, @object
	.size	op_neg_ii, 5
op_neg_ii:
	.byte	67
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_neg_ir
	.align 4
	.type	op_neg_ir, @object
	.size	op_neg_ir, 4
op_neg_ir:
	.byte	66
	.byte	120
	.byte	1
	.byte	0
	.globl	op_neg_ri
	.align 4
	.type	op_neg_ri, @object
	.size	op_neg_ri, 4
op_neg_ri:
	.byte	65
	.byte	120
	.byte	2
	.byte	0
	.globl	op_neg_rr
	.type	op_neg_rr, @object
	.size	op_neg_rr, 3
op_neg_rr:
	.byte	64
	.byte	120
	.byte	0
	.globl	op_vmve_ai
	.align 4
	.type	op_vmve_ai, @object
	.size	op_vmve_ai, 4
op_vmve_ai:
	.byte	63
	.byte	8
	.byte	2
	.byte	0
	.globl	op_vmve_ia
	.align 4
	.type	op_vmve_ia, @object
	.size	op_vmve_ia, 4
op_vmve_ia:
	.byte	62
	.byte	112
	.byte	1
	.byte	0
	.globl	op_vmve_ii
	.align 4
	.type	op_vmve_ii, @object
	.size	op_vmve_ii, 5
op_vmve_ii:
	.byte	61
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vspl_ia
	.align 4
	.type	op_vspl_ia, @object
	.size	op_vspl_ia, 4
op_vspl_ia:
	.byte	60
	.byte	112
	.byte	1
	.byte	0
	.globl	op_vspl_ra
	.type	op_vspl_ra, @object
	.size	op_vspl_ra, 3
op_vspl_ra:
	.byte	59
	.byte	112
	.byte	0
	.globl	op_vspl_la
	.type	op_vspl_la, @object
	.size	op_vspl_la, 3
op_vspl_la:
	.byte	58
	.byte	48
	.byte	0
	.globl	op_vspl_ii
	.align 4
	.type	op_vspl_ii, @object
	.size	op_vspl_ii, 5
op_vspl_ii:
	.byte	57
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_vspl_ri
	.align 4
	.type	op_vspl_ri, @object
	.size	op_vspl_ri, 4
op_vspl_ri:
	.byte	56
	.byte	120
	.byte	2
	.byte	0
	.globl	op_vspl_li
	.align 4
	.type	op_vspl_li, @object
	.size	op_vspl_li, 4
op_vspl_li:
	.byte	55
	.byte	56
	.byte	2
	.byte	0
	.globl	op_fsf
	.align 4
	.type	op_fsf, @object
	.size	op_fsf, 4
op_fsf:
	.byte	54
	.byte	8
	.byte	-16
	.byte	0
	.globl	op_asf
	.align 4
	.type	op_asf, @object
	.size	op_asf, 4
op_asf:
	.byte	53
	.byte	8
	.byte	-16
	.byte	0
	.globl	op_popr
	.type	op_popr, @object
	.size	op_popr, 3
op_popr:
	.byte	52
	.byte	120
	.byte	0
	.globl	op_pushr
	.type	op_pushr, @object
	.size	op_pushr, 3
op_pushr:
	.byte	51
	.byte	120
	.byte	0
	.globl	op_move_mi
	.align 4
	.type	op_move_mi, @object
	.size	op_move_mi, 4
op_move_mi:
	.byte	50
	.byte	8
	.byte	2
	.byte	0
	.globl	op_move_mr
	.type	op_move_mr, @object
	.size	op_move_mr, 3
op_move_mr:
	.byte	49
	.byte	8
	.byte	0
	.globl	op_move_ii
	.align 4
	.type	op_move_ii, @object
	.size	op_move_ii, 5
op_move_ii:
	.byte	48
	.byte	120
	.byte	1
	.byte	2
	.byte	0
	.globl	op_move_ir
	.align 4
	.type	op_move_ir, @object
	.size	op_move_ir, 4
op_move_ir:
	.byte	47
	.byte	120
	.byte	1
	.byte	0
	.globl	op_move_ri
	.align 4
	.type	op_move_ri, @object
	.size	op_move_ri, 4
op_move_ri:
	.byte	46
	.byte	120
	.byte	2
	.byte	0
	.globl	op_move_rr
	.type	op_move_rr, @object
	.size	op_move_rr, 3
op_move_rr:
	.byte	45
	.byte	120
	.byte	0
	.globl	op_move_li
	.align 4
	.type	op_move_li, @object
	.size	op_move_li, 4
op_move_li:
	.byte	44
	.byte	56
	.byte	2
	.byte	0
	.globl	op_move_lr
	.type	op_move_lr, @object
	.size	op_move_lr, 3
op_move_lr:
	.byte	43
	.byte	56
	.byte	0
	.globl	op_vbne_ia
	.align 4
	.type	op_vbne_ia, @object
	.size	op_vbne_ia, 6
op_vbne_ia:
	.byte	41
	.byte	112
	.byte	1
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_vbne_ii
	.align 4
	.type	op_vbne_ii, @object
	.size	op_vbne_ii, 7
op_vbne_ii:
	.byte	41
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_vbeq_ia
	.align 4
	.type	op_vbeq_ia, @object
	.size	op_vbeq_ia, 6
op_vbeq_ia:
	.byte	40
	.byte	112
	.byte	1
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_vbeq_ii
	.align 4
	.type	op_vbeq_ii, @object
	.size	op_vbeq_ii, 7
op_vbeq_ii:
	.byte	39
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbgt_ii
	.align 4
	.type	op_fbgt_ii, @object
	.size	op_fbgt_ii, 7
op_fbgt_ii:
	.byte	38
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbgt_ir
	.align 4
	.type	op_fbgt_ir, @object
	.size	op_fbgt_ir, 6
op_fbgt_ir:
	.byte	37
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbgt_ri
	.align 4
	.type	op_fbgt_ri, @object
	.size	op_fbgt_ri, 6
op_fbgt_ri:
	.byte	36
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbgt_rr
	.align 4
	.type	op_fbgt_rr, @object
	.size	op_fbgt_rr, 5
op_fbgt_rr:
	.byte	35
	.byte	120
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbge_ii
	.align 4
	.type	op_fbge_ii, @object
	.size	op_fbge_ii, 7
op_fbge_ii:
	.byte	34
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbge_ir
	.align 4
	.type	op_fbge_ir, @object
	.size	op_fbge_ir, 6
op_fbge_ir:
	.byte	33
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbge_ri
	.align 4
	.type	op_fbge_ri, @object
	.size	op_fbge_ri, 6
op_fbge_ri:
	.byte	32
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbge_rr
	.align 4
	.type	op_fbge_rr, @object
	.size	op_fbge_rr, 5
op_fbge_rr:
	.byte	31
	.byte	120
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbeq_ii
	.align 4
	.type	op_fbeq_ii, @object
	.size	op_fbeq_ii, 7
op_fbeq_ii:
	.byte	34
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbeq_ri
	.align 4
	.type	op_fbeq_ri, @object
	.size	op_fbeq_ri, 6
op_fbeq_ri:
	.byte	32
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_fbeq_rr
	.align 4
	.type	op_fbeq_rr, @object
	.size	op_fbeq_rr, 5
op_fbeq_rr:
	.byte	31
	.byte	120
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bgt_ii
	.align 4
	.type	op_bgt_ii, @object
	.size	op_bgt_ii, 7
op_bgt_ii:
	.byte	27
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bgt_ir
	.align 4
	.type	op_bgt_ir, @object
	.size	op_bgt_ir, 6
op_bgt_ir:
	.byte	26
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bgt_ri
	.align 4
	.type	op_bgt_ri, @object
	.size	op_bgt_ri, 6
op_bgt_ri:
	.byte	25
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bgt_rr
	.align 4
	.type	op_bgt_rr, @object
	.size	op_bgt_rr, 5
op_bgt_rr:
	.byte	24
	.byte	120
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bge_ii
	.align 4
	.type	op_bge_ii, @object
	.size	op_bge_ii, 7
op_bge_ii:
	.byte	23
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bge_ir
	.align 4
	.type	op_bge_ir, @object
	.size	op_bge_ir, 6
op_bge_ir:
	.byte	22
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bge_ri
	.align 4
	.type	op_bge_ri, @object
	.size	op_bge_ri, 6
op_bge_ri:
	.byte	21
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bge_rr
	.align 4
	.type	op_bge_rr, @object
	.size	op_bge_rr, 5
op_bge_rr:
	.byte	20
	.byte	120
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_beq_ii
	.align 4
	.type	op_beq_ii, @object
	.size	op_beq_ii, 7
op_beq_ii:
	.byte	19
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_beq_ri
	.align 4
	.type	op_beq_ri, @object
	.size	op_beq_ri, 6
op_beq_ri:
	.byte	18
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_beq_rr
	.align 4
	.type	op_beq_rr, @object
	.size	op_beq_rr, 5
op_beq_rr:
	.byte	17
	.byte	120
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bnz_i
	.align 4
	.type	op_bnz_i, @object
	.size	op_bnz_i, 6
op_bnz_i:
	.byte	16
	.byte	7
	.byte	1
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bnz_r
	.align 4
	.type	op_bnz_r, @object
	.size	op_bnz_r, 5
op_bnz_r:
	.byte	15
	.byte	7
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bez_i
	.align 4
	.type	op_bez_i, @object
	.size	op_bez_i, 6
op_bez_i:
	.byte	14
	.byte	7
	.byte	1
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bez_r
	.align 4
	.type	op_bez_r, @object
	.size	op_bez_r, 5
op_bez_r:
	.byte	13
	.byte	7
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_ldbnn
	.align 4
	.type	op_ldbnn, @object
	.size	op_ldbnn, 6
op_ldbnn:
	.byte	12
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_dbnz
	.align 4
	.type	op_dbnz, @object
	.size	op_dbnz, 5
op_dbnz:
	.byte	11
	.byte	7
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_ret
	.type	op_ret, @object
	.size	op_ret, 2
op_ret:
	.byte	10
	.byte	0
	.globl	op_call_h
	.align 4
	.type	op_call_h, @object
	.size	op_call_h, 4
op_call_h:
	.byte	9
	.byte	-1
	.byte	-1
	.byte	0
	.globl	op_call_i
	.align 4
	.type	op_call_i, @object
	.size	op_call_i, 4
op_call_i:
	.byte	8
	.byte	112
	.byte	1
	.byte	0
	.globl	op_call_r
	.type	op_call_r, @object
	.size	op_call_r, 3
op_call_r:
	.byte	7
	.byte	112
	.byte	0
	.globl	op_call
	.align 4
	.type	op_call, @object
	.size	op_call, 4
op_call:
	.byte	6
	.byte	-1
	.byte	-1
	.byte	0
	.globl	op_bcall
	.align 4
	.type	op_bcall, @object
	.size	op_bcall, 4
op_bcall:
	.byte	5
	.byte	-1
	.byte	-1
	.byte	0
	.globl	op_tjmp
	.type	op_tjmp, @object
	.size	op_tjmp, 2
op_tjmp:
	.byte	4
	.byte	0
	.globl	op_tjmps
	.type	op_tjmps, @object
	.size	op_tjmps, 2
op_tjmps:
	.byte	3
	.byte	0
	.globl	op_bra
	.align 4
	.type	op_bra, @object
	.size	op_bra, 4
op_bra:
	.byte	2
	.byte	-1
	.byte	-2
	.byte	0
	.globl	op_bras
	.type	op_bras, @object
	.size	op_bras, 3
op_bras:
	.byte	1
	.byte	-2
	.byte	0
	.globl	op_nop
	.bss
	.type	op_nop, @object
	.size	op_nop, 2
op_nop:
	.zero	2
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
