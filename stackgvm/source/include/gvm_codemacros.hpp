/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#ifndef _GVM_CODEMACROS_HPP_
    #define _GVM_CODEMACROS_HPP_

#define GFUNC(name) uint8 _gvm_##name [] =

#define _OP(x)  (uint8)Opcode::_##x
#define _D8(x)  (uint8)(x)
#define _D16(x) (uint8)((x) >> 8), (uint8)((x) & 0xFF)

#define SYM(x)  (uint8)((x) >> 8), (uint8)((x) & 0xFF)
#define OFS(x)  (uint8)((x) >> 8), (uint8)((x) & 0xFF)

#define LOC(x)  L, x
#define IND(x)  I, x

#define hcf              _OP(HCF),
#define bras(j)          _OP(BRAS),         _D8(j),
#define bra(j)           _OP(BRA),          _D8(j),
#define bcall(j)         _OP(BCALL),        _D16(j),
#define call(f)          _OP(CALL),         _D16(f),
#define icall_l(l)       _OP(ICALL_L),      _D8(l),
#define icall_i(i)       _OP(ICALL_I),      _D8(i),
#define hcall(f)         _OP(HCALL),        _D16(f),
#define ret              _OP(RET),
#define libnn(I,i,j)     _OP(LI##I##BNN),   _D8(i),   _D16(j),
#define bez_l(l,j)       _OP(BEZ_L),        _D8(l),   _D16(j),
#define bez_i(i,j)       _OP(BEZ_I),        _D8(i),   _D16(j),
#define bnz_l(l,j)       _OP(BNZ_L),        _D8(l),   _D16(j),
#define bnz_i(i,j)       _OP(BNZ_I),        _D8(i),   _D16(j),
#define beq_ll(l1,l2,j)  _OP(BEQ_LL),       _D8(l1),  _D8(l2), _D16(j),
#define beq_li(l,i,j)    _OP(BEQ_LI),       _D8(l),   _D8(i),  _D16(j),
#define beq_ii(i1,i2,j)  _OP(BEQ_II),       _D8(i1),  _D8(i2), _D16(j),

#define addr_ll(l1,l2)   _OP(ADDR_LL),      _D8(l1),  _D8(l2),
#define addr_il(I,i,l)   _OP(ADDR_I##I##L), _D8(i),   _D8(l),
#define addr_dl(G,l)     _OP(ADDR_DL),      _D16(G),  _D8(l),
#define addr_d(G,I)      _OP(ADDR_D##I),    _D16(G),
#define addr_cl(f,l)     _OP(ADDR_CL),      _D16(f),  _D8(l),
#define addr_ci(f,I,i)   _OP(ADDR_CI##I)    _D16(f),  _D8(i),


#define load_li(l,I)      _OP(LOAD_L##I),    _D8(l),
#define save_il(I,l)      _OP(SAVE_##I##L),  _D8(l),
#define load_hl(h,l)      _OP(LOAD_HL),      _D8(h), _D8(l),

#define copy_ll(l1,l2)    _OP(COPY_LL),      _D8(l1), _D8(l2),
#define copy_il(I,i,l)    _OP(COPY_I##I##L), _D8(i),  _D8(l),
#define copy_li(l,I,i)    _OP(COPY_LI##I),   _D8(l),  _D8(i),
#define copy_ii(i1,i2)    _OP(COPY_II),      _D8(i1), _D8(i2),

#define copy_(M0, a0, M1, a1) _OP(COPY_##M0##M1), _D8(a0), _D8(a1),

#define itof_ll(l1,l2)    _OP(ITOF_LL),      _D8(l1), _D8(l2),
#define ftoi_ll(l1,l2)    _OP(FTOI_LL),      _D8(l1), _D8(l2),

//
// // Two operand branch if greater or equal
#define bge_ll(l1,l2,j)   _OP(BGE_LL),       _D8(l1), _D8(l2),  _D16(j),
#define bge_il(i,l,j)     _OP(BGE_IL),       _D8(i),  _D8(l),   _D16(j),
#define bge_li(l,i,j)     _OP(BGE_LI),       _D8(l),  _D8(i),   _D16(j),
#define bge_ii(i1,i2,j)   _OP(BGE_II),       _D8(i1), _D8(i2),  _D16(j),
//
// // Two operand branch if greater than
#define bgt_ll(l1,l2,j)   _OP(BGT_LL),       _D8(l1), _D8(l2),  _D16(j),
#define bgt_il(i,l,j)     _OP(BGT_IL),       _D8(i),  _D8(l),   _D16(j),
#define bgt_li(l,i,j)     _OP(BGT_LI),       _D8(l),  _D8(i),   _D16(j),
#define bgt_ii(i1,i2,j)   _OP(BGT_II),       _D8(i1), _D8(i2),  _D16(j),
//
// _DBNZ_L,   // Decrement local and branch if not zero
//
// // Load small literal integer
// _LOAD_SL,
// _LOAD_SI,
//
// // Single bit operations
// _BSET_SL, // Set bit in local
// _BSET_SI, // Set bit in indirect
// _BCLR_SL, // Clear bit in local
// _BCLR_SI, // Clear bit in indirect
// _BBS_SL,  // Branch if bit is set (local)
// _BBS_SI,  // Branch if bit is set (indirect)
// _BBC_SL,  // Branch if bit is clear (local)
// _BBC_SI,  // Branch if bit os clear (indirect)
//
// // Two operand logical negate
#define not_ll(l1,l2) _OP(NOT_LL),       _D8(l1), _D8(l2),
#define not_il(i,l)   _OP(NOT_IL),       _D8(i),  _D8(l),
#define not_li(l,i)   _OP(NOT_LI),       _D8(l),  _D8(i),
#define not_ii(i1,i2) _OP(NOT_II),       _D8(i1), _D8(i2),
//
// // Two operand integer negate
#define neg_ll(l1,l2) _OP(NEG_LL),       _D8(l1), _D8(l2),
#define neg_il(i,l)   _OP(NEG_IL),       _D8(i),  _D8(l),
#define neg_li(l,i)   _OP(NEG_LI),       _D8(l),  _D8(i),
#define neg_ii(i1,i2) _OP(NEG_II),       _D8(i1), _D8(i2),
//
// // Three operand integer addition: Commutative, 4 unique variants
#define add_lll _OP(ADD_LLL),
#define add_ill _OP(ADD_ILL),
#define add_lli _OP(ADD_LLI),
#define add_ili _OP(ADD_ILI),
//
// // Three operand integer subtraction: Noncommutative, 7 unique variants
#define sub_lll _OP(SUB_LLL),
#define sub_ill _OP(SUB_ILL),
#define sub_lli _OP(SUB_LLI),
#define sub_ili _OP(SUB_ILI),
#define sub_lil _OP(SUB_LIL),
#define sub_iil _OP(SUB_IIL),
#define sub_lii _OP(SUB_LII),
//
// // Three operand integer multiplication: Commutative, 4 unique variants
#define mul_lll _OP(MUL_LLL),
#define mul_ill _OP(MUL_ILL),
#define mul_lli _OP(MUL_LLI),
#define mul_ili _OP(MUL_ILI),
//
// // Three operand integer division: Noncommutative, 7 unique variants
#define div_lll _OP(DIV_LLL),
#define div_ill _OP(DIV_ILL),
#define div_lli _OP(DIV_LLI),
#define div_ili _OP(DIV_ILI),
#define div_lil _OP(DIV_LIL),
#define div_iil _OP(DIV_IIL),
#define div_lii _OP(DIV_LII),
//
// // Three operand integer modulo: Noncommutative, 7 unique variants
#define mod_lll _OP(MOD_LLL),
#define mod_ill _OP(MOD_ILL),
#define mod_lli _OP(MOD_LLI),
#define mod_ili _OP(MOD_ILI),
#define mod_lil _OP(MOD_LIL),
#define mod_iil _OP(MOD_IIL),
#define mod_lii _OP(MOD_LII),
//
// // Three operand logical AND: Commutative, 4 unique variants
#define and_lll _OP(AND_LLL),
#define and_ill _OP(AND_ILL),
#define and_lli _OP(AND_LLI),
#define and_ili _OP(AND_ILI),
//
// // Three operand logical OR: Commutative, 4 unique variants
#define or_lll _OP(OR_LLL),
#define or_ill _OP(OR_ILL),
#define or_lli _OP(OR_LLI),
#define or_ili _OP(OR_ILI),
//
// // Three operand logical XOR: Commutative, 4 unique variants
#define xor_lll _OP(XOR_LLL),
#define xor_ill _OP(XOR_ILL),
#define xor_lli _OP(XOR_LLI),
#define xor_ili _OP(XOR_ILI),
//
// // Three operand logical shift left: Noncommutative, 4 supported variants
#define lsl_lll _OP(LSL_LLL),
#define lsl_ill _OP(LSL_ILL),
#define lsl_lli _OP(LSL_LLI),
#define lsl_ili _OP(LSL_ILI),
//
// // Three operand logical shift right: Noncommutative, 4 supported variants
#define lsr_lll _OP(LSR_LLL),
#define lsr_ill _OP(LSR_ILL),
#define lsr_lli _OP(LSR_LLI),
#define lsr_ili _OP(LSR_ILI),
//
// // Integer Maximum: Commutative, 4 unique variants
#define max_lll _OP(MAX_LLL),
#define max_ill _OP(MAX_ILL),
#define max_lli _OP(MAX_LLI),
#define max_ili _OP(MAX_ILI),
//
// // Integer Minumum: Commutative, 4 unique variants
#define min_lll_OP(MIN_LLL),
#define min_ill _OP(MIN_ILL),
#define min_lli _OP(MIN_LLI),
#define min_ili _OP(MIN_ILI),
//
// // Floating point specific instructions ////////////////////////////////////////////////////////////////////
//
// // Two operand branch if greater or equal
#define fbge_ll _OP(FBGE_LL),
#define fbge_il _OP(FBGE_IL),
#define fbge_li _OP(FBGE_LI),
#define fbge_ii _OP(FBGE_II),
//
// // Two operand branch if greater than
#define fbgt_ll _OP(FBGT_LL),
#define fbgt_il _OP(FBGT_IL),
#define fbgt_li _OP(FBGT_LI),
#define fbgt_ii _OP(FBGT_II),
//
// // Two operand, local to local handy maths functions
#define finv_ll   _OP(FINV_LL),
#define fsqrt_ll  _OP(FSQRT_LL),
#define fisqr_ll  _OP(INVSQ_LL),
#define fsin_ll   _OP(FSIN_LL),
#define fcos_ll   _OP(FCOS_LL),
#define facos_ll  _OP(FACOS_LL),
//
//
// // Two operand float negate
#define fneg_ll _OP(FNEG_LL),
#define fneg_il _OP(FNEG_IL),
#define fneg_li _OP(FNEG_LI),
#define fneg_ii _OP(FNEG_II),
//
// // Three operand float addition: Commutative, 4 unique variants
#define fadd_lll _OP(FADD_LLL),
#define fadd_ill _OP(FADD_ILL),
#define fadd_lli _OP(FADD_LLI),
#define fadd_ili _OP(FADD_ILI),
//
// // Three operand float subtraction: Noncommutative, 7 unique variants
#define fsub_lll _OP(FSUB_LLL),
#define fsub_ill _OP(FSUB_ILL),
#define fsub_lli _OP(FSUB_LLI),
#define fsub_lil _OP(FSUB_ILI),
#define fsub_lil _OP(FSUB_LIL),
#define fsub_lii _OP(FSUB_IIL),
#define fsub_lii _OP(FSUB_LII),
//
// // Three operand float multiplication: Commutative, 4 unique variants
#define fmul_lll _OP(FMUL_LLL),
#define fmul_ill _OP(FMUL_ILL),
#define fmul_lli _OP(FMUL_LLI),
#define fmul_ili _OP(FMUL_ILI),
//
// // Three operand float division: Noncommutative, 7 unique variants
#define fdiv_lll _OP(FDIV_LLL),
#define fdiv_ill _OP(FDIV_ILL),
#define fdiv_lli _OP(FDIV_LLI),
#define fdiv_ili _OP(FDIV_ILI),
#define fdiv_lil _OP(FDIV_LIL),
#define fdiv_iil _OP(FDIV_IIL),
#define fdiv_lii _OP(FDIV_LII),
//
// // Three operand float modulo: Noncommutative, 7 unique variants
#define fmod_lll _OP(FMOD_LLL),
#define fmod_ill _OP(FMOD_ILL),
#define fmod_lli _OP(FMOD_LLI),
#define fmod_ili _OP(FMOD_ILI),
#define fmod_lil _OP(FMOD_LIL),
#define fmod_iil _OP(FMOD_IIL),
#define fmod_lii _OP(FMOD_LII),
//
// // Floating Point Maximum: Commutative, 4 unique variants
#define fmax_lll _OP(FMAX_LLL),
#define fmax_ill _OP(FMAX_ILL),
#define fmax_lli _OP(FMAX_LLI),
#define fmax_ili _OP(FMAX_ILI),
//
// // Floating Point Minimum: Commutative, 4 unique variants
#define fmin_lll _OP(FMIN_LLL),
#define fmin_ill _OP(FMIN_ILL),
#define fmin_lli _OP(FMIN_LLI),
#define fmin_ili _OP(FMIN_ILI),
//
// // Vector specific instructions ////////////////////////////////////////////////////////////////////////////
//
// // Vector branch if equal
#define vbeq_ll _OP(VBEQ_LL),
#define vbeq_il _OP(VBEQ_IL),
#define vbeq_ii _OP(VBEQ_II),
//
// // Vector branch if not equal
#define vbne_ll _OP(VBNE_LL),
#define vbne_il _OP(VBNE_IL),
#define vbne_ii _OP(VBNE_II),
//
// // Two operand Vector instructions
#define vcopy_ll _OP(VCOPY_LL),
#define vcopy_il _OP(VCOPY_IL),
#define vcopy_li _OP(VCOPY_LI),
#define vcopy_ii _OP(VCOPY_II),
//
// // Vector negate
#define vneg_ll _OP(VNEG_LL),
#define vneg_il _OP(VNEG_IL),
#define vneg_li _OP(VNEG_LI),
#define vneg_ii _OP(VNEG_II),
//
// // Vector normalize
#define vnorm_ll _OP(VNORM_LL),
#define vnorm_il _OP(VNORM_IL),
#define vnorm_li _OP(VNORM_LI),
#define vnorm_ii _OP(VNORM_II),
//
// // Vector magnitude (scalar result)
#define vmag_ll _OP(VMAG_LL),
#define vmag_il _OP(VMAG_IL),
#define vmag_li _OP(VMAG_LI),
#define vmag_ii _OP(VMAG_II),
//
// // Three operand vector instructions
//
// // Vector addition: Commutative, 4 unique variants
#define vadd_lll _OP(VADD_LLL),
#define vadd_ill _OP(VADD_ILL),
#define vadd_lli _OP(VADD_LLI),
#define vadd_ili _OP(VADD_ILI),
//
// // Vector subtraction: Noncommutative, 7 unique variants
#define vsub_lll _OP(VSUB_LLL),
#define vsub_ill _OP(VSUB_ILL),
#define vsub_lli _OP(VSUB_LLI),
#define vsub_ili _OP(VSUB_ILI),
#define vsub_lil _OP(VSUB_LIL),
#define vsub_iil _OP(VSUB_IIL),
#define vsub_lii _OP(VSUB_LII),
//
// // Dot product (scalar result): Commutative, 4 unique variants
#define vdot_lll _OP(VDOT_LLL),
#define vdot_ill _OP(VDOT_ILL),
#define vdot_lli _OP(VDOT_LLI),
#define vdot_ili _OP(VDOT_ILI),
//
// // Cross product (vector result): Noncommutative, 7 unique variants
#define vcross_lll _OP(VCROSS_LLL),
#define vcross_ill _OP(VCROSS_ILL),
#define vcross_lli _OP(VCROSS_LLI),
#define vcross_ili _OP(VCROSS_ILI),
#define vcross_lil _OP(VCROSS_LIL),
#define vcross_iil _OP(VCROSS_IIL),
#define vcross_lii _OP(VCROSS_LII),
//
// // Vector multiply by float: Commutative, 7 variants due to different input operand types
#define vfmul_lll _OP(VFMUL_LLL),
#define vfmul_ill _OP(VFMUL_ILL),
#define vfmul_lli _OP(VFMUL_LLI),
#define vfmul_ili _OP(VFMUL_ILI),
#define vfmul_lil _OP(VFMUL_LIL),
#define vfmul_iil _OP(VFMUL_IIL),
#define vfmul_lii _OP(VFMUL_LII),

#endif
