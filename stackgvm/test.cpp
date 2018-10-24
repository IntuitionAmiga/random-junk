#include <cstdio>
namespace Opcode {
  enum {
    // Untyped instructions ////////////////////////////////////////////////////////////////////////////////////////////

    _HCF = 0, // Halt and catch fire
    _BRAS,    // Branch to a signed 8-bit offset
    _BRA,     // Branch to a signed 16-bit offset
    _BCALL,   // Call an anonymous local function
    _CALL,    // Call a named function by ID
    _ICALL_L, // Call a named function by ID stored in local refrence
    _ICALL_I, // Call a named function by ID stored in an indirect reference
    _HCALL,   // Call a host function
    _RET,     // Return from the current function

    _LLBNN,    // Load indirect to indirection register and branch if not null

    // Scalar instructions (float or integer) //////////////////////////////////////////////////////////////////////////

    _BEZ_L,    // Branch to a signed 16-bit offset if local is equal to zero
    _BEZ_I,    // Branch to a signed 16-bit offset if indirect is equal to zero
    _BNZ_L,    // Branch to a signed 16-bit offset if local is not equal to zero
    _BNZ_I,    // Branch to a signed 16-bit offset if indirect is not equal to zero
    _BEQ_LL,   // Branch to a signed 16-bit offset if two local values are equal
    _BEQ_LI,   // Branch to a signed 16-bit offset if local and indirect values are equal
    _BEQ_II,   // Branch to a signed 16-bit offset if two indirect values are equal


    _LADDR_CL, // Load code synbol to local variable
    _LADDR_CI, // Load code symbol to indirect variable
    _LADDR_LL, // Get address of local variable into local variable
    _LADDR_DL, // Load the address of a global data symbol to a local variable
    _LADDR_DI, // Load the address of a global data symbol to an indirect variable
    _LADDR_DX, // Load the address of a global data synbol directly into an index register

    _LOAD_LX, // Load local reference to index register
    _SAVE_XL, // Save indirection index to local

    _LOAD_HL,  // Load host lookup to local

    _COPY_LL,  // Copy a local scalar to a local scalar
    _COPY_IL,  // Copy an indirect scalar to a local
    _COPY_LI,  // Copy a local scalar to an indirect
    _COPY_II,  // Copy an indirect scalar to another indirect

    _ITOF_LL,  // Cast float to integer
    _FTOI_LL,  // Cast integer to float

    // Integer specific instructions ///////////////////////////////////////////////////////////////////////////////////

    // Two operand branch if greater or equal
    _BGE_LL,
    _BGE_IL,
    _BGE_LI,
    _BGE_II,

    // Two operand branch if greater than
    _BGT_LL,
    _BGT_IL,
    _BGT_LI,
    _BGT_II,

    _DBNZ_L,   // Decrement local and branch if not zero

    // Load small literal integer
    _LOAD_SL,
    _LOAD_SI,

    // Single bit operations
    _BSET_SL, // Set bit in local
    _BSET_SI, // Set bit in indirect
    _BCLR_SL, // Clear bit in local
    _BCLR_SI, // Clear bit in indirect
    _BBS_LS,  // Branch if bit is set (local)
    _BBS_IS,  // Branch if bit is set (indirect)
    _BBC_LS,  // Branch if bit is clear (local)
    _BBC_IS,  // Branch if bit os clear (indirect)


    // Two operand logical negate
    _NOT_LL,
    _NOT_IL,
    _NOT_LI,
    _NOT_II,

    // Two operand integer negate
    _NEG_LL,
    _NEG_IL,
    _NEG_LI,
    _NEG_II,

    // Three operand integer addition
    _ADD_LLL, // Commutative, 5 unique variants
    _ADD_ILL,
    _ADD_LLI,
    _ADD_ILI,
    _ADD_III,

    // Three operand integer subtraction
    _SUB_LLL, // Noncommutative, all 8 variants needed
    _SUB_ILL,
    _SUB_LLI,
    _SUB_ILI,
    _SUB_LIL,
    _SUB_IIL,
    _SUB_LII,
    _SUB_III,

    // Three operand integer multiplication
    _MUL_LLL, // Commutative, 5 unique variants
    _MUL_ILL,
    _MUL_LLI,
    _MUL_ILI,
    _MUL_III,

    // Three operand integer division
    _DIV_LLL, // Noncommutative, all 8 variants needed
    _DIV_ILL,
    _DIV_LLI,
    _DIV_ILI,
    _DIV_LIL,
    _DIV_IIL,
    _DIV_LII,
    _DIV_III,

    // Three operand integer modulo
    _MOD_LLL, // Noncommutative, all 8 variants needed
    _MOD_ILL,
    _MOD_LLI,
    _MOD_ILI,
    _MOD_LIL,
    _MOD_IIL,
    _MOD_LII,
    _MOD_III,

    // Three operand logical AND
    _AND_LLL, // Commutative, 5 unique variants
    _AND_ILL,
    _AND_LLI,
    _AND_ILI,
    _AND_III,

    // Three operand logical OR
    _OR_LLL, // Commutative, 5 unique variants
    _OR_ILL,
    _OR_LLI,
    _OR_ILI,
    _OR_III,

    // Three operand logical XOR
    _XOR_LLL, // Commutative, 5 unique variants
    _XOR_ILL,
    _XOR_LLI,
    _XOR_ILI,
    _XOR_III,

    // Three operand logical shift left
    _LSL_LLL, // Noncommutative
    _LSL_ILL,
    _LSL_LLI,
    _LSL_ILI,

    // Three operand logical shift right
    _LSR_LLL, // Noncommutative
    _LSR_ILL,
    _LSR_LLI,
    _LSR_ILI,

    // Bitfield operations. Extract or insert a field of up to 8-bits within an integer
    _BFX_LSL, // Extract n bitfield
    _BFX_ISL, // Extract a bitfield
    _BFX_LSI, // Extract a bitfield
    _BFI_LSL, // Insert a bitfield
    _BFI_ISL, // Insert a bitfield
    _BFI_LSI, // Insert a bitfield

    _MAX_LLL, // Commutative, 5 unique variants
    _MAX_ILL,
    _MAX_LLI,
    _MAX_ILI,
    _MAX_III,

    _MIN_LLL, // Commutative, 5 unique variants
    _MIN_ILL,
    _MIN_LLI,
    _MIN_ILI,
    _MIN_III,

    // Floating point specific instructions ////////////////////////////////////////////////////////////////////////////

    // Two operand branch if greater or equal
    _FBGE_LL,
    _FBGE_IL,
    _FBGE_LI,
    _FBGE_II,

    // Two operand branch if greater than
    _FBGT_LL,
    _FBGT_IL,
    _FBGT_LI,
    _FBGT_II,

    // Two operand, local to local handy maths functions
    _FINV_LL,  // Reciprocal
    _FSQRT_LL, // Square root
    _INVSQ_LL, // Inverse square
    _FSIN_LL,  // Sine
    _FCOS_LL,  // Cosine
    _FACOS_LL, // Arccosine
    _FPOW_LL,  // Power


    // Two operand float negate
    _FNEG_LL,
    _FNEG_IL,
    _FNEG_LI,
    _FNEG_II,

    // Three operand float addition
    _FADD_LLL, // Commutative, 5 unique variants
    _FADD_ILL,
    _FADD_LLI,
    _FADD_ILI,
    _FADD_III,

    // Three operand float subtraction
    _FSUB_LLL, // Noncommutative
    _FSUB_ILL,
    _FSUB_LLI,
    _FSUB_ILI,
    _FSUB_LIL,
    _FSUB_IIL,
    _FSUB_LII,
    _FSUB_III,

    // Three operand float multiplication
    _FMUL_LLL, // Commutative, 5 unique variants
    _FMUL_ILL,
    _FMUL_LLI,
    _FMUL_ILI,
    _FMUL_III,

    // Three operand float division
    _FDIV_LLL, // Noncommutative
    _FDIV_ILL,
    _FDIV_LLI,
    _FDIV_ILI,
    _FDIV_LIL,
    _FDIV_IIL,
    _FDIV_LII,
    _FDIV_III,

    // Three operand float modulo
    _FMOD_LLL, // Noncommutative
    _FMOD_ILL,
    _FMOD_LLI,
    _FMOD_ILI,
    _FMOD_LIL,
    _FMOD_IIL,
    _FMOD_LII,
    _FMOD_III,

    _FMAX_LLL, // Commutative, 5 unique variants
    _FMAX_ILL,
    _FMAX_LLI,
    _FMAX_ILI,
    _FMAX_III,

    _FMIN_LLL, // Commutative, 5 unique variants
    _FMIN_ILL,
    _FMIN_LLI,
    _FMIN_ILI,
    _FMIN_III,

    // Vector specific instructions ////////////////////////////////////////////////////////////////////////////////////

    // Vector branch if equal
    _VBEQ_LL,
    _VBEQ_IL,
    _VBEQ_II,

    // Vector branch if not equal
    _VBNE_LL,
    _VBNE_IL,
    _VBNE_II,

    // Two operand Vector instructions
    _VCOPY_LL,
    _VCOPY_IL,
    _VCOPY_LI,
    _VCOPY_II,

    // Vector negate
    _VNEG_LL,
    _VNEG_IL,
    _VNEG_LI,
    _VNEG_II,

    // Vector normalize
    _VNORM_LL,
    _VNORM_IL,
    _VNORM_LI,
    _VNORM_II,

    // Vector magnitude (scalar result)
    _VMAG_LL,
    _VMAG_IL,
    _VMAG_LI,
    _VMAG_II,

    // Three operand vector instructions

    // Vector addition
    _VADD_LLL, // Commutative
    _VADD_ILL,
    _VADD_LLI,
    _VADD_ILI,
    _VADD_III,

    // Vector subtraction
    _VSUB_LLL, // Noncommutative
    _VSUB_ILL,
    _VSUB_LLI,
    _VSUB_ILI,
    _VSUB_LIL,
    _VSUB_IIL,
    _VSUB_LII,
    _VSUB_III,

    // Dot product (scalar result)
    _VDOT_LLL, // Commutative
    _VDOT_ILL,
    _VDOT_LLI,
    _VDOT_ILI,
    _VDOT_III,

    // Cross product (vector result)
    _VCROSS_LLL, // Noncommutative
    _VCROSS_ILL,
    _VCROSS_LLI,
    _VCROSS_ILI,
    _VCROSS_LIL,
    _VCROSS_IIL,
    _VCROSS_LII,
    _VCROSS_III,

    // Vector multiply by float
    _VFMUL_LLL, // Commutative, but different input operand types
    _VFMUL_ILL,
    _VFMUL_LLI,
    _VFMUL_ILI,
    _VFMUL_LIL,
    _VFMUL_IIL,
    _VFMUL_LII,
    _VFMUL_III,

    _MAX
  };

};
int main() {
  std::printf("Total definitions %d\n", Opcode::_MAX);
  return 0;
}