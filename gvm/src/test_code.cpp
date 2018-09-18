#include <cstdio>
#include <cmath>
#include <cfloat>
#include <cstring>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"
#include "include/opcode_macros.hpp"
using namespace GVM;

// Examine the assembled output for the following arrays to confirm they have the expected byte sequences

// Conventions used:
// Small immediate literal shall always be 3
// source register shall always be r7
// source register index (indirect) shall always be 1
// destination register shall always be r8
// destination register index (indirect) shall always be 2
// PC branch offset shall always be -2
// Symbol ID shall always be 0xFFFF (-1)

#define _END 0x00

uint8 op_nop[]     = { nop _END };

// Unconditional Branch
uint8 op_bras[]    = { bras(-2) _END };
uint8 op_bra[]     = { bra(-2) _END };

uint8 op_tjmps[]   = { tjmps(r8, 4) _D8(-2),  _D8(-3),  _D8(-4),  _D8(-5), _END };
uint8 op_tjmp[]    = { tjmp(r8, 4)  _D16(-2), _D16(-3), _D16(-4), _D16(-5), _END };

// Function Call
uint8 op_bcall[]   = { bcall(-1) _END };
uint8 op_call[]    = { call(0xFFFF) _END };
uint8 op_call_r[]  = { call_r(r7) _END };
uint8 op_call_i[]  = { call_i(r7, 1) _END };
uint8 op_call_h[]  = { call_h(0xFFFF) _END };

// Function Return
uint8 op_ret[]     = { ret _END };

// Conditional Looping
uint8 op_dbnz[]    = { dbnz(r7, -2) _END };
uint8 op_ldbnn[]   = { ldbnn(r7, 1, r8, -2) _END };

// Integer|Float branch on zero
uint8 op_bez_r[]   = { bez_r(r7, -2) _END };
uint8 op_bez_i[]   = { bez_i(r7, 1, -2) _END };

// Integer|Float branch on non-zero
uint8 op_bnz_r[]   = { bnz_r(r7, -2) _END };
uint8 op_bnz_i[]   = { bnz_i(r7, 1, -2) _END };

// Integer|Float branch on all exactly equal
uint8 op_beq_rr[]  = { beq_rr(r7, r8, -2) _END };
uint8 op_beq_ri[]  = { beq_ri(r7, r8, 2, -2) _END };
uint8 op_beq_ii[]  = { beq_ii(r7, 1, r8, 2, -2) _END };

// Integer branch on greater or equal
uint8 op_bge_rr[]  = { bge_rr(r7, r8, -2) _END };
uint8 op_bge_ri[]  = { bge_ri(r7, r8, 2, -2) _END };
uint8 op_bge_ir[]  = { bge_ir(r7, 1, r8, -2) _END };
uint8 op_bge_ii[]  = { bge_ii(r7, 1, r8, 2, -2) _END };

// Integer branch on greater than
uint8 op_bgt_rr[]  = { bgt_rr(r7, r8, -2) _END };
uint8 op_bgt_ri[]  = { bgt_ri(r7, r8, 2, -2) _END };
uint8 op_bgt_ir[]  = { bgt_ir(r7, 1, r8, -2) _END };
uint8 op_bgt_ii[]  = { bgt_ii(r7, 1, r8, 2, -2) _END };

// Float branch on equal within epsilon
uint8 op_fbeq_rr[] = { fbge_rr(r7, r8, -2) _END };
uint8 op_fbeq_ri[] = { fbge_ri(r7, r8, 2, -2) _END };
uint8 op_fbeq_ii[] = { fbge_ii(r7, 1, r8, 2, -2) _END };

// Float branch on greater or equal
uint8 op_fbge_rr[] = { fbge_rr(r7, r8, -2) _END };
uint8 op_fbge_ri[] = { fbge_ri(r7, r8, 2, -2) _END };
uint8 op_fbge_ir[] = { fbge_ir(r7, 1, r8, -2) _END };
uint8 op_fbge_ii[] = { fbge_ii(r7, 1, r8, 2, -2) _END };

// Float branch on greater than
uint8 op_fbgt_rr[] = { fbgt_rr(r7, r8, -2) _END };
uint8 op_fbgt_ri[] = { fbgt_ri(r7, r8, 2, -2) _END };
uint8 op_fbgt_ir[] = { fbgt_ir(r7, 1, r8, -2) _END };
uint8 op_fbgt_ii[] = { fbgt_ii(r7, 1, r8, 2, -2) _END };

// Vector branch on equal
uint8 op_vbeq_ii[] = { vbeq_ii(r7, 1, r8, 2, -2) _END };
uint8 op_vbeq_ia[] = { vbeq_ia(r7, 1, -2) _END };

// Vector branch on not equal
uint8 op_vbne_ii[] = { vbne_ii(r7, 1, r8, 2, -2) _END };
uint8 op_vbne_ia[] = { vbne_ia(r7, 1, -2) _END };

// Integer|Float move
uint8 op_move_lr[] = { move_lr(3, r8) _END };
uint8 op_move_li[] = { move_li(3, r8, 2) _END };
uint8 op_move_rr[] = { move_rr(r7, r8) _END };
uint8 op_move_ri[] = { move_ri(r7, r8, 2) _END };
uint8 op_move_ir[] = { move_ir(r7, 1, r8) _END };
uint8 op_move_ii[] = { move_ii(r7, 1, r8, 2) _END };
uint8 op_move_mr[] = { move_mr(r8) _END };
uint8 op_move_mi[] = { move_mi(r8, 2) _END };
uint8 op_pushr[]   = { pushr(r7, r8) _END };
uint8 op_popr[]    = { popr(r7, r8) _END };
uint8 op_asf[]     = { asf(r8, 240) _END };
uint8 op_fsf[]     = { fsf(r8, 240) _END };

// Vector splat
uint8 op_vspl_li[] = { vspl_li(3, r8, 2) _END };
uint8 op_vspl_ri[] = { vspl_ri(r7, r8, 2) _END };
uint8 op_vspl_ii[] = { vspl_ii(r7, 1, r8, 2) _END };
uint8 op_vspl_la[] = { vspl_la(3) _END };
uint8 op_vspl_ra[] = { vspl_ra(r7) _END };
uint8 op_vspl_ia[] = { vspl_ia(r7, 1) _END };

// Vector move
uint8 op_vmve_ii[] = { vmve_ii(r7, 1, r8, 2) _END };
uint8 op_vmve_ia[] = { vmve_ia(r7, 1) _END };
uint8 op_vmve_ai[] = { vmve_ai(r8, 2) _END };

// Integer negate
uint8 op_neg_rr[]  = { neg_rr(r7, r8) _END };
uint8 op_neg_ri[]  = { neg_ri(r7, r8, 2) _END };
uint8 op_neg_ir[]  = { neg_ir(r7, 1, r8) _END };
uint8 op_neg_ii[]  = { neg_ii(r7, 1, r8, 2) _END };

// Integer add
uint8 op_add_lr[]   = { add_lr(3, r8) _END };
uint8 op_add_li[]   = { add_li(3, r8, 2) _END };
uint8 op_add_rr[]   = { add_rr(r7, r8) _END };
uint8 op_add_ri[]   = { add_ri(r7, r8, 2) _END };
uint8 op_add_ir[]   = { add_ir(r7, 1, r8) _END };
uint8 op_add_ii[]   = { add_ii(r7, 1, r8,2) _END };

// Integer subtract
uint8 op_sub_lr[]   = { sub_lr(3, r8) _END };
uint8 op_sub_li[]   = { sub_li(3, r8, 2) _END };
uint8 op_sub_rr[]   = { sub_rr(r7, r8) _END };
uint8 op_sub_ri[]   = { sub_ri(r7, r8, 2) _END };
uint8 op_sub_ir[]   = { sub_ir(r7, 1, r8) _END };
uint8 op_sub_ii[]   = { sub_ii(r7, 1, r8, 2) _END };

// Integer multiply
uint8 op_mul_lr[]   = { mul_lr(3, r8) _END };
uint8 op_mul_li[]   = { mul_li(3, r8, 2) _END };
uint8 op_mul_rr[]   = { mul_rr(r7, r8) _END };
uint8 op_mul_ri[]   = { mul_ri(r7, r8, 2) _END };
uint8 op_mul_ir[]   = { mul_ir(r7, 1, r8) _END };
uint8 op_mul_ii[]   = { mul_ii(r7, 1, r8, 2) _END };

// Integer divide
uint8 op_div_lr[]   = { div_lr(3, r8) _END };
uint8 op_div_li[]   = { div_li(3, r8, 2) _END };
uint8 op_div_rr[]   = { div_rr(r7, r8) _END };
uint8 op_div_ri[]   = { div_ri(r7, r8, 2) _END };
uint8 op_div_ir[]   = { div_ir(r7, 1, r8) _END };
uint8 op_div_ii[]   = { div_ii(r7, 1, r8, 2) _END };

// Integer modulus
uint8 op_mod_lr[]   = { mod_lr(3, r8) _END };
uint8 op_mod_li[]   = { mod_li(3, r8, 2) _END };
uint8 op_mod_rr[]   = { mod_rr(r7, r8) _END };
uint8 op_mod_ri[]   = { mod_ri(r7, r8, 2) _END };
uint8 op_mod_ir[]   = { mod_ir(r7, 1, r8) _END };
uint8 op_mod_ii[]   = { mod_ii(r7, 1, r8, 2) _END };

// Float negate
uint8 op_fneg_rr[]  = { fneg_rr(r7, r8) _END };
uint8 op_fneg_ri[]  = { fneg_ri(r7, r8, 2) _END };
uint8 op_fneg_ir[]  = { fneg_ir(r7, 1, r8) _END };
uint8 op_fneg_ii[]  = { fneg_ii(r7, 1, r8, 2) _END };

// Float add
uint8 op_fadd_rr[]  = { fadd_rr(r7, r8) _END };
uint8 op_fadd_ri[]  = { fadd_ri(r7, r8, 2) _END };
uint8 op_fadd_ir[]  = { fadd_ir(r7, 1, r8) _END };
uint8 op_fadd_ii[]  = { fadd_ii(r7, 1, r8, 2) _END };

// Float subtract
uint8 op_fsub_rr[]  = { fsub_rr(r7, r8) _END };
uint8 op_fsub_ri[]  = { fsub_ri(r7, r8, 2) _END };
uint8 op_fsub_ir[]  = { fsub_ir(r7, 1, r8) _END };
uint8 op_fsub_ii[]  = { fsub_ii(r7, 1, r8, 2) _END };

// Float multiply
uint8 op_fmul_rr[]  = { fmul_rr(r7, r8) _END };
uint8 op_fmul_ri[]  = { fmul_ri(r7, r8, 2) _END };
uint8 op_fmul_ir[]  = { fmul_ir(r7, 1, r8) _END };
uint8 op_fmul_ii[]  = { fmul_ii(r7, 1, r8, 2) _END };

// Float divide
uint8 op_fdiv_rr[]  = { fdiv_rr(r7, r8) _END };
uint8 op_fdiv_ri[]  = { fdiv_ri(r7, r8, 2) _END };
uint8 op_fdiv_ir[]  = { fdiv_ir(r7, 1, r8) _END };
uint8 op_fdiv_ii[]  = { fdiv_ii(r7, 1, r8, 2) _END };

// Float modulus
uint8 op_fmod_rr[]  = { fmod_rr(r7, r8) _END };
uint8 op_fmod_ri[]  = { fmod_ri(r7, r8, 2) _END };
uint8 op_fmod_ir[]  = { fmod_ir(r7, 1, r8) _END };
uint8 op_fmod_ii[]  = { fmod_ii(r7, 1, r8, 2) _END };

// Float sqrt
uint8 op_fsqrt_rr[]  = { fsqrt_rr(r7, r8) _END };
uint8 op_fsqrt_ri[]  = { fsqrt_ri(r7, r8, 2) _END };
uint8 op_fsqrt_ir[]  = { fsqrt_ir(r7, 1, r8) _END };
uint8 op_fsqrt_ii[]  = { fsqrt_ii(r7, 1, r8, 2) _END };

// Float sine
uint8 op_fsin_rr[]  = { fsin_rr(r7, r8) _END };
uint8 op_fsin_ri[]  = { fsin_ri(r7, r8, 2) _END };
uint8 op_fsin_ir[]  = { fsin_ir(r7, 1, r8) _END };
uint8 op_fsin_ii[]  = { fsin_ii(r7, 1, r8, 2) _END };

// Float cosine
uint8 op_fcos_rr[]  = { fcos_rr(r7, r8) _END };
uint8 op_fcos_ri[]  = { fcos_ri(r7, r8, 2) _END };
uint8 op_fcos_ir[]  = { fcos_ir(r7, 1, r8) _END };
uint8 op_fcos_ii[]  = { fcos_ii(r7, 1, r8, 2) _END };

// Float tangent
uint8 op_ftan_rr[]  = { ftan_rr(r7, r8) _END };
uint8 op_ftan_ri[]  = { ftan_ri(r7, r8, 2) _END };
uint8 op_ftan_ir[]  = { ftan_ir(r7, 1, r8) _END };
uint8 op_ftan_ii[]  = { ftan_ii(r7, 1, r8, 2) _END };

// Vector Negate
uint8 op_vneg_i []  = { vneg_i(r8, 2) _END };
uint8 op_vneg_ii[]  = { vneg_ii(r7, 1, r8, 2) _END };
uint8 op_vneg_ia[]  = { vneg_ia(r7, 1) _END };
uint8 op_vneg_ai[]  = { vneg_ai(r8, 2) _END };
uint8 op_vneg_a []  = { vneg_a _END };

// Vector scale
uint8 op_vscl_ri[]  = { vscl_ri(r7, r8, 2) _END };
uint8 op_vscl_ii[]  = { vscl_ii(r7, 1, r8, 2) _END };
uint8 op_vscl_mi[]  = { vscl_mi(r8, 2) _END };
uint8 op_vscl_ra[]  = { vscl_ra(r7) _END };
uint8 op_vscl_ia[]  = { vscl_ia(r7, 1) _END };
uint8 op_vscl_ma[]  = { vscl_ma _END };

// Vector add
uint8 op_vadd_ii[]  = { vadd_ii(r7, 1, r8, 2) _END };
uint8 op_vadd_ia[]  = { vadd_ia(r7, 1) _END };
uint8 op_vadd_ai[]  = { vadd_ai(r8, 2) _END };
uint8 op_vadd_iia[] = { vadd_iia(r7, 1, r8, 2) _END };
uint8 op_vadd_iai[] = { vadd_iai(r7, 1, r8, 2) _END };

// Vector subtract
uint8 op_vsub_ii[] =  { vsub_ii(r7, 1, r8, 2) _END };
uint8 op_vsub_ia[] =  { vsub_ia(r7, 1) _END };
uint8 op_vsub_ai[] =  { vsub_ai(r8, 2) _END };
uint8 op_vsub_iia[] = { vsub_iia(r7, 1, r8, 2) _END };
uint8 op_vsub_iai[] = { vsub_iai(r7, 1, r8, 2) _END };
uint8 op_vsub_aii[] = { vsub_aii(r7, 1, r8, 2) _END };

// Vector cross product
uint8 op_vmul_iia[] = { vmul_iia(r7, 1,r8, 2) _END };
uint8 op_vmul_aii[] = { vmul_aii(r7, 1,r8, 2) _END };
uint8 op_vmul_iai[] = { vmul_iai(r7, 1,r8, 2) _END };

// Vector dot product
uint8 op_vdot_iim[] = { vdot_iim(r7, 1, r8, 2) _END };
uint8 op_vdot_air[] = { vdot_air(r7, 1, r8) _END };
uint8 op_vdot_aii[] = { vdot_aii(r7, 1, r8, 2) _END };

// Vector magnitude
uint8 op_vmag_ir[]  = { vmag_ir(r7,1,r8) _END };
uint8 op_vmag_ii[]  = { vmag_ii(r7,1,r8,2) _END };
uint8 op_vmag_ar[]  = { vmag_ar(r8) _END };
uint8 op_vmag_ai[]  = { vmag_ai(r8,2) _END };
uint8 op_vmag_m[]   = { vmag_m _END };

// Vector normalise
uint8 op_vnrm_i []  = { vnrm_i(r7, 1) _END };
uint8 op_vnrm_ii[]  = { vnrm_ii(r7, 1, r8, 2) _END };
uint8 op_vnrm_ia[]  = { vnrm_ia(r7, 1) _END };
uint8 op_vnrm_ai[]  = { vnrm_ai(r8, 2) _END };
uint8 op_vnrm_a[]   = { vnrm_a _END };


// Logic AND
uint8 op_and_rr[] = { and_rr(r7,r8) _END };
uint8 op_and_ri[] = { and_ri(r7,r8,2) _END };
uint8 op_and_ir[] = { and_ir(r7,1,r8) _END };
uint8 op_and_ii[] = { and_ii(r7,1,r8,2) _END };

// Logic OR
uint8 op_or_rr[] = { or_rr(r7,r8) _END };
uint8 op_or_ri[] = { or_ri(r7,r8,2) _END };
uint8 op_or_ir[] = { or_ir(r7,1,r8) _END };
uint8 op_or_ii[] = { or_ii(r7,1,r8,2) _END };

// Logic XOR
uint8 op_xor_rr[] = { xor_rr(r7,r8) _END };
uint8 op_xor_ri[] = { xor_ri(r7,r8,2) _END };
uint8 op_xor_ir[] = { xor_ir(r7,1,r8) _END };
uint8 op_xor_ii[] = { xor_ii(r7,1,r8,2) _END };

// Logic NOT
uint8 op_not_rr[] = { not_rr(r7,r8) _END };
uint8 op_not_ri[] = { not_ri(r7,r8,2) _END };
uint8 op_not_ir[] = { not_ir(r7,1,r8) _END };
uint8 op_not_ii[] = { not_ii(r7,1,r8,2) _END };

// Logic SHL
uint8 op_lsl_lr[] = { lsl_lr(3,r8) _END };
uint8 op_lsl_li[] = { lsl_li(3,r8,2) _END };
uint8 op_lsl_rr[] = { lsl_rr(r7,r8) _END };
uint8 op_lsl_ri[] = { lsl_ri(r7,r8,2) _END };
uint8 op_lsl_ir[] = { lsl_ir(r7,1,r8) _END };
uint8 op_lsl_ii[] = { lsl_ii(r7,1,r8,2) _END };

// Logic SHR
uint8 op_lsr_lr[] = { lsr_lr(3,r8) _END };
uint8 op_lsr_li[] = { lsr_li(3,r8,2) _END };
uint8 op_lsr_rr[] = { lsr_rr(r7,r8) _END };
uint8 op_lsr_ri[] = { lsr_ri(r7,r8,2) _END };
uint8 op_lsr_ir[] = { lsr_ir(r7,1,r8) _END };
uint8 op_lsr_ii[] = { lsr_ii(r7,1,r8,2) _END };

uint8* opcode_tests[] = {
  op_nop,
  op_bras,     op_bra,  op_tjmps,  op_tjmp,
  op_bcall,    op_call, op_call_r, op_call_i, op_call_h,
  op_ret,
  op_dbnz,     op_ldbnn,
  op_bez_r,    op_bez_i,
  op_bnz_r,    op_bnz_i,
  op_beq_rr,   op_beq_ri,   op_beq_ii,
  op_bge_rr,   op_bge_ri,   op_bge_ir, op_bge_ii,
  op_bgt_rr,   op_bgt_ri,   op_bgt_ir, op_bgt_ii,
  op_fbeq_rr,  op_fbeq_ri,  op_fbeq_ii,
  op_fbge_rr,  op_fbge_ri,  op_fbge_ir, op_fbge_ii,
  op_fbgt_rr,  op_fbgt_ri,  op_fbgt_ir, op_fbgt_ii,
  op_vbeq_ii,  op_vbeq_ia,
  op_vbne_ii,  op_vbne_ia,
  op_move_lr,  op_move_li,  op_move_rr,  op_move_ri,  op_move_ir,  op_move_ii, op_move_mr, op_move_mi,
  op_pushr,    op_popr,     op_asf,      op_fsf,
  op_vspl_li,  op_vspl_ri,  op_vspl_ii,  op_vspl_la,  op_vspl_ra,  op_vspl_ia,
  op_vmve_ii,  op_vmve_ia,  op_vmve_ai,
  op_neg_rr,   op_neg_ri,   op_neg_ir,   op_neg_ii,
  op_add_lr,   op_add_li,   op_add_rr,   op_add_ri,   op_add_ir,   op_add_ii,
  op_sub_lr,   op_sub_li,   op_sub_rr,   op_sub_ri,   op_sub_ir,   op_sub_ii,
  op_mul_lr,   op_mul_li,   op_mul_rr,   op_mul_ri,   op_mul_ir,   op_mul_ii,
  op_div_lr,   op_div_li,   op_div_rr,   op_div_ri,   op_div_ir,   op_div_ii,
  op_mod_lr,   op_mod_li,   op_mod_rr,   op_mod_ri,   op_mod_ir,   op_mod_ii,
  op_fneg_rr,  op_fneg_ri,  op_fneg_ir,  op_fneg_ii,
  op_fadd_rr,  op_fadd_ri,  op_fadd_ir,  op_fadd_ii,
  op_fsub_rr,  op_fsub_ri,  op_fsub_ir,  op_fsub_ii,
  op_fmul_rr,  op_fmul_ri,  op_fmul_ir,  op_fmul_ii,
  op_fdiv_rr,  op_fdiv_ri,  op_fdiv_ir,  op_fdiv_ii,
  op_fmod_rr,  op_fmod_ri,  op_fmod_ir,  op_fmod_ii,
  op_fsqrt_rr, op_fsqrt_ri, op_fsqrt_ir, op_fsqrt_ii,
  op_fsin_rr,  op_fsin_ri,  op_fsin_ir,  op_fsin_ii,
  op_fcos_rr,  op_fcos_ri,  op_fcos_ir,  op_fcos_ii,
  op_ftan_rr,  op_ftan_ri,  op_ftan_ir,  op_ftan_ii,
  op_vneg_i,   op_vneg_ii,  op_vneg_ia,  op_vneg_ai,  op_vneg_a,
  op_vscl_ri,  op_vscl_ii,  op_vscl_mi,  op_vscl_ra,  op_vscl_ia,  op_vscl_ma,
  op_vadd_ii,  op_vadd_ia,  op_vadd_ai,  op_vadd_iia, op_vadd_iai,
  op_vsub_ii,  op_vsub_ia,  op_vsub_ai,  op_vsub_iia, op_vsub_iai, op_vsub_aii,
  op_vmul_iia, op_vmul_aii, op_vmul_iai,
  op_vdot_iim, op_vdot_air, op_vdot_aii,
  op_vmag_ir,  op_vmag_ii,  op_vmag_ar,  op_vmag_ai,  op_vmag_m,
  op_vnrm_i,   op_vnrm_ii,  op_vnrm_ia,  op_vnrm_ai,  op_vnrm_a,
  op_and_rr,   op_and_ri,   op_and_ir,   op_and_ii,
  op_or_rr,    op_or_ri,    op_or_ir,    op_or_ii,
  op_xor_rr,   op_xor_ri,   op_xor_ir,   op_xor_ii,
  op_not_rr,   op_not_ri,   op_not_ir,   op_not_ii,
  op_lsl_lr,   op_lsl_li,   op_lsl_rr,   op_lsl_ri,  op_lsl_ir,  op_lsl_ii,
  op_lsr_lr,   op_lsr_li,   op_lsr_rr,   op_lsr_ri,  op_lsr_ir,  op_lsr_ii,
};

const char* assembler[] = {
  "nop",
  "bras -2",
  "bra -2",
  "tjmps r8, 4, -2, -3, -4, -5",
  "tjmp r8, 4, -2, -3, -4, -5",
  "bcall -1",
  "call 0xFFFF",
  "call r7",
  "call 1(r7),",
  "callh 0xFFFF",
  "ret",
  "dbnz r7, -2",
  "ldbnn 1(r7), r8, -2",
  "bez r7, -2",
  "bez 1(r7), -2",
  "bnz r7, -2",
  "bnz 1(r7), -2",
  "beq r7, r8, -2",
  "beq r7, 2(r8), -2",
  "beq 1(r7), 2(r8), -2",
  "bge r7, r8, -2",
  "bge r7, 2(r8), -2",
  "bge 1(r7), r8, -2",
  "bge 1(r7), 2(r8), -2",
  "bgt r7, r8, -2",
  "bgt r7, 2(r8), -2",
  "bgt 1(r7), r8, -2",
  "bgt 1(r7), 2(r8), -2",
  "fbge r7, r8, -2",
  "fbge r7, 2(r8), -2",
  "fbge 1(r7), 2(r8), -2",
  "fbge r7, r8, -2",
  "fbge r7, 2(r8), -2",
  "fbge 1(r7), r8, -2",
  "fbge 1(r7), 2(r8), -2",
  "fbgt r7, r8, -2",
  "fbgt r7, 2(r8), -2",
  "fbgt 1(r7), r8, -2",
  "fbgt 1(r7), 2(r8), -2",
  "vbeq 1(r7), 2(r8), -2",
  "vbeq 1(r7), vs, -2",
  "vbne 1(r7), 2(r8), -2",
  "vbne 1(r7), vs, -2",
  "move 3, r8",
  "move 3, 2(r8)",
  "move r7, r8",
  "move r7, 2(r8)",
  "move 1(r7), r8",
  "move 1(r7), 2(r8)",
  "move m, r8",
  "move m, 2(r8)",
  "pushr r7-r8",
  "popr r7-r8",
  "asf r8, 240",
  "fsf r8, 240",
  "vspl 3, 2(r8)",
  "vspl r7, 2(r8)",
  "vspl 1(r7), 2(r8)",
  "vspl 3, vs",
  "vspl r7, vs",
  "vspl 1(r7), vs",
  "vmve 1(r7), 2(r8)",
  "vmve 1(r7), vs",
  "vmve vs, 2(r8)",
  "neg r7, r8",
  "neg r7, 2(r8)",
  "neg 1(r7), r8",
  "neg 1(r7), 2(r8)",
  "add 3, r8",
  "add 3, 2(r8)",
  "add r7, r8",
  "add r7, 2(r8)",
  "add 1(r7), r8",
  "add 1(r7), r8,2",
  "sub 3, r8",
  "sub 3, 2(r8)",
  "sub r7, r8",
  "sub r7, 2(r8)",
  "sub 1(r7), r8",
  "sub 1(r7), 2(r8)",
  "mul 3, r8",
  "mul 3, 2(r8)",
  "mul r7, r8",
  "mul r7, 2(r8)",
  "mul 1(r7), r8",
  "mul 1(r7), 2(r8)",
  "div 3, r8",
  "div 3, 2(r8)",
  "div r7, r8",
  "div r7, 2(r8)",
  "div 1(r7), r8",
  "div 1(r7), 2(r8)",
  "mod 3, r8",
  "mod 3, 2(r8)",
  "mod r7, r8",
  "mod r7, 2(r8)",
  "mod 1(r7), r8",
  "mod 1(r7), 2(r8)",
  "fneg r7, r8",
  "fneg r7, 2(r8)",
  "fneg 1(r7), r8",
  "fneg 1(r7), 2(r8)",
  "fadd r7, r8",
  "fadd r7, 2(r8)",
  "fadd 1(r7), r8",
  "fadd 1(r7), 2(r8)",
  "fsub r7, r8",
  "fsub r7, 2(r8)",
  "fsub 1(r7), r8",
  "fsub 1(r7), 2(r8)",
  "fmul r7, r8",
  "fmul r7, 2(r8)",
  "fmul 1(r7), r8",
  "fmul 1(r7), 2(r8)",
  "fdiv r7, r8",
  "fdiv r7, 2(r8)",
  "fdiv 1(r7), r8",
  "fdiv 1(r7), 2(r8)",
  "fmod r7, r8",
  "fmod r7, 2(r8)",
  "fmod 1(r7), r8",
  "fmod 1(r7), 2(r8)",
  "fsqrt r7, r8",
  "fsqrt r7, 2(r8)",
  "fsqrt 1(r7), r8",
  "fsqrt 1(r7), 2(r8)",
  "fsin r7, r8",
  "fsin r7, 2(r8)",
  "fsin 1(r7), r8",
  "fsin 1(r7), 2(r8)",
  "fcos r7, r8",
  "fcos r7, 2(r8)",
  "fcos 1(r7), r8",
  "fcos 1(r7), 2(r8)",
  "ftan r7, r8",
  "ftan r7, 2(r8)",
  "ftan 1(r7), r8",
  "ftan 1(r7), 2(r8)",
  "vneg 2(r8)",
  "vneg 1(r7), 2(r8)",
  "vneg 1(r7), vs",
  "vneg vs, 2(r8)",
  "vneg vs",
  "vscl r7, 2(r8)",
  "vscl 1(r7), 2(r8)",
  "vscl m, 2(r8)",
  "vscl r7, vs",
  "vscl 1(r7), vs",
  "vscl m, vs",
  "vadd 1(r7), 2(r8)",
  "vadd 1(r7), vs",
  "vadd vs, 2(r8)",
  "vadd 1(r7), 2(r8), vs",
  "vadd 1(r7), vs, 2(r8)",
  "vsub 1(r7), 2(r8)",
  "vsub 1(r7), vs",
  "vsub vs, 2(r8)",
  "vsub 1(r7), 2(r8), vs",
  "vsub 1(r7), vs, 2(r8)",
  "vsub vs, 1(r7), 2(r8)",
  "vmul 1(r7), 2(r8), vs",
  "vmul vs, 1(r7), 2(r8)",
  "vmul 1(r7), vs, 2(r8)",
  "vdot 1(r7), 2(r8), m",
  "vdot vs, 1(r7), r8",
  "vdot vs, 1(r7), 2(r8)",
  "vmag 1(r7), r8",
  "vmag 1(r7), 2(r8)",
  "vmag vs, r8",
  "vmag vs, 2(r8)",
  "vmag vs, m",
  "vnrm 1(r7)",
  "vnrm 1(r7), 2(r8)",
  "vnrm 1(r7), vs",
  "vnrm vs, 2(r8)",
  "vnrm vs",
  "and r7, r8",
  "and r7, 2(r8)",
  "and 1(r7), r8",
  "and 1(r7), 2(r8)",
  "or r7, r8",
  "or r7, 2(r8)",
  "or 1(r7), r8",
  "or 1(r7), 2(r8)",
  "xor r7, r8",
  "xor r7, 2(r8)",
  "xor 1(r7), r8",
  "xor 1(r7), 2(r8)",
  "not r7, r8",
  "not r7, 2(r8)",
  "not 1(r7), r8",
  "not 1(r7), 2(r8)",
  "lsl 3, r8",
  "lsl 3, 2(r8)",
  "lsl r7, r8",
  "lsl r7, 2(r8)",
  "lsl 1(r7), r8",
  "lsl 1(r7),2(r8)",
  "lsr 3, r8",
  "lsr 3, 2(r8)",
  "lsr r7, r8",
  "lsr r7, 2(r8)",
  "lsr 1(r7), r8",
  "lsr 1(r7), 2(r8)",
};

int main() {

  const int declaredSize = sizeof(opcode_tests)/sizeof(uint8*);

  std::printf(
    "opcode_control.hpp\n"
    "\tNOP     : %d\n"
    "\tVBNE_IA : %d\n"
    "opcode_data_move.hpp\n"
    "\tMOVE_LR : %d\n"
    "\tVMVE_AI : %d\n"
    "opcode_arithmetic.hpp\n"
    "\tNEG_RR : %d\n"
    "\tVNRM_A : %d\n"
    "opcode_logic.hpp\n"
    "\tAND_RR : %d\n"
    "\tLSR_II : %d\n"
    "MAX      : %d\n"
    "Declared : %d\n",
    (int)Opcode::_NOP,
    (int)Opcode::_VBNE_IA,
    (int)Opcode::_MOVE_LR,
    (int)Opcode::_VMVE_AI,
    (int)Opcode::_NEG_RR,
    (int)Opcode::_VNRM_A,
    (int)Opcode::_AND_RR,
    (int)Opcode::_LSR_II,
    (int)Opcode::_MAX,
    declaredSize
  );
  if (Opcode::_MAX != declaredSize) {
    std::printf("\nERROR - Declared and Enumerated counts do not match\n");
  } else {
    for (int i = 1; i < declaredSize; i++) {
      int len = std::strlen((const char*)opcode_tests[i]);
      std::printf(
        "Instruction %d\n\tvasm: %s\n\tsize: %d\n\tcode: ",
        i,
        assembler[i],
        len
      );
      for (int j=0; j<len; j++) {
        std::printf("0x%02X ", opcode_tests[i][j]);
      }
      std::puts("\n");
    }
  }

  return 0;
}
