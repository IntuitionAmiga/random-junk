	.file	"test_code.cpp"
	.globl	op_vnrm_a
	.data
	.type	op_vnrm_a, @object
	.size	op_vnrm_a, 1
op_vnrm_a:
	.byte	-81
	.globl	op_vnrm_ai
	.type	op_vnrm_ai, @object
	.size	op_vnrm_ai, 3
op_vnrm_ai:
	.byte	-82
	.byte	8
	.byte	2
	.globl	op_vnrm_ia
	.type	op_vnrm_ia, @object
	.size	op_vnrm_ia, 3
op_vnrm_ia:
	.byte	-83
	.byte	112
	.byte	1
	.globl	op_vnrm_ii
	.align 4
	.type	op_vnrm_ii, @object
	.size	op_vnrm_ii, 4
op_vnrm_ii:
	.byte	-84
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vnrm_i
	.type	op_vnrm_i, @object
	.size	op_vnrm_i, 3
op_vnrm_i:
	.byte	-85
	.byte	7
	.byte	1
	.globl	op_vmag_m
	.type	op_vmag_m, @object
	.size	op_vmag_m, 1
op_vmag_m:
	.byte	-86
	.globl	op_vmag_ai
	.type	op_vmag_ai, @object
	.size	op_vmag_ai, 3
op_vmag_ai:
	.byte	-87
	.byte	8
	.byte	2
	.globl	op_vmag_ar
	.type	op_vmag_ar, @object
	.size	op_vmag_ar, 2
op_vmag_ar:
	.byte	-88
	.byte	8
	.globl	op_vmag_ii
	.align 4
	.type	op_vmag_ii, @object
	.size	op_vmag_ii, 4
op_vmag_ii:
	.byte	-89
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vmag_ir
	.type	op_vmag_ir, @object
	.size	op_vmag_ir, 3
op_vmag_ir:
	.byte	-90
	.byte	120
	.byte	1
	.globl	op_vdot_aii
	.align 4
	.type	op_vdot_aii, @object
	.size	op_vdot_aii, 4
op_vdot_aii:
	.byte	-91
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vdot_air
	.type	op_vdot_air, @object
	.size	op_vdot_air, 3
op_vdot_air:
	.byte	-92
	.byte	120
	.byte	1
	.globl	op_vdot_iim
	.align 4
	.type	op_vdot_iim, @object
	.size	op_vdot_iim, 4
op_vdot_iim:
	.byte	-93
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vmul_iai
	.align 4
	.type	op_vmul_iai, @object
	.size	op_vmul_iai, 4
op_vmul_iai:
	.byte	-94
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vmul_aii
	.align 4
	.type	op_vmul_aii, @object
	.size	op_vmul_aii, 4
op_vmul_aii:
	.byte	-95
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vmul_iia
	.align 4
	.type	op_vmul_iia, @object
	.size	op_vmul_iia, 4
op_vmul_iia:
	.byte	-96
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vsub_aii
	.align 4
	.type	op_vsub_aii, @object
	.size	op_vsub_aii, 4
op_vsub_aii:
	.byte	-97
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vsub_iai
	.align 4
	.type	op_vsub_iai, @object
	.size	op_vsub_iai, 4
op_vsub_iai:
	.byte	-98
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vsub_iia
	.align 4
	.type	op_vsub_iia, @object
	.size	op_vsub_iia, 4
op_vsub_iia:
	.byte	-99
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vsub_ai
	.type	op_vsub_ai, @object
	.size	op_vsub_ai, 3
op_vsub_ai:
	.byte	-100
	.byte	8
	.byte	2
	.globl	op_vsub_ia
	.type	op_vsub_ia, @object
	.size	op_vsub_ia, 3
op_vsub_ia:
	.byte	-101
	.byte	112
	.byte	1
	.globl	op_vsub_ii
	.align 4
	.type	op_vsub_ii, @object
	.size	op_vsub_ii, 4
op_vsub_ii:
	.byte	-102
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vadd_iai
	.align 4
	.type	op_vadd_iai, @object
	.size	op_vadd_iai, 4
op_vadd_iai:
	.byte	-103
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vadd_iia
	.align 4
	.type	op_vadd_iia, @object
	.size	op_vadd_iia, 4
op_vadd_iia:
	.byte	-104
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vadd_ai
	.type	op_vadd_ai, @object
	.size	op_vadd_ai, 3
op_vadd_ai:
	.byte	-105
	.byte	8
	.byte	2
	.globl	op_vadd_ia
	.type	op_vadd_ia, @object
	.size	op_vadd_ia, 3
op_vadd_ia:
	.byte	-106
	.byte	112
	.byte	1
	.globl	op_vadd_ii
	.align 4
	.type	op_vadd_ii, @object
	.size	op_vadd_ii, 4
op_vadd_ii:
	.byte	-107
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vscl_ma
	.type	op_vscl_ma, @object
	.size	op_vscl_ma, 1
op_vscl_ma:
	.byte	-108
	.globl	op_vscl_ia
	.type	op_vscl_ia, @object
	.size	op_vscl_ia, 3
op_vscl_ia:
	.byte	-109
	.byte	112
	.byte	1
	.globl	op_vscl_ra
	.type	op_vscl_ra, @object
	.size	op_vscl_ra, 2
op_vscl_ra:
	.byte	-110
	.byte	112
	.globl	op_vscl_mi
	.type	op_vscl_mi, @object
	.size	op_vscl_mi, 3
op_vscl_mi:
	.byte	-111
	.byte	8
	.byte	2
	.globl	op_vscl_ii
	.align 4
	.type	op_vscl_ii, @object
	.size	op_vscl_ii, 4
op_vscl_ii:
	.byte	-112
	.byte	120
	.byte	1
	.byte	2
	.globl	op_vscl_ri
	.type	op_vscl_ri, @object
	.size	op_vscl_ri, 3
op_vscl_ri:
	.byte	-113
	.byte	120
	.byte	2
	.globl	op_ftan_ii
	.align 4
	.type	op_ftan_ii, @object
	.size	op_ftan_ii, 4
op_ftan_ii:
	.byte	-119
	.byte	120
	.byte	1
	.byte	2
	.globl	op_ftan_ir
	.type	op_ftan_ir, @object
	.size	op_ftan_ir, 3
op_ftan_ir:
	.byte	-120
	.byte	120
	.byte	1
	.globl	op_ftan_ri
	.type	op_ftan_ri, @object
	.size	op_ftan_ri, 3
op_ftan_ri:
	.byte	-121
	.byte	120
	.byte	2
	.globl	op_ftan_rr
	.type	op_ftan_rr, @object
	.size	op_ftan_rr, 2
op_ftan_rr:
	.byte	-122
	.byte	120
	.globl	op_fcos_ii
	.align 4
	.type	op_fcos_ii, @object
	.size	op_fcos_ii, 4
op_fcos_ii:
	.byte	-123
	.byte	120
	.byte	1
	.byte	2
	.globl	op_fcos_ir
	.type	op_fcos_ir, @object
	.size	op_fcos_ir, 3
op_fcos_ir:
	.byte	-124
	.byte	120
	.byte	1
	.globl	op_fcos_ri
	.type	op_fcos_ri, @object
	.size	op_fcos_ri, 3
op_fcos_ri:
	.byte	-125
	.byte	120
	.byte	2
	.globl	op_fcos_rr
	.type	op_fcos_rr, @object
	.size	op_fcos_rr, 2
op_fcos_rr:
	.byte	-126
	.byte	120
	.globl	op_fsin_ii
	.align 4
	.type	op_fsin_ii, @object
	.size	op_fsin_ii, 4
op_fsin_ii:
	.byte	-127
	.byte	120
	.byte	1
	.byte	2
	.globl	op_fsin_ir
	.type	op_fsin_ir, @object
	.size	op_fsin_ir, 3
op_fsin_ir:
	.byte	-128
	.byte	120
	.byte	1
	.globl	op_fsin_ri
	.type	op_fsin_ri, @object
	.size	op_fsin_ri, 3
op_fsin_ri:
	.byte	127
	.byte	120
	.byte	2
	.globl	op_fsin_rr
	.type	op_fsin_rr, @object
	.size	op_fsin_rr, 2
op_fsin_rr:
	.byte	126
	.byte	120
	.globl	op_fsqrt_ii
	.align 4
	.type	op_fsqrt_ii, @object
	.size	op_fsqrt_ii, 4
op_fsqrt_ii:
	.byte	125
	.byte	120
	.byte	1
	.byte	2
	.globl	op_fsqrt_ir
	.type	op_fsqrt_ir, @object
	.size	op_fsqrt_ir, 3
op_fsqrt_ir:
	.byte	124
	.byte	120
	.byte	1
	.globl	op_fsqrt_ri
	.type	op_fsqrt_ri, @object
	.size	op_fsqrt_ri, 3
op_fsqrt_ri:
	.byte	123
	.byte	120
	.byte	2
	.globl	op_fsqrt_rr
	.type	op_fsqrt_rr, @object
	.size	op_fsqrt_rr, 2
op_fsqrt_rr:
	.byte	122
	.byte	120
	.globl	op_fmod_ii
	.align 4
	.type	op_fmod_ii, @object
	.size	op_fmod_ii, 4
op_fmod_ii:
	.byte	121
	.byte	120
	.byte	1
	.byte	2
	.globl	op_fmod_ir
	.type	op_fmod_ir, @object
	.size	op_fmod_ir, 3
op_fmod_ir:
	.byte	120
	.byte	120
	.byte	1
	.globl	op_fmod_ri
	.type	op_fmod_ri, @object
	.size	op_fmod_ri, 3
op_fmod_ri:
	.byte	119
	.byte	120
	.byte	2
	.globl	op_fmod_rr
	.type	op_fmod_rr, @object
	.size	op_fmod_rr, 2
op_fmod_rr:
	.byte	118
	.byte	120
	.globl	op_fdiv_ii
	.align 4
	.type	op_fdiv_ii, @object
	.size	op_fdiv_ii, 4
op_fdiv_ii:
	.byte	117
	.byte	120
	.byte	1
	.byte	2
	.globl	op_fdiv_ir
	.type	op_fdiv_ir, @object
	.size	op_fdiv_ir, 3
op_fdiv_ir:
	.byte	116
	.byte	120
	.byte	1
	.globl	op_fdiv_ri
	.type	op_fdiv_ri, @object
	.size	op_fdiv_ri, 3
op_fdiv_ri:
	.byte	115
	.byte	120
	.byte	2
	.globl	op_fdiv_rr
	.type	op_fdiv_rr, @object
	.size	op_fdiv_rr, 2
op_fdiv_rr:
	.byte	114
	.byte	120
	.globl	op_fmul_ii
	.align 4
	.type	op_fmul_ii, @object
	.size	op_fmul_ii, 4
op_fmul_ii:
	.byte	113
	.byte	120
	.byte	1
	.byte	2
	.globl	op_fmul_ir
	.type	op_fmul_ir, @object
	.size	op_fmul_ir, 3
op_fmul_ir:
	.byte	112
	.byte	120
	.byte	1
	.globl	op_fmul_ri
	.type	op_fmul_ri, @object
	.size	op_fmul_ri, 3
op_fmul_ri:
	.byte	111
	.byte	120
	.byte	2
	.globl	op_fmul_rr
	.type	op_fmul_rr, @object
	.size	op_fmul_rr, 2
op_fmul_rr:
	.byte	110
	.byte	120
	.globl	op_fsub_ii
	.align 4
	.type	op_fsub_ii, @object
	.size	op_fsub_ii, 4
op_fsub_ii:
	.byte	109
	.byte	120
	.byte	1
	.byte	2
	.globl	op_fsub_ir
	.type	op_fsub_ir, @object
	.size	op_fsub_ir, 3
op_fsub_ir:
	.byte	108
	.byte	120
	.byte	1
	.globl	op_fsub_ri
	.type	op_fsub_ri, @object
	.size	op_fsub_ri, 3
op_fsub_ri:
	.byte	107
	.byte	120
	.byte	2
	.globl	op_fsub_rr
	.type	op_fsub_rr, @object
	.size	op_fsub_rr, 2
op_fsub_rr:
	.byte	106
	.byte	120
	.globl	op_fadd_ii
	.align 4
	.type	op_fadd_ii, @object
	.size	op_fadd_ii, 4
op_fadd_ii:
	.byte	105
	.byte	120
	.byte	1
	.byte	2
	.globl	op_fadd_ir
	.type	op_fadd_ir, @object
	.size	op_fadd_ir, 3
op_fadd_ir:
	.byte	104
	.byte	120
	.byte	1
	.globl	op_fadd_ri
	.type	op_fadd_ri, @object
	.size	op_fadd_ri, 3
op_fadd_ri:
	.byte	103
	.byte	120
	.byte	2
	.globl	op_fadd_rr
	.type	op_fadd_rr, @object
	.size	op_fadd_rr, 2
op_fadd_rr:
	.byte	102
	.byte	120
	.globl	op_fneg_ii
	.align 4
	.type	op_fneg_ii, @object
	.size	op_fneg_ii, 4
op_fneg_ii:
	.byte	101
	.byte	120
	.byte	1
	.byte	2
	.globl	op_fneg_ir
	.type	op_fneg_ir, @object
	.size	op_fneg_ir, 3
op_fneg_ir:
	.byte	100
	.byte	120
	.byte	1
	.globl	op_fneg_ri
	.type	op_fneg_ri, @object
	.size	op_fneg_ri, 3
op_fneg_ri:
	.byte	99
	.byte	120
	.byte	2
	.globl	op_fneg_rr
	.type	op_fneg_rr, @object
	.size	op_fneg_rr, 2
op_fneg_rr:
	.byte	98
	.byte	120
	.globl	op_mod_ii
	.align 4
	.type	op_mod_ii, @object
	.size	op_mod_ii, 4
op_mod_ii:
	.byte	97
	.byte	120
	.byte	1
	.byte	2
	.globl	op_mod_ir
	.type	op_mod_ir, @object
	.size	op_mod_ir, 3
op_mod_ir:
	.byte	96
	.byte	120
	.byte	1
	.globl	op_mod_ri
	.type	op_mod_ri, @object
	.size	op_mod_ri, 3
op_mod_ri:
	.byte	95
	.byte	120
	.byte	2
	.globl	op_mod_rr
	.type	op_mod_rr, @object
	.size	op_mod_rr, 2
op_mod_rr:
	.byte	94
	.byte	120
	.globl	op_mod_li
	.type	op_mod_li, @object
	.size	op_mod_li, 3
op_mod_li:
	.byte	93
	.byte	56
	.byte	2
	.globl	op_mod_lr
	.type	op_mod_lr, @object
	.size	op_mod_lr, 2
op_mod_lr:
	.byte	92
	.byte	56
	.globl	op_div_ii
	.align 4
	.type	op_div_ii, @object
	.size	op_div_ii, 4
op_div_ii:
	.byte	91
	.byte	120
	.byte	1
	.byte	2
	.globl	op_div_ir
	.type	op_div_ir, @object
	.size	op_div_ir, 3
op_div_ir:
	.byte	90
	.byte	120
	.byte	1
	.globl	op_div_ri
	.type	op_div_ri, @object
	.size	op_div_ri, 3
op_div_ri:
	.byte	89
	.byte	120
	.byte	2
	.globl	op_div_rr
	.type	op_div_rr, @object
	.size	op_div_rr, 2
op_div_rr:
	.byte	88
	.byte	120
	.globl	op_div_li
	.type	op_div_li, @object
	.size	op_div_li, 3
op_div_li:
	.byte	87
	.byte	56
	.byte	2
	.globl	op_div_lr
	.type	op_div_lr, @object
	.size	op_div_lr, 2
op_div_lr:
	.byte	86
	.byte	56
	.globl	op_mul_ii
	.align 4
	.type	op_mul_ii, @object
	.size	op_mul_ii, 4
op_mul_ii:
	.byte	85
	.byte	120
	.byte	1
	.byte	2
	.globl	op_mul_ir
	.type	op_mul_ir, @object
	.size	op_mul_ir, 3
op_mul_ir:
	.byte	84
	.byte	120
	.byte	1
	.globl	op_mul_ri
	.type	op_mul_ri, @object
	.size	op_mul_ri, 3
op_mul_ri:
	.byte	83
	.byte	120
	.byte	2
	.globl	op_mul_rr
	.type	op_mul_rr, @object
	.size	op_mul_rr, 2
op_mul_rr:
	.byte	82
	.byte	120
	.globl	op_mul_li
	.type	op_mul_li, @object
	.size	op_mul_li, 3
op_mul_li:
	.byte	81
	.byte	56
	.byte	2
	.globl	op_mul_lr
	.type	op_mul_lr, @object
	.size	op_mul_lr, 2
op_mul_lr:
	.byte	80
	.byte	56
	.globl	op_sub_ii
	.align 4
	.type	op_sub_ii, @object
	.size	op_sub_ii, 4
op_sub_ii:
	.byte	79
	.byte	120
	.byte	1
	.byte	2
	.globl	op_sub_ir
	.type	op_sub_ir, @object
	.size	op_sub_ir, 3
op_sub_ir:
	.byte	78
	.byte	120
	.byte	1
	.globl	op_sub_ri
	.type	op_sub_ri, @object
	.size	op_sub_ri, 3
op_sub_ri:
	.byte	77
	.byte	120
	.byte	2
	.globl	op_sub_rr
	.type	op_sub_rr, @object
	.size	op_sub_rr, 2
op_sub_rr:
	.byte	76
	.byte	120
	.globl	op_sub_li
	.type	op_sub_li, @object
	.size	op_sub_li, 3
op_sub_li:
	.byte	75
	.byte	56
	.byte	2
	.globl	op_sub_lr
	.type	op_sub_lr, @object
	.size	op_sub_lr, 2
op_sub_lr:
	.byte	74
	.byte	56
	.globl	op_add_ii
	.align 4
	.type	op_add_ii, @object
	.size	op_add_ii, 4
op_add_ii:
	.byte	73
	.byte	120
	.byte	1
	.byte	2
	.globl	op_add_ir
	.type	op_add_ir, @object
	.size	op_add_ir, 3
op_add_ir:
	.byte	72
	.byte	120
	.byte	1
	.globl	op_add_ri
	.type	op_add_ri, @object
	.size	op_add_ri, 3
op_add_ri:
	.byte	71
	.byte	120
	.byte	2
	.globl	op_add_rr
	.type	op_add_rr, @object
	.size	op_add_rr, 2
op_add_rr:
	.byte	70
	.byte	120
	.globl	op_add_li
	.type	op_add_li, @object
	.size	op_add_li, 3
op_add_li:
	.byte	69
	.byte	56
	.byte	2
	.globl	op_add_lr
	.type	op_add_lr, @object
	.size	op_add_lr, 2
op_add_lr:
	.byte	68
	.byte	56
	.globl	op_neg_ii
	.align 4
	.type	op_neg_ii, @object
	.size	op_neg_ii, 4
op_neg_ii:
	.byte	67
	.byte	120
	.byte	1
	.byte	2
	.globl	op_neg_ir
	.type	op_neg_ir, @object
	.size	op_neg_ir, 3
op_neg_ir:
	.byte	66
	.byte	120
	.byte	1
	.globl	op_neg_ri
	.type	op_neg_ri, @object
	.size	op_neg_ri, 3
op_neg_ri:
	.byte	65
	.byte	120
	.byte	2
	.globl	op_neg_rr
	.type	op_neg_rr, @object
	.size	op_neg_rr, 2
op_neg_rr:
	.byte	64
	.byte	120
	.globl	op_vmve_ai
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
