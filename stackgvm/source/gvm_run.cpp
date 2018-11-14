/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include <cstdlib>
#include <cmath>
#include "include/gvm_core.hpp"

using namespace GVM;

#define FETCH(opcode) switch((opcode))
#define IS(opcode)    case Opcode::_##opcode:
#define NEXT          goto forever
#define STEP(size)    programCounter += (size)
#define EXIT(code)    return ((code))

// Local Operand, dereferences a Scalar on the stack frame by the signed 8-bit operand.
// Parameter is the operand byte number.
#define LOP(operand)   (frameStack[(int8)programCounter[(operand)]])

// Indirect Operand, dereferences one of the index registers by the unsigned 8-bit operand.
// First parameter is the indirection pointer to use
// Second parameter is the operand byte number
#define IOP(idx, operand)  (callStack->indirection[(idx)][programCounter[(operand)]])
#define IX0 0
#define IX1 1

Interpreter::Result Interpreter::run() {
    //frameStack[0].i = frameStack[1].i + frameStack[2].i;
    //return exitFunction();

forever:
    uint8 opcode = *programCounter++;
    FETCH(opcode) {
        IS(HCF) {
            // Halt and catch fire
            EXIT(EXEC_HALT_AND_CATCH_FIRE);
        }

        IS(BRAS) {
            // Branch to a signed 8-bit offset
            programCounter += (int8)*programCounter;
            NEXT;
        }

        IS(BRA) {
            // Branch to a signed 16-bit offset
            uint16 offset = ((uint16)programCounter[0] << 8) | programCounter[1];
            programCounter += (int16)offset;
            NEXT;
        }

        IS(BCALL) {
            // Call an anonymous local function
        }

        IS(CALL) {
            // Call a named function by ID
        }

        IS(ICALL_L) {
            // Call a named function by ID stored in local refrence
        }

        IS(ICALL_I) {
            // Call a named function by ID stored in an indirect reference
        }

        IS(HCALL) {
            // Call a host function
        }

        IS(RET) {
            // Return from the current function
            Result result = exitFunction();
            if (result != SUCCESS) {
                EXIT(result);
            }
            NEXT;
        }

        IS(LLBNN) {
            // Load indirect to indirection register and branch if not null
        }

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
        IS(ADD_LLL) {
            // Local + Local -> Local
            LOP(2).i = LOP(0).i + LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(ADD_ILL) {
            // Indirect + Local -> Local
            LOP(2).i = IOP(IX0, 0).i + LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(ADD_LLI) {
            // Local + Local -> Indirect
            IOP(IX0, 2).i = LOP(0).i + LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(ADD_ILI) {
            // Indirect + Local -> Indirect
            IOP(IX1, 2).i = IOP(IX0, 0).i + LOP(1).i;
            STEP(3);
            NEXT;
        }

        // Three operand integer subtraction) Noncommutative) 7 unique variants
        IS(SUB_LLL) {
            // Local - Local -> Local
            LOP(2).i = LOP(0).i - LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(SUB_ILL) {
            // Indirect - Local -> Local
            LOP(2).i = IOP(IX0, 0).i - LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(SUB_LLI) {
            // Local - Local -> Indirect
            IOP(IX0, 2).i = LOP(0).i - LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(SUB_ILI) {
            // Indirect - Local -> Indirect
            IOP(IX1, 2).i = IOP(IX0, 0).i - LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(SUB_LIL) {
            // Local - Indirect -> Local
            LOP(2).i = LOP(0).i - IOP(IX0, 0).i;
            STEP(3);
            NEXT;
        }

        IS(SUB_IIL) {
            // Indirect - Indirect -> Local
            LOP(2).i = IOP(IX0, 0).i - IOP(IX1, 1).i;
            STEP(3);
            NEXT;
        }

        IS(SUB_LII) {
            // Local - Indirect -> Indirect
            IOP(IX1, 2).i = LOP(0).i - IOP(IX0, 1).i;
            STEP(3);
            NEXT;
        }

        // Three operand integer multiplication) Commutative) 4 unique variants
        IS(MUL_LLL) {
            // Local * Local -> Local
            LOP(2).i = LOP(0).i * LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(MUL_ILL) {
            // Indirect * Local -> Local
            LOP(2).i = IOP(IX0, 0).i * LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(MUL_LLI) {
            // Local * Local -> Indirect
            IOP(IX0, 2).i = LOP(0).i * LOP(1).i;
            STEP(3);
            NEXT;
        }

        IS(MUL_ILI) {
            // Indirect * Local -> Indirect
            IOP(IX1, 2).i = IOP(IX0, 0).i * LOP(1).i;
            STEP(3);
            NEXT;
        }

        // Three operand integer division) Noncommutative) 7 unique variants
        IS(DIV_LLL) {
            // Local / Local -> Local
            int32 numerator   = LOP(0).i;
            int32 denominator = LOP(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOP(2).i = numerator / denominator;
            STEP(3);
            NEXT;
        }

        IS(DIV_ILL) {
            // Indirect / Local -> Local
            int32 numerator   = IOP(IX0, 0).i;
            int32 denominator = LOP(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOP(2).i = numerator / denominator;
            STEP(3);
            NEXT;
        }

        IS(DIV_LLI) {
            // Local / Local -> Indirect
            int32 numerator   = LOP(0).i;
            int32 denominator = LOP(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IOP(IX0, 2).i = numerator / denominator;
            STEP(3);
            NEXT;
        }

        IS(DIV_ILI) {
            // Indirect / Local -> Indirect
            int32 numerator   = IOP(IX0, 0).i;
            int32 denominator = LOP(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IOP(IX1, 2).i = numerator / denominator;
            STEP(3);
            NEXT;
        }

        IS(DIV_LIL) {
            // Local / Indirect -> Local
            int32 numerator   = LOP(0).i;
            int32 denominator = IOP(IX0, 1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOP(2).i = numerator / denominator;
            STEP(3);
            NEXT;
        }

        IS(DIV_IIL) {
            // Indirect / Indirect -> Local
            int32 numerator   = IOP(IX0, 0).i;
            int32 denominator = IOP(IX1, 1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOP(2).i = numerator / denominator;
            STEP(3);
            NEXT;
        }

        IS(DIV_LII) {
            // Local / Indirect -> Indirect
            int32 numerator   = LOP(0).i;
            int32 denominator = IOP(IX0, 1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IOP(IX1, 2).i = numerator / denominator;
            STEP(3);
            NEXT;
        }

        // Three operand integer modulo) Noncommutative) 7 unique variants
        IS(MOD_LLL) {
            // Local % Local -> Local
            int32 numerator   = LOP(0).i;
            int32 denominator = LOP(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOP(2).i = numerator % denominator;
            STEP(3);
            NEXT;
        }

        IS(MOD_ILL) {
            // Indirect % Local -> Local
            int32 numerator   = IOP(IX0, 0).i;
            int32 denominator = LOP(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOP(2).i = numerator % denominator;
            STEP(3);
            NEXT;
        }

        IS(MOD_LLI) {
            // Local % Local -> Indirect
            int32 numerator   = LOP(0).i;
            int32 denominator = LOP(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IOP(IX0, 2).i = numerator % denominator;
            STEP(3);
            NEXT;
        }

        IS(MOD_ILI) {
            // Indirect % Local -> Indirect
            int32 numerator   = IOP(IX0, 0).i;
            int32 denominator = LOP(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IOP(IX1, 2).i = numerator % denominator;
            STEP(3);
            NEXT;
        }

        IS(MOD_LIL) {
            // Local % Indirect -> Local
            int32 numerator   = LOP(0).i;
            int32 denominator = IOP(IX0, 1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOP(2).i = numerator % denominator;
            STEP(3);
            NEXT;
        }

        IS(MOD_IIL) {
            // Indirect % Indirect -> Local
            int32 numerator   = IOP(IX0, 0).i;
            int32 denominator = IOP(IX1, 1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOP(2).i = numerator % denominator;
            STEP(3);
            NEXT;
        }

        IS(MOD_LII) {
            // Local % Indirect -> Indirect
            int32 numerator   = LOP(0).i;
            int32 denominator = IOP(IX0, 1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IOP(IX1, 2).i = numerator % denominator;
            STEP(3);
            NEXT;
        }

        // Three operand logical AND) Commutative) 4 unique variants
        IS(AND_LLL) {
            // Local & Local -> Local
            LOP(2).u = LOP(0).u & LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(AND_ILL) {
            // Indirect & Local -> Local
            LOP(2).u = IOP(IX0, 0).u & LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(AND_LLI) {
            // Local & Local -> Indirect
            IOP(IX0, 2).u = LOP(0).u & LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(AND_ILI) {
            // Indirect & Local -> Indirect
            IOP(IX1, 2).u = IOP(IX0, 0).u & LOP(1).u;
            STEP(3);
            NEXT;
        }

        // Three operand logical OR) Commutative) 4 unique variants
        IS(OR_LLL) {
            // Local | Local -> Local
            LOP(2).u = LOP(0).u | LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(OR_ILL) {
            // Indirect | Local -> Local
            LOP(2).u = IOP(IX0, 0).u | LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(OR_LLI) {
            // Local | Local -> Indirect
            IOP(IX0, 2).u = LOP(0).u | LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(OR_ILI) {
            // Indirect | Local -> Indirect
            IOP(IX1, 2).u = IOP(IX0, 0).u | LOP(1).u;
            STEP(3);
            NEXT;
        }

        // Three operand logical XOR) Commutative) 4 unique variants
        IS(XOR_LLL) {
            // Local ^ Local -> Local
            LOP(2).u = LOP(0).u ^ LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(XOR_ILL) {
            // Indirect ^ Local -> Local
            LOP(2).u = IOP(IX0, 0).u ^ LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(XOR_LLI) {
            // Local ^ Local -> Indirect
            IOP(IX0, 2).u = LOP(0).u ^ LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(XOR_ILI) {
            // Indirect ^ Local -> Indirect
            IOP(IX1, 2).u = IOP(IX0, 0).u ^ LOP(1).u;
            STEP(3);
            NEXT;
        }

        // Three operand logical shift left) Noncommutative) 4 supported variants
        IS(LSL_LLL) {
            // Local << Local -> Local
            LOP(2).u = LOP(0).u << LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(LSL_ILL) {
            // Indirect << Local -> Local
            LOP(2).u = IOP(IX0, 0).u << LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(LSL_LLI) {
            // Local << Local -> Indirect
            IOP(IX0, 2).u = LOP(0).u << LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(LSL_ILI) {
            // Indirect << Local -> Indirect
            IOP(IX1, 2).u = IOP(IX0, 0).u << LOP(1).u;
            STEP(3);
            NEXT;
        }

        // Three operand logical shift right) Noncommutative) 4 supported variants
        IS(LSR_LLL) {
            // Local >> Local -> Local
            LOP(2).u = LOP(0).u >> LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(LSR_ILL) {
            // Indirect >> Local -> Local
            LOP(2).u = IOP(IX0, 0).u >> LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(LSR_LLI) {
            // Local >> Local -> Indirect
            IOP(IX0, 2).u = LOP(0).u >> LOP(1).u;
            STEP(3);
            NEXT;
        }

        IS(LSR_ILI) {
            // Indirect >> Local -> Indirect
            IOP(IX1, 2).u = IOP(IX0, 0).u >> LOP(1).u;
            STEP(3);
            NEXT;
        }

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
        IS(FADD_LLL) {
            // Local + Local -> Local
            LOP(2).f = LOP(0).f + LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FADD_ILL) {
            // Indirect + Local -> Local
            LOP(2).f = IOP(IX0, 0).f + LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FADD_LLI) {
            // Local + Local -> Indirect
            IOP(IX0, 2).f = LOP(0).f + LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FADD_ILI) {
            // Indirect + Local -> Indirect
            IOP(IX1, 2).f = IOP(IX0, 0).f + LOP(1).f;
            STEP(3);
            NEXT;
        }

        // Three operand float subtraction) Noncommutative) 7 unique variants
        IS(FSUB_LLL) {
            // Local - Local -> Local
            LOP(2).f = LOP(0).f - LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FSUB_ILL) {
            // Indirect - Local -> Local
            LOP(2).f = IOP(IX0, 0).f - LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FSUB_LLI) {
            // Local - Local -> Indirect
            IOP(IX0, 2).f = LOP(0).f - LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FSUB_ILI) {
            // Indirect - Local -> Indirect
            IOP(IX1, 2).f = IOP(IX0, 0).f - LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FSUB_LIL) {
            // Local - Indirect -> Local
            LOP(2).f = LOP(0).f - IOP(IX0, 0).f;
            STEP(3);
            NEXT;
        }

        IS(FSUB_IIL) {
            // Indirect - Indirect -> Local
            LOP(2).f = IOP(IX0, 0).f - IOP(IX1, 1).f;
            STEP(3);
            NEXT;
        }

        IS(FSUB_LII) {
            // Local - Indirect -> Indirect
            IOP(IX1, 2).f = LOP(0).f - IOP(IX0, 1).f;
            STEP(3);
            NEXT;
        }

        // Three operand float multiplication) Commutative) 4 unique variants
        IS(FMUL_LLL) {
            // Local * Local -> Local
            LOP(2).f = LOP(0).f * LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FMUL_ILL) {
            // Indirect * Local -> Local
            LOP(2).f = IOP(IX0, 0).f * LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FMUL_LLI) {
            // Local * Local -> Indirect
            IOP(IX0, 2).f = LOP(0).f * LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FMUL_ILI) {
            // Indirect * Local -> Indirect
            IOP(IX1, 2).f = IOP(IX0, 0).f * LOP(1).f;
            STEP(3);
            NEXT;
        }

        // Three operand float division) Noncommutative) 7 unique variants
        IS(FDIV_LLL) {
            LOP(2).f = LOP(0).f / LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FDIV_ILL) {
            // Indirect / Local -> Local
            LOP(2).f = IOP(IX0, 0).f / LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FDIV_LLI) {
            // Local / Local -> Indirect
            IOP(IX0, 2).f = LOP(0).f / LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FDIV_ILI) {
            // Indirect / Local -> Indirect
            IOP(IX1, 2).f = IOP(IX0, 0).f / LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FDIV_LIL) {
            // Local / Indirect -> Local
            LOP(2).f = IOP(IX0, 0).f / LOP(1).f;
            STEP(3);
            NEXT;
        }

        IS(FDIV_IIL) {
            // Indirect / Indirect -> Local
            LOP(2).f = IOP(IX0, 0).f / IOP(IX1, 1).f;
            STEP(3);
            NEXT;
        }

        IS(FDIV_LII) {
            // Local / Indirect -> Indirect
            IOP(IX1, 2).f = LOP(0).f / IOP(IX0, 1).f;
            STEP(3);
            NEXT;
        }

        // Three operand float modulo) Noncommutative) 7 unique variants
        IS(FMOD_LLL) {
            LOP(2).f = std::fmod(LOP(0).f, LOP(1).f);
            STEP(3);
            NEXT;
        }

        IS(FMOD_ILL) {
            // Indirect % Local -> Local
            LOP(2).f = std::fmod(IOP(IX0, 0).f, LOP(1).f);
            STEP(3);
            NEXT;
        }

        IS(FMOD_LLI) {
            // Local % Local -> Indirect
            IOP(IX0, 2).f = std::fmod(LOP(0).f, LOP(1).f);
            STEP(3);
            NEXT;
        }

        IS(FMOD_ILI) {
            // Indirect % Local -> Indirect
            IOP(IX1, 2).f = std::fmod(IOP(IX0, 0).f, LOP(1).f);
            STEP(3);
            NEXT;
        }

        IS(FMOD_LIL) {
            // Local % Indirect -> Local
            LOP(2).f = std::fmod(IOP(IX0, 0).f, LOP(1).f);
            STEP(3);
            NEXT;
        }

        IS(FMOD_IIL) {
            // Indirect % Indirect -> Local
            LOP(2).f = std::fmod(IOP(IX0, 0).f, IOP(IX1, 1).f);
            STEP(3);
            NEXT;
        }

        IS(FMOD_LII) {
            // Local % Indirect -> Indirect
            IOP(IX1, 2).f = std::fmod(LOP(0).f, IOP(IX0, 1).f);
            STEP(3);
            NEXT;
        }

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
