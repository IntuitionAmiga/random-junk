/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include <cstdlib>
#include "include/gvm_core.hpp"

using namespace GVM;

#define FETCH(o) switch(o)
#define IS(o)    case Opcode::_##o:
#define NEXT     goto forever
#define EXIT(x)  return (x)

Interpreter::Result Interpreter::run() {
    frameStack[0].i = frameStack[1].i + frameStack[2].i;
    return exitFunction();

forever:
    uint8 opcode = *programCounter++;
    FETCH(opcode) {
        IS(HCF)     // Halt and catch fire
            return EXEC_HALT_AND_CATCH_FIRE;

        IS(BRAS)    // Branch to a signed 8-bit offset
        IS(BRA)     // Branch to a signed 16-bit offset
        IS(BCALL)   // Call an anonymous local function
        IS(CALL)    // Call a named function by ID
        IS(ICALL_L) // Call a named function by ID stored in local refrence
        IS(ICALL_I) // Call a named function by ID stored in an indirect reference
        IS(HCALL)   // Call a host function
        IS(RET) {    // Return from the current function
            Result result = exitFunction();
            if (result != SUCCESS) {
                EXIT(result);
            }
            NEXT;
        }

        IS(LLBNN)    // Load indirect to indirection register and branch if not null

        // Scalar instructions (float or integer) //////////////////////////////////////////////////////////////////

        IS(BEZ_L)    // Branch to a signed 16-bit offset if local is equal to zero
        IS(BEZ_I)    // Branch to a signed 16-bit offset if indirect is equal to zero
        IS(BNZ_L)    // Branch to a signed 16-bit offset if local is not equal to zero
        IS(BNZ_I)    // Branch to a signed 16-bit offset if indirect is not equal to zero
        IS(BEQ_LL)   // Branch to a signed 16-bit offset if two local values are equal
        IS(BEQ_LI)   // Branch to a signed 16-bit offset if local and indirect values are equal
        IS(BEQ_II)   // Branch to a signed 16-bit offset if two indirect values are equal

        IS(ADDR_LL) // Get address of local variable into local variable
        IS(ADDR_IL)
        IS(ADDR_DL) // Load the address of a global data symbol to a local variable
        IS(ADDR_DI) // Load the address of a global data symbol to an indirect variable
        IS(ADDR_DX) // Load the address of a global data synbol directly into an index register
        IS(ADDR_CL) // Load code synbol to local variable
        IS(ADDR_CI) // Load code symbol to indirect variable

        IS(LOAD_LX) // Load local reference to index register
        IS(SAVE_XL) // Save indirection index to local

        IS(LOAD_HL)  // Load host lookup to local

        IS(COPY_LL)  // Copy a local scalar to a local scalar
        IS(COPY_IL)  // Copy an indirect scalar to a local
        IS(COPY_LI)  // Copy a local scalar to an indirect
        IS(COPY_II)  // Copy an indirect scalar to another indirect

        IS(ITOF_LL)  // Cast float to integer
        IS(FTOI_LL)  // Cast integer to float

        // Integer specific instructions ///////////////////////////////////////////////////////////////////////////

        // Two operand branch if greater or equal
        IS(BGE_LL)
        IS(BGE_IL)
        IS(BGE_LI)
        IS(BGE_II)

        // Two operand branch if greater than
        IS(BGT_LL)
        IS(BGT_IL)
        IS(BGT_LI)
        IS(BGT_II)

        IS(DBNZ_L)   // Decrement local and branch if not zero

        // Load small literal integer
        IS(LOAD_SL)
        IS(LOAD_SI)

        // Single bit operations
        IS(BSET_SL) // Set bit in local
        IS(BSET_SI) // Set bit in indirect
        IS(BCLR_SL) // Clear bit in local
        IS(BCLR_SI) // Clear bit in indirect
        IS(BBS_LS)  // Branch if bit is set (local)
        IS(BBS_IS)  // Branch if bit is set (indirect)
        IS(BBC_LS)  // Branch if bit is clear (local)
        IS(BBC_IS)  // Branch if bit os clear (indirect)

        // Two operand logical negate
        IS(NOT_LL)
        IS(NOT_IL)
        IS(NOT_LI)
        IS(NOT_II)

        // Two operand integer negate
        IS(NEG_LL)
        IS(NEG_IL)
        IS(NEG_LI)
        IS(NEG_II)

        // Three operand integer addition) Commutative) 4 unique variants
        IS(ADD_LLL)
        IS(ADD_ILL)
        IS(ADD_LLI)
        IS(ADD_ILI)

        // Three operand integer subtraction) Noncommutative) 7 unique variants
        IS(SUB_LLL)
        IS(SUB_ILL)
        IS(SUB_LLI)
        IS(SUB_ILI)
        IS(SUB_LIL)
        IS(SUB_IIL)
        IS(SUB_LII)

        // Three operand integer multiplication) Commutative) 4 unique variants
        IS(MUL_LLL)
        IS(MUL_ILL)
        IS(MUL_LLI)
        IS(MUL_ILI)

        // Three operand integer division) Noncommutative) 7 unique variants
        IS(DIV_LLL)
        IS(DIV_ILL)
        IS(DIV_LLI)
        IS(DIV_ILI)
        IS(DIV_LIL)
        IS(DIV_IIL)
        IS(DIV_LII)

        // Three operand integer modulo) Noncommutative) 7 unique variants
        IS(MOD_LLL)
        IS(MOD_ILL)
        IS(MOD_LLI)
        IS(MOD_ILI)
        IS(MOD_LIL)
        IS(MOD_IIL)
        IS(MOD_LII)

        // Three operand logical AND) Commutative) 4 unique variants
        IS(AND_LLL)
        IS(AND_ILL)
        IS(AND_LLI)
        IS(AND_ILI)

        // Three operand logical OR) Commutative) 4 unique variants
        IS(OR_LLL)
        IS(OR_ILL)
        IS(OR_LLI)
        IS(OR_ILI)

        // Three operand logical XOR) Commutative) 4 unique variants
        IS(XOR_LLLs)
        IS(XOR_ILL)
        IS(XOR_LLI)
        IS(XOR_ILI)

        // Three operand logical shift left) Noncommutative) 4 supported variants
        IS(LSL_LLL)
        IS(LSL_ILL)
        IS(LSL_LLI)
        IS(LSL_ILI)

        // Three operand logical shift right) Noncommutative) 4 supported variants
        IS(LSR_LLL)
        IS(LSR_ILL)
        IS(LSR_LLI)
        IS(LSR_ILI)

        // Bitfield operations. Extract or insert a field of up to 8-bits within an integer
        IS(BFX_LSL) // Extract n bitfield
        IS(BFX_ISL) // Extract a bitfield
        IS(BFX_LSI) // Extract a bitfield
        IS(BFI_LSL) // Insert a bitfield
        IS(BFI_ISL) // Insert a bitfield
        IS(BFI_LSI) // Insert a bitfield

        // Integer Maximum) Commutative) 4 unique variants
        IS(MAX_LLL)
        IS(MAX_ILL)
        IS(MAX_LLI)
        IS(MAX_ILI)

        // Integer Minumum) Commutative) 4 unique variants
        IS(MIN_LLL)
        IS(MIN_ILL)
        IS(MIN_LLI)
        IS(MIN_ILI)

        // Floating point specific instructions ////////////////////////////////////////////////////////////////////

        // Two operand branch if greater or equal
        IS(FBGE_LL)
        IS(FBGE_IL)
        IS(FBGE_LI)
        IS(FBGE_II)

        // Two operand branch if greater than
        IS(FBGT_LL)
        IS(FBGT_IL)
        IS(FBGT_LI)
        IS(FBGT_II)

        // Two operand) local to local handy maths functions
        IS(FINV_LL)  // Reciprocal
        IS(FSQRT_LL) // Square root
        IS(INVSQ_LL) // Inverse square
        IS(FSIN_LL)  // Sine
        IS(FCOS_LL)  // Cosine
        IS(FACOS_LL) // Arccosine
        IS(FPOW_LL)  // Power


        // Two operand float negate
        IS(FNEG_LL)
        IS(FNEG_IL)
        IS(FNEG_LI)
        IS(FNEG_II)

        // Three operand float addition) Commutative) 4 unique variants
        IS(FADD_LLL)
        IS(FADD_ILL)
        IS(FADD_LLI)
        IS(FADD_ILI)

        // Three operand float subtraction) Noncommutative) 7 unique variants
        IS(FSUB_LLL)
        IS(FSUB_ILL)
        IS(FSUB_LLI)
        IS(FSUB_ILI)
        IS(FSUB_LIL)
        IS(FSUB_IIL)
        IS(FSUB_LII)

        // Three operand float multiplication) Commutative) 4 unique variants
        IS(FMUL_LLL)
        IS(FMUL_ILL)
        IS(FMUL_LLI)
        IS(FMUL_ILI)

        // Three operand float division) Noncommutative) 7 unique variants
        IS(FDIV_LLL)
        IS(FDIV_ILL)
        IS(FDIV_LLI)
        IS(FDIV_ILI)
        IS(FDIV_LIL)
        IS(FDIV_IIL)
        IS(FDIV_LII)

        // Three operand float modulo) Noncommutative) 7 unique variants
        IS(FMOD_LLL)
        IS(FMOD_ILL)
        IS(FMOD_LLI)
        IS(FMOD_ILI)
        IS(FMOD_LIL)
        IS(FMOD_IIL)
        IS(FMOD_LII)

        // Floating Point Maximum) Commutative) 4 unique variants
        IS(FMAX_LLL)
        IS(FMAX_ILL)
        IS(FMAX_LLI)
        IS(FMAX_ILI)

        // Floating Point Minimum) Commutative) 4 unique variants
        IS(FMIN_LLL)
        IS(FMIN_ILL)
        IS(FMIN_LLI)
        IS(FMIN_ILI)

        // Vector specific instructions ////////////////////////////////////////////////////////////////////////////

        // Vector branch if equal
        IS(VBEQ_LL)
        IS(VBEQ_IL)
        IS(VBEQ_II)

        // Vector branch if not equal
        IS(VBNE_LL)
        IS(VBNE_IL)
        IS(VBNE_II)

        // Two operand Vector instructions
        IS(VCOPY_LL)
        IS(VCOPY_IL)
        IS(VCOPY_LI)
        IS(VCOPY_II)

        // Vector negate
        IS(VNEG_LL)
        IS(VNEG_IL)
        IS(VNEG_LI)
        IS(VNEG_II)

        // Vector normalize
        IS(VNORM_LL)
        IS(VNORM_IL)
        IS(VNORM_LI)
        IS(VNORM_II)

        // Vector magnitude (scalar result)
        IS(VMAG_LL)
        IS(VMAG_IL)
        IS(VMAG_LI)
        IS(VMAG_II)

        // Three operand vector instructions

        // Vector addition) Commutative) 4 unique variants
        IS(VADD_LLL)
        IS(VADD_ILL)
        IS(VADD_LLI)
        IS(VADD_ILI)

        // Vector subtraction) Noncommutative) 7 unique variants
        IS(VSUB_LLL)
        IS(VSUB_ILL)
        IS(VSUB_LLI)
        IS(VSUB_ILI)
        IS(VSUB_LIL)
        IS(VSUB_IIL)
        IS(VSUB_LII)

        // Dot product (scalar result)) Commutative) 4 unique variants
        IS(VDOT_LLL)
        IS(VDOT_ILL)
        IS(VDOT_LLI)
        IS(VDOT_ILI)

        // Cross product (vector result)) Noncommutative) 7 unique variants
        IS(VCROSS_LLL)
        IS(VCROSS_ILL)
        IS(VCROSS_LLI)
        IS(VCROSS_ILI)
        IS(VCROSS_LIL)
        IS(VCROSS_IIL)
        IS(VCROSS_LII)

        // Vector multiply by float) Commutative) 7 variants due to different input operand types
        IS(VFMUL_LLL)
        IS(VFMUL_ILL)
        IS(VFMUL_LLI)
        IS(VFMUL_ILI)
        IS(VFMUL_LIL)
        IS(VFMUL_IIL)
        IS(VFMUL_LII)

        default:
            return EXEC_HALT_AND_CATCH_FIRE;
    }
    return SUCCESS;
}
