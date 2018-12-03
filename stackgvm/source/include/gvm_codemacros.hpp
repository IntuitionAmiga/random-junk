/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#ifndef _GVM_CODEMACROS_HPP_
    #define _GVM_CODEMACROS_HPP_

#define _OP(x)  (uint8)Opcode::_##x
#define _D8(x)  (uint8)(x)
#define _D16(x) (uint8)((x) >> 8), (uint8)((x) & 0xFF)

#define SYM(x)  (uint8)((x) >> 8), (uint8)((x) & 0xFF)
#define OFS(x)  (uint8)((x) >> 8), (uint8)((x) & 0xFF)

#define hcf     _OP(HCF),
#define bras    _OP(BRAS),
#define bra     _OP(BRA),
#define bcall   _OP(BCALL),
#define call    _OP(CALL),
#define icall   _OP(ICALL_L),
#define icall_l _OP(ICALL_L),
#define icall_i _OP(ICALL_I),
#define hcall   _OP(HCALL),
#define ret     _OP(RET),
#define li0bnn  _OP(LI0BNN),
#define li1bnn  _OP(LI0BNN),
#define bez     _OP(BEZ_L),
#define bez_l   _OP(BEZ_L),
#define bez_i   _OP(BEZ_I),
#define bnz     _OP(BNZ_L),
#define bnz_l   _OP(BNZ_L),
#define bnz_i   _OP(BNZ_I),
#define beq     _OP(BEQ_LL),
#define beq_ll  _OP(BEQ_LL),
#define beq_li  _OP(BEQ_LI),
#define beq_ii  _OP(BEQ_II),

// _ADDR_LL,  // Get address of local variable into local variable
// _ADDR_I0L, // Get the address of an indirect[0] variable into local variable
// _ADDR_I1L, // Get the address of an indirect[1] variable into a local variable
//
// _ADDR_DL, // Load the address of a global data symbol to a local variable
// _ADDR_DI0, // Load the address of a global data symbol to an indirect[0] variable
// _ADDR_DI1, // Load the address of a global data symbol to an indirect[1] variable
//
// _ADDR_D0, // Load the address of a global data synbol directly into indirect[0]
// _ADDR_D1, // Load the address of a global data synbol directly into indirect[1]
//
// _ADDR_CL, // Load code synbol to local variable
// _ADDR_CI0, // Load code symbol to an indirect[0] variable
// _ADDR_CI1, // Load code symbol to an indirect[1] variable
//
// _LOAD_L0, // Load local reference directly into indirect[0]
// _LOAD_L1, // Load local reference directly into indirect[1]
//
// _SAVE_0L, // Save indirect[0] to local reference
// _SAVE_1L, // Save indirect[1] to local reference
//
// _LOAD_HL,  // Load host lookup to local
//
#define copy_ll _OP(COPY_LL),
// _COPY_I0L,  // Copy an indirect[0] scalar to a local
// _COPY_I1L,  // Copy an indirect[1] scalar to a local
//
// _COPY_LI0,  // Copy a local scalar to indirect[0] variable
// _COPY_LI1,  // Copy a local scalar to indirect[1] variable
// _COPY_II,  // Copy an indirect scalar to another indirect
//
// _ITOF_LL,  // Cast float to integer
// _FTOI_LL,  // Cast integer to float
//
// // Integer specific instructions ///////////////////////////////////////////////////////////////////////////
//
// // Two operand branch if greater or equal
// _BGE_LL,
// _BGE_IL,
// _BGE_LI,
// _BGE_II,
//
// // Two operand branch if greater than
// _BGT_LL,
// _BGT_IL,
// _BGT_LI,
// _BGT_II,
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
#define not_ll _OP(NOT_LL),
#define not_il _OP(NOT_IL),
#define not_li _OP(NOT_LI),
#define not_ii _OP(NOT_II),
//
// // Two operand integer negate
#define neg_ll _OP(NEG_LL),
#define neg_il _OP(NEG_IL),
#define neg_li _OP(NEG_LI),
#define neg_ii _OP(NEG_II),
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
// _FADD_LLL,
// _FADD_ILL,
// _FADD_LLI,
// _FADD_ILI,
//
// // Three operand float subtraction: Noncommutative, 7 unique variants
// _FSUB_LLL,
// _FSUB_ILL,
// _FSUB_LLI,
// _FSUB_ILI,
// _FSUB_LIL,
// _FSUB_IIL,
// _FSUB_LII,
//
// // Three operand float multiplication: Commutative, 4 unique variants
// _FMUL_LLL,
// _FMUL_ILL,
// _FMUL_LLI,
// _FMUL_ILI,
//
// // Three operand float division: Noncommutative, 7 unique variants
// _FDIV_LLL,
// _FDIV_ILL,
// _FDIV_LLI,
// _FDIV_ILI,
// _FDIV_LIL,
// _FDIV_IIL,
// _FDIV_LII,
//
// // Three operand float modulo: Noncommutative, 7 unique variants
// _FMOD_LLL,
// _FMOD_ILL,
// _FMOD_LLI,
// _FMOD_ILI,
// _FMOD_LIL,
// _FMOD_IIL,
// _FMOD_LII,
//
// // Floating Point Maximum: Commutative, 4 unique variants
// _FMAX_LLL,
// _FMAX_ILL,
// _FMAX_LLI,
// _FMAX_ILI,
//
// // Floating Point Minimum: Commutative, 4 unique variants
// _FMIN_LLL,
// _FMIN_ILL,
// _FMIN_LLI,
// _FMIN_ILI,
//
// // Vector specific instructions ////////////////////////////////////////////////////////////////////////////
//
// // Vector branch if equal
// _VBEQ_LL,
// _VBEQ_IL,
// _VBEQ_II,
//
// // Vector branch if not equal
// _VBNE_LL,
// _VBNE_IL,
// _VBNE_II,
//
// // Two operand Vector instructions
// _VCOPY_LL,
// _VCOPY_IL,
// _VCOPY_LI,
// _VCOPY_II,
//
// // Vector negate
// _VNEG_LL,
// _VNEG_IL,
// _VNEG_LI,
// _VNEG_II,
//
// // Vector normalize
// _VNORM_LL,
// _VNORM_IL,
// _VNORM_LI,
// _VNORM_II,
//
// // Vector magnitude (scalar result)
// _VMAG_LL,
// _VMAG_IL,
// _VMAG_LI,
// _VMAG_II,
//
// // Three operand vector instructions
//
// // Vector addition: Commutative, 4 unique variants
// _VADD_LLL,
// _VADD_ILL,
// _VADD_LLI,
// _VADD_ILI,
//
// // Vector subtraction: Noncommutative, 7 unique variants
// _VSUB_LLL,
// _VSUB_ILL,
// _VSUB_LLI,
// _VSUB_ILI,
// _VSUB_LIL,
// _VSUB_IIL,
// _VSUB_LII,
//
// // Dot product (scalar result): Commutative, 4 unique variants
// _VDOT_LLL,
// _VDOT_ILL,
// _VDOT_LLI,
// _VDOT_ILI,
//
// // Cross product (vector result): Noncommutative, 7 unique variants
// _VCROSS_LLL,
// _VCROSS_ILL,
// _VCROSS_LLI,
// _VCROSS_ILI,
// _VCROSS_LIL,
// _VCROSS_IIL,
// _VCROSS_LII,
//
// // Vector multiply by float: Commutative, 7 variants due to different input operand types
// _VFMUL_LLL,
// _VFMUL_ILL,
// _VFMUL_LLI,
// _VFMUL_ILI,
// _VFMUL_LIL,
// _VFMUL_IIL,
// _VFMUL_LII,

#endif
