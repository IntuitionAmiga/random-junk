#include <cstdio>
#include <cmath>
#include <cfloat>
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

uint8 op_nop[]     = { nop };
uint8 op_bras[]    = { bras(-2) };
uint8 op_bra[]     = { bra(-2) };
uint8 op_bcall[]   = { bcall(-1) };
uint8 op_call[]    = { call(0xFFFF) };
uint8 op_call_r[]  = { call_r(r7) };
uint8 op_call_i[]  = { call_i(r7, 1) };
uint8 op_call_h[]  = { call_h(0xFFFF) };
uint8 op_ret[]     = { ret };
uint8 op_dbnz[]    = { dbnz(r7, -2) };
uint8 op_ldbnn[]   = { ldbnn(r7, 1, r8, -2) };
uint8 op_bez_r[]   = { bez_r(r7, -2) };
uint8 op_bez_i[]   = { bez_i(r7, 1, -2) };
uint8 op_bnz_r[]   = { bnz_r(r7, -2) };
uint8 op_bnz_i[]   = { bnz_i(r7, 1, -2) };
uint8 op_beq_rr[]  = { beq_rr(r7, r8, -2) };
uint8 op_beq_ri[]  = { beq_ri(r7, r8, 2, -2) };
uint8 op_beq_ii[]  = { beq_ii(r7, 1, r8, 2, -2) };
uint8 op_bge_rr[]  = { bge_rr(r7, r8, -2) };
uint8 op_bge_ri[]  = { bge_ri(r7, r8, 2, -2) };
uint8 op_bge_ir[]  = { bge_ir(r7, 1, r8, -2) };
uint8 op_bge_ii[]  = { bge_ii(r7, 1, r8, 2, -2) };
uint8 op_bgt_rr[]  = { bgt_rr(r7, r8, -2) };
uint8 op_bgt_ri[]  = { bgt_ri(r7, r8, 2, -2) };
uint8 op_bgt_ir[]  = { bgt_ir(r7, 1, r8, -2) };
uint8 op_bgt_ii[]  = { bgt_ii(r7, 1, r8, 2, -2) };
uint8 op_fbeq_rr[] = { fbge_rr(r7, r8, -2) };
uint8 op_fbeq_ri[] = { fbge_ri(r7, r8, 2, -2) };
uint8 op_fbeq_ii[] = { fbge_ii(r7, 1, r8, 2, -2) };
uint8 op_fbge_rr[] = { fbge_rr(r7, r8, -2) };
uint8 op_fbge_ri[] = { fbge_ri(r7, r8, 2, -2) };
uint8 op_fbge_ir[] = { fbge_ir(r7, 1, r8, -2) };
uint8 op_fbge_ii[] = { fbge_ii(r7, 1, r8, 2, -2) };
uint8 op_fbgt_rr[] = { fbgt_rr(r7, r8, -2) };
uint8 op_fbgt_ri[] = { fbgt_ri(r7, r8, 2, -2) };
uint8 op_fbgt_ir[] = { fbgt_ir(r7, 1, r8, -2) };
uint8 op_fbgt_ii[] = { fbgt_ii(r7, 1, r8, 2, -2) };
uint8 op_vbeq_ii[] = { vbeq_ii(r7, 1, r8, 2, -2) };
uint8 op_vbeq_ia[] = { vbeq_ia(r7, 1, -2) };
uint8 op_vbne_ii[] = { vbne_ii(r7, 1, r8, 2, -2) };
uint8 op_vbne_ia[] = { vbne_ia(r7, 1, -2) };
uint8 op_move_lr[] = { move_lr(3, r8) };
uint8 op_move_li[] = { move_li(3, r8, 2) };
uint8 op_move_rr[] = { move_rr(r7, r8) };
uint8 op_move_ri[] = { move_ri(r7, r8, 2) };
uint8 op_move_ir[] = { move_ir(r7, 1, r8) };
uint8 op_move_ii[] = { move_ii(r7, 1, r8, 2) };
uint8 op_move_mr[] = { move_mr(r8) };
uint8 op_move_mi[] = { move_mi(r8, 2) };
uint8 op_pushr[]   = { pushr(r7, r8) };
uint8 op_popr[]    = { popr(r7, r8) };
uint8 op_asf[]     = { asf(r8, 240) };
uint8 op_fsf[]     = { fsf(r8, 240) };
uint8 op_vspl_li[] = { vspl_li(3, r8, 2) };
uint8 op_vspl_ri[] = { vspl_ri(r7, r8, 2) };
uint8 op_vspl_ii[] = { vspl_ii(r7, 1, r8, 2) };
uint8 op_vspl_la[] = { vspl_la(3) };
uint8 op_vspl_ra[] = { vspl_ra(r7) };
uint8 op_vspl_ia[] = { vspl_ia(r7, 1) };
uint8 op_vmve_ii[] = { vmve_ii(r7, 1, r8, 2) };
uint8 op_vmve_ia[] = { vmve_ia(r7, 1) };
uint8 op_vmve_ai[] = { vmve_ai(r8, 2) };

uint8 op_neg_rr[]  = { neg_rr(r7, r8) };
uint8 op_neg_ri[]  = { neg_ri(r7, r8, 2) };
uint8 op_neg_ir[]  = { neg_ir(r7, 1, r8) };
uint8 op_neg_ii[]  = { neg_ii(r7, 1, r8, 2) };

uint8 op_add_lr[]   = { add_lr(3, r8)        };
uint8 op_add_li[]   = { add_li(3, r8, 2)     };
uint8 op_add_rr[]   = { add_rr(r7, r8)       };
uint8 op_add_ri[]   = { add_ri(r7, r8, 2)    };
uint8 op_add_ir[]   = { add_ir(r7, 1, r8)    };
uint8 op_add_ii[]   = { add_ii(r7, 1, r8,2)  };

uint8 op_sub_lr[]   = { sub_lr(3, r8)        };
uint8 op_sub_li[]   = { sub_li(3, r8, 2)     };
uint8 op_sub_rr[]   = { sub_rr(r7, r8)       };
uint8 op_sub_ri[]   = { sub_ri(r7, r8, 2)    };
uint8 op_sub_ir[]   = { sub_ir(r7, 1, r8)    };
uint8 op_sub_ii[]   = { sub_ii(r7, 1, r8, 2) };

uint8 op_mul_lr[]   = { mul_lr(3, r8)       };
uint8 op_mul_li[]   = { mul_li(3, r8, 2)    };
uint8 op_mul_rr[]   = { mul_rr(r7, r8)       };
uint8 op_mul_ri[]   = { mul_ri(r7, r8, 2)    };
uint8 op_mul_ir[]   = { mul_ir(r7, 1, r8)    };
uint8 op_mul_ii[]   = { mul_ii(r7, 1, r8, 2) };

uint8 op_div_lr[]   = { div_lr(3, r8)        };
uint8 op_div_li[]   = { div_li(3, r8, 2)     };
uint8 op_div_rr[]   = { div_rr(r7, r8)       };
uint8 op_div_ri[]   = { div_ri(r7, r8, 2)    };
uint8 op_div_ir[]   = { div_ir(r7, 1, r8)    };
uint8 op_div_ii[]   = { div_ii(r7, 1, r8, 2) };


