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


uint8 inst_nop[]     = { nop };
uint8 inst_bras[]    = { bras(-2) };
uint8 inst_bra[]     = { bra(-2) };
uint8 inst_bcall[]   = { bcall(-1) };
uint8 inst_call[]    = { call(0xFFFF) };
uint8 inst_call_r[]  = { call_r(r7) };
uint8 inst_call_i[]  = { call_i(r7, 1) };
uint8 inst_call_h[]  = { call_h(0xFFFF) };
uint8 inst_ret[]     = { ret };
uint8 inst_dbnz[]    = { dbnz(r7, -2) };
uint8 inst_ldbnn[]   = { ldbnn(r7, 1, r8, -2) };
uint8 inst_bez_r[]   = { bez_r(r7, -2) };
uint8 inst_bez_i[]   = { bez_i(r7, 1, -2) };
uint8 inst_bnz_r[]   = { bnz_r(r7, -2) };
uint8 inst_bnz_i[]   = { bnz_i(r7, 1, -2) };
uint8 inst_beq_rr[]  = { beq_rr(r7, r8, -2) };
uint8 inst_beq_ri[]  = { beq_ri(r7, r8, 2, -2) };
uint8 inst_beq_ii[]  = { beq_ii(r7, 1, r8, 2, -2) };
uint8 inst_bge_rr[]  = { bge_rr(r7, r8, -2) };
uint8 inst_bge_ri[]  = { bge_ri(r7, r8, 2, -2) };
uint8 inst_bge_ir[]  = { bge_ir(r7, 1, r8, -2) };
uint8 inst_bge_ii[]  = { bge_ii(r7, 1, r8, 2, -2) };
uint8 inst_bgt_rr[]  = { bgt_rr(r7, r8, -2) };
uint8 inst_bgt_ri[]  = { bgt_ri(r7, r8, 2, -2) };
uint8 inst_bgt_ir[]  = { bgt_ir(r7, 1, r8, -2) };
uint8 inst_bgt_ii[]  = { bgt_ii(r7, 1, r8, 2, -2) };
uint8 inst_fbeq_rr[] = { fbge_rr(r7, r8, -2) };
uint8 inst_fbeq_ri[] = { fbge_ri(r7, r8, 2, -2) };
uint8 inst_fbeq_ii[] = { fbge_ii(r7, 1, r8, 2, -2) };
uint8 inst_fbge_rr[] = { fbge_rr(r7, r8, -2) };
uint8 inst_fbge_ri[] = { fbge_ri(r7, r8, 2, -2) };
uint8 inst_fbge_ir[] = { fbge_ir(r7, 1, r8, -2) };
uint8 inst_fbge_ii[] = { fbge_ii(r7, 1, r8, 2, -2) };
uint8 inst_fbgt_rr[] = { fbgt_rr(r7, r8, -2) };
uint8 inst_fbgt_ri[] = { fbgt_ri(r7, r8, 2, -2) };
uint8 inst_fbgt_ir[] = { fbgt_ir(r7, 1, r8, -2) };
uint8 inst_fbgt_ii[] = { fbgt_ii(r7, 1, r8, 2, -2) };
uint8 inst_vbeq_ii[] = { vbeq_ii(r7, 1, r8, 2, -2) };
uint8 inst_vbeq_ia[] = { vbeq_ia(r7, 1, -2) };
uint8 inst_vbne_ii[] = { vbne_ii(r7, 1, r8, 2, -2) };
uint8 inst_vbne_ia[] = { vbne_ia(r7, 1, -2) };

uint8 inst_move_lr[] = { move_lr(3, r8) };
uint8 inst_move_li[] = { move_li(3, r8, 2) };

// Float/Integer Move
uint8 inst_move_rr[] = { move_rr(r7, r8) };

uint8 inst_move_ri[] = { move_ri(r7, r8, 2) };
uint8 inst_move_ir[] = { move_ir(r7, 1, r8) };
uint8 inst_move_ii[] = { move_ii(r7, 1, r8, 2) };
uint8 inst_move_mr[] = { move_mr(r8) };
uint8 inst_move_mi[] = { move_mi(r8, 2) };

// Push registers to stack (range)
uint8 inst_pushr[]   = { pushr(r7, r8) };

// Pop registers from stack (range)
uint8 inst_popr[]    = { popr(r7, r8) };

// Allocate Stack Storage
uint8 inst_asf[]     = { asf(r8, 240) };

// Free Stack Storage
uint8 inst_fsf[]     = { fsf(r8, 240) };

// Vec3 Splat
uint8 inst_vspl_li[] = { vspl_li(3, r8, 2) };
uint8 inst_vspl_ri[] = { vspl_ri(r7, r8, 2) };
uint8 inst_vspl_ii[] = { vspl_ii(r7, 1, r8, 2) };
uint8 inst_vspl_la[] = { vspl_la(3) };
uint8 inst_vspl_ra[] = { vspl_ra(r7) };
uint8 inst_vspl_ia[] = { vspl_ia(r7, 1) };


// Vec3 Move
uint8 inst_vmve_ii[] = { vmve_ii(r7, 1, r8, 2) };
uint8 inst_vmve_ia[] = { vmve_ia(r7, 1) };
uint8 inst_vmve_ai[] = { vmve_ai(r8, 2) };

