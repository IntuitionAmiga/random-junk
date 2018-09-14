	.file	"test_code.cpp"
	.globl	inst_vmve_ai
	.data
	.type	inst_vmve_ai, @object
	.size	inst_vmve_ai, 3
inst_vmve_ai:
	.byte	63
	.byte	8
	.byte	2
	.globl	inst_vmve_ia
	.type	inst_vmve_ia, @object
	.size	inst_vmve_ia, 3
inst_vmve_ia:
	.byte	62
	.byte	112
	.byte	1
	.globl	inst_vmve_ii
	.align 4
	.type	inst_vmve_ii, @object
	.size	inst_vmve_ii, 4
inst_vmve_ii:
	.byte	61
	.byte	120
	.byte	1
	.byte	2
	.globl	inst_vspl_ia
	.type	inst_vspl_ia, @object
	.size	inst_vspl_ia, 3
inst_vspl_ia:
	.byte	60
	.byte	112
	.byte	1
	.globl	inst_vspl_ra
	.type	inst_vspl_ra, @object
	.size	inst_vspl_ra, 2
inst_vspl_ra:
	.byte	59
	.byte	112
	.globl	inst_vspl_la
	.type	inst_vspl_la, @object
	.size	inst_vspl_la, 2
inst_vspl_la:
	.byte	58
	.byte	48
	.globl	inst_vspl_ii
	.align 4
	.type	inst_vspl_ii, @object
	.size	inst_vspl_ii, 4
inst_vspl_ii:
	.byte	57
	.byte	120
	.byte	1
	.byte	2
	.globl	inst_vspl_ri
	.type	inst_vspl_ri, @object
	.size	inst_vspl_ri, 3
inst_vspl_ri:
	.byte	56
	.byte	120
	.byte	2
	.globl	inst_vspl_li
	.type	inst_vspl_li, @object
	.size	inst_vspl_li, 3
inst_vspl_li:
	.byte	55
	.byte	56
	.byte	2
	.globl	inst_fsf
	.type	inst_fsf, @object
	.size	inst_fsf, 3
inst_fsf:
	.byte	54
	.byte	8
	.byte	-16
	.globl	inst_asf
	.type	inst_asf, @object
	.size	inst_asf, 3
inst_asf:
	.byte	53
	.byte	8
	.byte	-16
	.globl	inst_popr
	.type	inst_popr, @object
	.size	inst_popr, 2
inst_popr:
	.byte	52
	.byte	120
	.globl	inst_pushr
	.type	inst_pushr, @object
	.size	inst_pushr, 2
inst_pushr:
	.byte	51
	.byte	120
	.globl	inst_move_mi
	.type	inst_move_mi, @object
	.size	inst_move_mi, 3
inst_move_mi:
	.byte	50
	.byte	8
	.byte	2
	.globl	inst_move_mr
	.type	inst_move_mr, @object
	.size	inst_move_mr, 2
inst_move_mr:
	.byte	49
	.byte	8
	.globl	inst_move_ii
	.align 4
	.type	inst_move_ii, @object
	.size	inst_move_ii, 4
inst_move_ii:
	.byte	48
	.byte	120
	.byte	1
	.byte	2
	.globl	inst_move_ir
	.type	inst_move_ir, @object
	.size	inst_move_ir, 3
inst_move_ir:
	.byte	47
	.byte	120
	.byte	1
	.globl	inst_move_ri
	.type	inst_move_ri, @object
	.size	inst_move_ri, 3
inst_move_ri:
	.byte	46
	.byte	120
	.byte	2
	.globl	inst_move_rr
	.type	inst_move_rr, @object
	.size	inst_move_rr, 2
inst_move_rr:
	.byte	45
	.byte	120
	.globl	inst_move_li
	.type	inst_move_li, @object
	.size	inst_move_li, 3
inst_move_li:
	.byte	44
	.byte	56
	.byte	2
	.globl	inst_move_lr
	.type	inst_move_lr, @object
	.size	inst_move_lr, 2
inst_move_lr:
	.byte	43
	.byte	56
	.globl	inst_vbne_ia
	.align 4
	.type	inst_vbne_ia, @object
	.size	inst_vbne_ia, 5
inst_vbne_ia:
	.byte	41
	.byte	112
	.byte	1
	.byte	-1
	.byte	-2
	.globl	inst_vbne_ii
	.align 4
	.type	inst_vbne_ii, @object
	.size	inst_vbne_ii, 6
inst_vbne_ii:
	.byte	41
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_vbeq_ia
	.align 4
	.type	inst_vbeq_ia, @object
	.size	inst_vbeq_ia, 5
inst_vbeq_ia:
	.byte	40
	.byte	112
	.byte	1
	.byte	-1
	.byte	-2
	.globl	inst_vbeq_ii
	.align 4
	.type	inst_vbeq_ii, @object
	.size	inst_vbeq_ii, 6
inst_vbeq_ii:
	.byte	39
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_fbgt_ii
	.align 4
	.type	inst_fbgt_ii, @object
	.size	inst_fbgt_ii, 6
inst_fbgt_ii:
	.byte	38
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_fbgt_ir
	.align 4
	.type	inst_fbgt_ir, @object
	.size	inst_fbgt_ir, 5
inst_fbgt_ir:
	.byte	37
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	inst_fbgt_ri
	.align 4
	.type	inst_fbgt_ri, @object
	.size	inst_fbgt_ri, 5
inst_fbgt_ri:
	.byte	36
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_fbgt_rr
	.align 4
	.type	inst_fbgt_rr, @object
	.size	inst_fbgt_rr, 4
inst_fbgt_rr:
	.byte	35
	.byte	120
	.byte	-1
	.byte	-2
	.globl	inst_fbge_ii
	.align 4
	.type	inst_fbge_ii, @object
	.size	inst_fbge_ii, 6
inst_fbge_ii:
	.byte	34
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_fbge_ir
	.align 4
	.type	inst_fbge_ir, @object
	.size	inst_fbge_ir, 5
inst_fbge_ir:
	.byte	33
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	inst_fbge_ri
	.align 4
	.type	inst_fbge_ri, @object
	.size	inst_fbge_ri, 5
inst_fbge_ri:
	.byte	32
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_fbge_rr
	.align 4
	.type	inst_fbge_rr, @object
	.size	inst_fbge_rr, 4
inst_fbge_rr:
	.byte	31
	.byte	120
	.byte	-1
	.byte	-2
	.globl	inst_fbeq_ii
	.align 4
	.type	inst_fbeq_ii, @object
	.size	inst_fbeq_ii, 6
inst_fbeq_ii:
	.byte	34
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_fbeq_ri
	.align 4
	.type	inst_fbeq_ri, @object
	.size	inst_fbeq_ri, 5
inst_fbeq_ri:
	.byte	32
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_fbeq_rr
	.align 4
	.type	inst_fbeq_rr, @object
	.size	inst_fbeq_rr, 4
inst_fbeq_rr:
	.byte	31
	.byte	120
	.byte	-1
	.byte	-2
	.globl	inst_bgt_ii
	.align 4
	.type	inst_bgt_ii, @object
	.size	inst_bgt_ii, 6
inst_bgt_ii:
	.byte	27
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_bgt_ir
	.align 4
	.type	inst_bgt_ir, @object
	.size	inst_bgt_ir, 5
inst_bgt_ir:
	.byte	26
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	inst_bgt_ri
	.align 4
	.type	inst_bgt_ri, @object
	.size	inst_bgt_ri, 5
inst_bgt_ri:
	.byte	25
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_bgt_rr
	.align 4
	.type	inst_bgt_rr, @object
	.size	inst_bgt_rr, 4
inst_bgt_rr:
	.byte	24
	.byte	120
	.byte	-1
	.byte	-2
	.globl	inst_bge_ii
	.align 4
	.type	inst_bge_ii, @object
	.size	inst_bge_ii, 6
inst_bge_ii:
	.byte	23
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_bge_ir
	.align 4
	.type	inst_bge_ir, @object
	.size	inst_bge_ir, 5
inst_bge_ir:
	.byte	22
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	inst_bge_ri
	.align 4
	.type	inst_bge_ri, @object
	.size	inst_bge_ri, 5
inst_bge_ri:
	.byte	21
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_bge_rr
	.align 4
	.type	inst_bge_rr, @object
	.size	inst_bge_rr, 4
inst_bge_rr:
	.byte	20
	.byte	120
	.byte	-1
	.byte	-2
	.globl	inst_beq_ii
	.align 4
	.type	inst_beq_ii, @object
	.size	inst_beq_ii, 6
inst_beq_ii:
	.byte	19
	.byte	120
	.byte	1
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_beq_ri
	.align 4
	.type	inst_beq_ri, @object
	.size	inst_beq_ri, 5
inst_beq_ri:
	.byte	18
	.byte	120
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_beq_rr
	.align 4
	.type	inst_beq_rr, @object
	.size	inst_beq_rr, 4
inst_beq_rr:
	.byte	17
	.byte	120
	.byte	-1
	.byte	-2
	.globl	inst_bnz_i
	.align 4
	.type	inst_bnz_i, @object
	.size	inst_bnz_i, 5
inst_bnz_i:
	.byte	16
	.byte	7
	.byte	1
	.byte	-1
	.byte	-2
	.globl	inst_bnz_r
	.align 4
	.type	inst_bnz_r, @object
	.size	inst_bnz_r, 4
inst_bnz_r:
	.byte	15
	.byte	7
	.byte	-1
	.byte	-2
	.globl	inst_bez_i
	.align 4
	.type	inst_bez_i, @object
	.size	inst_bez_i, 5
inst_bez_i:
	.byte	14
	.byte	7
	.byte	1
	.byte	-1
	.byte	-2
	.globl	inst_bez_r
	.align 4
	.type	inst_bez_r, @object
	.size	inst_bez_r, 4
inst_bez_r:
	.byte	13
	.byte	7
	.byte	-1
	.byte	-2
	.globl	inst_ldbnn
	.align 4
	.type	inst_ldbnn, @object
	.size	inst_ldbnn, 5
inst_ldbnn:
	.byte	12
	.byte	120
	.byte	1
	.byte	-1
	.byte	-2
	.globl	inst_dbnz
	.align 4
	.type	inst_dbnz, @object
	.size	inst_dbnz, 4
inst_dbnz:
	.byte	11
	.byte	7
	.byte	-1
	.byte	-2
	.globl	inst_ret
	.type	inst_ret, @object
	.size	inst_ret, 1
inst_ret:
	.byte	10
	.globl	inst_call_h
	.type	inst_call_h, @object
	.size	inst_call_h, 3
inst_call_h:
	.byte	9
	.byte	-1
	.byte	-1
	.globl	inst_call_i
	.type	inst_call_i, @object
	.size	inst_call_i, 3
inst_call_i:
	.byte	8
	.byte	112
	.byte	1
	.globl	inst_call_r
	.type	inst_call_r, @object
	.size	inst_call_r, 2
inst_call_r:
	.byte	7
	.byte	112
	.globl	inst_call
	.type	inst_call, @object
	.size	inst_call, 3
inst_call:
	.byte	6
	.byte	-1
	.byte	-1
	.globl	inst_bcall
	.type	inst_bcall, @object
	.size	inst_bcall, 3
inst_bcall:
	.byte	5
	.byte	-1
	.byte	-1
	.globl	inst_bra
	.type	inst_bra, @object
	.size	inst_bra, 3
inst_bra:
	.byte	2
	.byte	-1
	.byte	-2
	.globl	inst_bras
	.type	inst_bras, @object
	.size	inst_bras, 2
inst_bras:
	.byte	1
	.byte	-2
	.globl	inst_nop
	.bss
	.type	inst_nop, @object
	.size	inst_nop, 1
inst_nop:
	.zero	1
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
