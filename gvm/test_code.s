	.file	"test_code.cpp"
	.globl	op_vmve_ai
	.data
	.type	op_vmve_ai, @object
	.size	op_vmve_ai, 3
op_vmve_ai:
	.byte	63
	.byte	8
	.byte	2
	.globl	op_vmve_ia
	.type	op_vmve_ia, @object
	.size	op_vmve_ia, 3
op_vmve_ia:
	.byte	62
	.byte	112
	.byte	1
	.globl	op_vmve_ii
	.align 4
	.type	op_vmve_ii, @object
	.size	op_vmve_ii, 4
op_vmve_ii:
	.byte	61
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vspl_ia
	.type	op_vspl_ia, @object
	.size	op_vspl_ia, 3
op_vspl_ia:
	.byte	60
	.byte	112
	.byte	1
	.globl	op_vspl_ra
	.type	op_vspl_ra, @object
	.size	op_vspl_ra, 2
op_vspl_ra:
	.byte	59
	.byte	112
	.globl	op_vspl_la
	.type	op_vspl_la, @object
	.size	op_vspl_la, 2
op_vspl_la:
	.byte	58
	.byte	48
	.globl	op_vspl_ii
	.align 4
	.type	op_vspl_ii, @object
	.size	op_vspl_ii, 4
op_vspl_ii:
	.byte	57
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vspl_ri
	.type	op_vspl_ri, @object
	.size	op_vspl_ri, 3
op_vspl_ri:
	.byte	56
	.byte	120
	.byte	2
	.globl	op_vspl_li
	.type	op_vspl_li, @object
	.size	op_vspl_li, 3
op_vspl_li:
	.byte	55
	.byte	56
	.byte	2
	.globl	op_fsf
	.type	op_fsf, @object
	.size	op_fsf, 3
op_fsf:
	.byte	54
	.byte	8
	.byte	-16
	.globl	op_asf
	.type	op_asf, @object
	.size	op_asf, 3
op_asf:
	.byte	53
	.byte	8
	.byte	-16
	.globl	op_popr
	.type	op_popr, @object
	.size	op_popr, 2
op_popr:
	.byte	52
	.byte	120
	.globl	op_pushr
	.type	op_pushr, @object
	.size	op_pushr, 2
op_pushr:
	.byte	51
	.byte	120
	.globl	op_move_mi
	.type	op_move_mi, @object
	.size	op_move_mi, 3
op_move_mi:
	.byte	50
	.byte	8
	.byte	2
	.globl	op_move_mr
	.type	op_move_mr, @object
	.size	op_move_mr, 2
op_move_mr:
	.byte	49
	.byte	8
	.globl	op_move_ii
	.align 4
	.type	op_move_ii, @object
	.size	op_move_ii, 4
op_move_ii:
	.byte	48
	.byte	120
	.byte	1
	.byte	2
	.globl	op_move_ir
	.type	op_move_ir, @object
	.size	op_move_ir, 3
op_move_ir:
	.byte	47
	.byte	120
	.byte	1
	.globl	op_move_ri
	.type	op_move_ri, @object
	.size	op_move_ri, 3
op_move_ri:
	.byte	46
	.byte	120
	.byte	2
	.globl	op_move_rr
	.type	op_move_rr, @object
	.size	op_move_rr, 2
op_move_rr:
	.byte	45
	.byte	120
	.globl	op_move_li
	.type	op_move_li, @object
	.size	op_move_li, 3
op_move_li:
	.byte	44
	.byte	56
	.byte	2
	.globl	op_move_lr
	.type	op_move_lr, @object
	.size	op_move_lr, 2
op_move_lr:
	.byte	43
	.byte	56
	.globl	op_vbne_ia
	.align 4
	.type	op_vbne_ia, @object
	.size	op_vbne_ia, 5
op_vbne_ia:
	.byte	41
	.byte	112
	.byte	1
	.byte	-1
	.byte	-2
	.globl	op_vbne_ii
	.align 4
	.type	op_vbne_ii, @object
	.size	op_vbne_ii, 6
op_vbne_ii:
	.byte	41
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_vbeq_ia
	.align 4
	.type	op_vbeq_ia, @object
	.size	op_vbeq_ia, 5
op_vbeq_ia:
	.byte	40
	.byte	112
	.byte	1
	.byte	-1
	.byte	-2
	.globl	op_vbeq_ii
	.align 4
	.type	op_vbeq_ii, @object
	.size	op_vbeq_ii, 6
op_vbeq_ii:
	.byte	39
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_fbgt_ii
	.align 4
	.type	op_fbgt_ii, @object
	.size	op_fbgt_ii, 6
op_fbgt_ii:
	.byte	38
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_fbgt_ir
	.align 4
	.type	op_fbgt_ir, @object
	.size	op_fbgt_ir, 5
op_fbgt_ir:
	.byte	37
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	op_fbgt_ri
	.align 4
	.type	op_fbgt_ri, @object
	.size	op_fbgt_ri, 5
op_fbgt_ri:
	.byte	36
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_fbgt_rr
	.align 4
	.type	op_fbgt_rr, @object
	.size	op_fbgt_rr, 4
op_fbgt_rr:
	.byte	35
	.byte	120
	.byte	-1
	.byte	-2
	.globl	op_fbge_ii
	.align 4
	.type	op_fbge_ii, @object
	.size	op_fbge_ii, 6
op_fbge_ii:
	.byte	34
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_fbge_ir
	.align 4
	.type	op_fbge_ir, @object
	.size	op_fbge_ir, 5
op_fbge_ir:
	.byte	33
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	op_fbge_ri
	.align 4
	.type	op_fbge_ri, @object
	.size	op_fbge_ri, 5
op_fbge_ri:
	.byte	32
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_fbge_rr
	.align 4
	.type	op_fbge_rr, @object
	.size	op_fbge_rr, 4
op_fbge_rr:
	.byte	31
	.byte	120
	.byte	-1
	.byte	-2
	.globl	op_fbeq_ii
	.align 4
	.type	op_fbeq_ii, @object
	.size	op_fbeq_ii, 6
op_fbeq_ii:
	.byte	34
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_fbeq_ri
	.align 4
	.type	op_fbeq_ri, @object
	.size	op_fbeq_ri, 5
op_fbeq_ri:
	.byte	32
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_fbeq_rr
	.align 4
	.type	op_fbeq_rr, @object
	.size	op_fbeq_rr, 4
op_fbeq_rr:
	.byte	31
	.byte	120
	.byte	-1
	.byte	-2
	.globl	op_bgt_ii
	.align 4
	.type	op_bgt_ii, @object
	.size	op_bgt_ii, 6
op_bgt_ii:
	.byte	27
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_bgt_ir
	.align 4
	.type	op_bgt_ir, @object
	.size	op_bgt_ir, 5
op_bgt_ir:
	.byte	26
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	op_bgt_ri
	.align 4
	.type	op_bgt_ri, @object
	.size	op_bgt_ri, 5
op_bgt_ri:
	.byte	25
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_bgt_rr
	.align 4
	.type	op_bgt_rr, @object
	.size	op_bgt_rr, 4
op_bgt_rr:
	.byte	24
	.byte	120
	.byte	-1
	.byte	-2
	.globl	op_bge_ii
	.align 4
	.type	op_bge_ii, @object
	.size	op_bge_ii, 6
op_bge_ii:
	.byte	23
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_bge_ir
	.align 4
	.type	op_bge_ir, @object
	.size	op_bge_ir, 5
op_bge_ir:
	.byte	22
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	op_bge_ri
	.align 4
	.type	op_bge_ri, @object
	.size	op_bge_ri, 5
op_bge_ri:
	.byte	21
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_bge_rr
	.align 4
	.type	op_bge_rr, @object
	.size	op_bge_rr, 4
op_bge_rr:
	.byte	20
	.byte	120
	.byte	-1
	.byte	-2
	.globl	op_beq_ii
	.align 4
	.type	op_beq_ii, @object
	.size	op_beq_ii, 6
op_beq_ii:
	.byte	19
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_beq_ri
	.align 4
	.type	op_beq_ri, @object
	.size	op_beq_ri, 5
op_beq_ri:
	.byte	18
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_beq_rr
	.align 4
	.type	op_beq_rr, @object
	.size	op_beq_rr, 4
op_beq_rr:
	.byte	17
	.byte	120
	.byte	-1
	.byte	-2
	.globl	op_bnz_i
	.align 4
	.type	op_bnz_i, @object
	.size	op_bnz_i, 5
op_bnz_i:
	.byte	16
	.byte	7
	.byte	1
	.byte	-1
	.byte	-2
	.globl	op_bnz_r
	.align 4
	.type	op_bnz_r, @object
	.size	op_bnz_r, 4
op_bnz_r:
	.byte	15
	.byte	7
	.byte	-1
	.byte	-2
	.globl	op_bez_i
	.align 4
	.type	op_bez_i, @object
	.size	op_bez_i, 5
op_bez_i:
	.byte	14
	.byte	7
	.byte	1
	.byte	-1
	.byte	-2
	.globl	op_bez_r
	.align 4
	.type	op_bez_r, @object
	.size	op_bez_r, 4
op_bez_r:
	.byte	13
	.byte	7
	.byte	-1
	.byte	-2
	.globl	op_ldbnn
	.align 4
	.type	op_ldbnn, @object
	.size	op_ldbnn, 5
op_ldbnn:
	.byte	12
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	op_dbnz
	.align 4
	.type	op_dbnz, @object
	.size	op_dbnz, 4
op_dbnz:
	.byte	11
	.byte	7
	.byte	-1
	.byte	-2
	.globl	op_ret
	.type	op_ret, @object
	.size	op_ret, 1
op_ret:
	.byte	10
	.globl	op_call_h
	.type	op_call_h, @object
	.size	op_call_h, 3
op_call_h:
	.byte	9
	.byte	-1
	.byte	-1
	.globl	op_call_i
	.type	op_call_i, @object
	.size	op_call_i, 3
op_call_i:
	.byte	8
	.byte	112
	.byte	1
	.globl	op_call_r
	.type	op_call_r, @object
	.size	op_call_r, 2
op_call_r:
	.byte	7
	.byte	112
	.globl	op_call
	.type	op_call, @object
	.size	op_call, 3
op_call:
	.byte	6
	.byte	-1
	.byte	-1
	.globl	op_bcall
	.type	op_bcall, @object
	.size	op_bcall, 3
op_bcall:
	.byte	5
	.byte	-1
	.byte	-1
	.globl	op_bra
	.type	op_bra, @object
	.size	op_bra, 3
op_bra:
	.byte	2
	.byte	-1
	.byte	-2
	.globl	op_bras
	.type	op_bras, @object
	.size	op_bras, 2
op_bras:
	.byte	1
	.byte	-2
	.globl	op_nop
	.bss
	.type	op_nop, @object
	.size	op_nop, 1
op_nop:
	.zero	1
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
