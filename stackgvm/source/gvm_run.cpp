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
#define LOC(operand)   ( frameStack[(int8)programCounter[(operand) + 1]] )

// Vector local operand, returns a float32 pointer to the zeroth element of the vector
#define VLOC(operand)  ( (float32*)&LOC(operand) )

// Indirect Operand, dereferences one of the index registers by the unsigned 8-bit operand.
#define IX(idx, operand) ( callStack->indirection[(idx)][programCounter[(operand) + 1]] )
#define IX0(operand)     ( callStack->indirection[0][programCounter[(operand)] + 1] )
#define IX1(operand)     ( callStack->indirection[1][programCounter[(operand)] + 1] )
#define IR(idx) callStack->indirection[(idx)]

// Vector Indirect Operand,
#define VIX0(operand)    ((float32*)&IX0(operand))
#define VIX1(operand)    ((float32*)&IX1(operand))

// Jump displaceents
#define J16(operand)  (int16)(((uint16)programCounter[(operand) + 1] << 8) | programCounter[(operand) + 2])
#define J8(operand)   (int8)programCounter[(operand) + 1]

// Literal values
#define S8(operand)   (int8)programCounter[(operand) + 1]
#define U8(operand)   programCounter[(operand) + 1]
#define S16(operand)  (int16)(((uint16)programCounter[(operand) + 1] << 8) | programCounter[(operand) + 2])
#define U16(operand)  (((uint16)programCounter[(operand) + 1] << 8) | programCounter[(operand) + 2])

// Symbol ID
#define SYM(operand)  (((uint16)programCounter[(operand) + 1] << 8) | programCounter[(operand) + 2])

// Return address
#define RTA(size)  (programCounter + (size))

Interpreter::Result Interpreter::run() {

forever:
    uint8 opcode = *programCounter;
    FETCH(opcode) {
        IS(HCF) {
            // Halt and catch fire
            EXIT(EXEC_HALT_AND_CATCH_FIRE);
        }

        IS(BRAS) {
            // Branch to a signed 8-bit offset
            STEP(J8(0));
            NEXT;
        }

        IS(BRA) {
            // Branch to a signed 16-bit offset
            STEP(J16(0));
            NEXT;
        }

        IS(BCALL) {
            // Call an anonymous local function
            Result result = enterClosure(RTA(4), J16(1), U8(0));
            if (result != SUCCESS) {
                EXIT(result);
            }
            NEXT;
        }

        IS(CALL) {
            // Call a named function by ID
            Result result = enterFunction(RTA(3), SYM(0));
            if (result != SUCCESS) {
                EXIT(result);
            }
            NEXT;
        }

        IS(ICALL_L) {
            // Call a named function by ID stored in local refrence
            Result result = enterFunction(RTA(2), LOC(0).u);
            if (result != SUCCESS) {
                EXIT(result);
            }
            NEXT;
        }

        IS(ICALL_I) {
            // Call a named function by ID stored in an indirect reference
            Result result = enterFunction(RTA(3), IX(0, 1).u);
            if (result != SUCCESS) {
                EXIT(result);
            }
            NEXT;
        }

        IS(HCALL) {
            // Call a host function
            STEP(2);
            NEXT;
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
            if (!(IR(0) = IX(0, 1).a)) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        // Scalar instructions (float or integer) //////////////////////////////////////////////////////////////////

        IS(BEZ_L) {
            // Branch to a signed 16-bit offset if local is equal to zero
            if (0 == LOC(0).u) {
                STEP(J16(1));
                NEXT;
            }
            STEP(4);
            NEXT;
        }

        IS(BEZ_I) {
            // Branch to a signed 16-bit offset if indirect is equal to zero
            if (0 == IX(0, 1).u) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BNZ_L) {
            // Branch to a signed 16-bit offset if local is equal to zero
            if (0 != LOC(0).u) {
                STEP(J16(1));
                NEXT;
            }
            STEP(4);
            NEXT;
        }

        IS(BNZ_I) {
            // Branch to a signed 16-bit offset if indirect is not equal to zero
            if (0 != IX(0, 1).u) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BEQ_LL) {
            // Branch to a signed 16-bit offset if two local values are equal
            if (LOC(1).u == LOC(0).u) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BEQ_LI) {
            // Branch to a signed 16-bit offset if local and indirect values are equal
            if (IX0(1).u == LOC(0).u) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BEQ_II) {
            // Branch to a signed 16-bit offset if two indirect values are equal
            if (IX0(0).u == IX1(1).u) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(ADDR_LL) {
            // Get address of local variable into local variable
            LOC(1).a = &LOC(0);
            STEP(3);
            NEXT;
        }

        IS(ADDR_IL) {
            // Get address of indirect variable into local variable
            STEP(4);
            NEXT;
        }

        IS(ADDR_DL) {
            // Load the address of a global data symbol to a local variable
            STEP(4);
            NEXT;
        }

        IS(ADDR_DI) {
            // Load the address of a global data symbol to an indirect variable
            STEP(5);
            NEXT;
        }

        IS(ADDR_DX) {
            // Load the address of a global data symbol directly into an index register
            STEP(4);
            NEXT;
        }

        IS(ADDR_CL) {
            // Load code symbol to local variable
            STEP(4);
            NEXT;
        }

        IS(ADDR_CI) {
            // Load code symbol to indirect variable
            STEP(5);
            NEXT;
        }

        IS(LOAD_LX) {
            // Load local reference to index register
            IR(1) = &LOC(0);
            STEP(3);
            NEXT;
        }

        IS(SAVE_XL) {
            // Save indirection index to local
            STEP(3);
            NEXT;
        }

        IS(LOAD_HL) {
            // Load host lookup to local
            STEP(3);
            NEXT;
        }

        IS(COPY_LL) {
            // Copy a local scalar to a local scalar
            LOC(1).u = LOC(0).u;
            STEP(3);
            NEXT;
        }

        IS(COPY_IL) {
            // Copy an indirect scalar to a local
            LOC(1).u = IX0(0).u;
            STEP(3);
            NEXT;
        }

        IS(COPY_LI) {
            // Copy a local scalar to an indirect
            IX0(1).u = LOC(0).u;
            STEP(3);
            NEXT;
        }

        IS(COPY_II) {
            // Copy an indirect scalar to another indirect
            IX1(1).u = IX0(0).u;
            STEP(3);
            NEXT;
        }

        IS(ITOF_LL) {
            // Cast float to integer
            LOC(1).i = (int32)LOC(0).f;
            STEP(3);
            NEXT;
        }

        IS(FTOI_LL) {
            // Cast integer to float
            LOC(1).f = (float32)LOC(0).i;
            STEP(3);
            NEXT;
        }

        // Integer specific instructions ///////////////////////////////////////////////////////////////////////////

        // Two operand branch if greater or equal
        IS(BGE_LL) {
            if (LOC(0).i >= LOC(1).i) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BGE_IL) {
            if (IX0(0).i >= LOC(1).i) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BGE_LI) {
            if (LOC(0).i >= IX0(1).i) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BGE_II) {
            if (IX0(0).i >= IX1(1).i) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        // Two operand branch if greater than
        IS(BGT_LL) {
            if (LOC(0).i > LOC(1).i) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BGT_IL) {
            if (IX0(0).i > LOC(1).i) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BGT_LI) {
            if (LOC(0).i > IX0(1).i) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(BGT_II) {
            if (IX0(0).i > IX1(1).i) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(DBNZ_L) {
            // Decrement local and branch if not zero
            if (--LOC(0).u) {
                STEP(4);
                NEXT;
            }
            STEP(J16(1));
            NEXT;
        }

        // Load small literal integer
        IS(LOAD_SL) {
            LOC(1).i = S8(0);
            STEP(3);
            NEXT;
        }

        IS(LOAD_SI) {
            IX0(1).i = S8(0);
            STEP(3);
            NEXT;
        }

        // Single bit operations
        IS(BSET_SL) {
            // Set bit in local
            LOC(1).u |= 1 << U8(0);
            STEP(3);
            NEXT;
        }

        IS(BSET_SI) {
            // Set bit in indirect
            IX0(1).u |= 1 << U8(0);
            STEP(3);
            NEXT;
        }

        IS(BCLR_SL) {
            // Clear bit in local
            LOC(1).u &= ~(1 << U8(0));
            STEP(3);
            NEXT;
        }

        IS(BCLR_SI) {
            // Clear bit in indirect
            IX0(1).u &= ~(1 << U8(0));
            STEP(3);
            NEXT;
        }

        IS(BBS_SL) {
            // Branch if bit is set (local)
            if ( LOC(1).u & (1 << U8(0)) ) {
                STEP(J16(2));
                NEXT;
            }
            STEP(3);
            NEXT;
        }

        IS(BBS_SI) {
            // Branch if bit is set (indirect)
            if ( IX0(1).u & (1 << U8(0)) ) {
                STEP(J16(2));
                NEXT;
            }
            STEP(3);
            NEXT;
        }

        IS(BBC_SL) {
            // Branch if bit is clear (local)
            if (!(LOC(1).u & (1 << U8(0)))) {
                STEP(J16(2));
                NEXT;
            }
            STEP(3);
            NEXT;
        }

        IS(BBC_SI) {
            // Branch if bit os clear (indirect)
            if (!(IX0(1).u & (1 << U8(0)))) {
                STEP(J16(2));
                NEXT;
            }
            STEP(3);
            NEXT;
        }

        // Two operand logical negate
        IS(NOT_LL) {
            LOC(1).u = ~LOC(0).u;
            STEP(3);
            NEXT;
        }

        IS(NOT_IL) {
            LOC(1).u = ~IX0(0).u;
            STEP(3);
            NEXT;
        }

        IS(NOT_LI) {
            IX0(1).u = ~LOC(0).u;
            STEP(3);
            NEXT;
        }

        IS(NOT_II) {
            IX1(1).u = ~IX0(0).u;
            STEP(3);
            NEXT;
        }

        // Two operand integer negate
        IS(NEG_LL) {
            LOC(1).u = -LOC(0).u;
            STEP(3);
            NEXT;
        }

        IS(NEG_IL) {
            LOC(1).u = -IX0(0).u;
            STEP(3);
            NEXT;
        }

        IS(NEG_LI) {
            IX0(1).u = -LOC(0).u;
            STEP(3);
            NEXT;
        }

        IS(NEG_II) {
            IX1(1).u = -IX0(0).u;
            STEP(3);
            NEXT;
        }

        // Three operand integer addition) Commutative) 4 unique variants
        IS(ADD_LLL) {
            // Local + Local -> Local
            LOC(2).i = LOC(0).i + LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(ADD_ILL) {
            // Indirect + Local -> Local
            LOC(2).i = IX0(0).i + LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(ADD_LLI) {
            // Local + Local -> Indirect
            IX0(2).i = LOC(0).i + LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(ADD_ILI) {
            // Indirect + Local -> Indirect
            IX1(2).i = IX0(0).i + LOC(1).i;
            STEP(4);
            NEXT;
        }

        // Three operand integer subtraction) Noncommutative) 7 unique variants
        IS(SUB_LLL) {
            // Local - Local -> Local
            LOC(2).i = LOC(0).i - LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(SUB_ILL) {
            // Indirect - Local -> Local
            LOC(2).i = IX0(0).i - LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(SUB_LLI) {
            // Local - Local -> Indirect
            IX0(2).i = LOC(0).i - LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(SUB_ILI) {
            // Indirect - Local -> Indirect
            IX1(2).i = IX0(0).i - LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(SUB_LIL) {
            // Local - Indirect -> Local
            LOC(2).i = LOC(0).i - IX0(0).i;
            STEP(4);
            NEXT;
        }

        IS(SUB_IIL) {
            // Indirect - Indirect -> Local
            LOC(2).i = IX0(0).i - IX1(1).i;
            STEP(4);
            NEXT;
        }

        IS(SUB_LII) {
            // Local - Indirect -> Indirect
            IX1(2).i = LOC(0).i - IX0(1).i;
            STEP(4);
            NEXT;
        }

        // Three operand integer multiplication) Commutative) 4 unique variants
        IS(MUL_LLL) {
            // Local * Local -> Local
            LOC(2).i = LOC(0).i * LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(MUL_ILL) {
            // Indirect * Local -> Local
            LOC(2).i = IX0(0).i * LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(MUL_LLI) {
            // Local * Local -> Indirect
            IX0(2).i = LOC(0).i * LOC(1).i;
            STEP(4);
            NEXT;
        }

        IS(MUL_ILI) {
            // Indirect * Local -> Indirect
            IX1(2).i = IX0(0).i * LOC(1).i;
            STEP(4);
            NEXT;
        }

        // Three operand integer division) Noncommutative) 7 unique variants
        IS(DIV_LLL) {
            // Local / Local -> Local
            int32 numerator   = LOC(0).i;
            int32 denominator = LOC(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOC(2).i = numerator / denominator;
            STEP(4);
            NEXT;
        }

        IS(DIV_ILL) {
            // Indirect / Local -> Local
            int32 numerator   = IX0(0).i;
            int32 denominator = LOC(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOC(2).i = numerator / denominator;
            STEP(4);
            NEXT;
        }

        IS(DIV_LLI) {
            // Local / Local -> Indirect
            int32 numerator   = LOC(0).i;
            int32 denominator = LOC(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IX0(2).i = numerator / denominator;
            STEP(4);
            NEXT;
        }

        IS(DIV_ILI) {
            // Indirect / Local -> Indirect
            int32 numerator   = IX0(0).i;
            int32 denominator = LOC(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IX1(2).i = numerator / denominator;
            STEP(4);
            NEXT;
        }

        IS(DIV_LIL) {
            // Local / Indirect -> Local
            int32 numerator   = LOC(0).i;
            int32 denominator = IX0(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOC(2).i = numerator / denominator;
            STEP(4);
            NEXT;
        }

        IS(DIV_IIL) {
            // Indirect / Indirect -> Local
            int32 numerator   = IX0(0).i;
            int32 denominator = IX1(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOC(2).i = numerator / denominator;
            STEP(4);
            NEXT;
        }

        IS(DIV_LII) {
            // Local / Indirect -> Indirect
            int32 numerator   = LOC(0).i;
            int32 denominator = IX0(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IX1(2).i = numerator / denominator;
            STEP(4);
            NEXT;
        }

        // Three operand integer modulo) Noncommutative) 7 unique variants
        IS(MOD_LLL) {
            // Local % Local -> Local
            int32 numerator   = LOC(0).i;
            int32 denominator = LOC(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOC(2).i = numerator % denominator;
            STEP(4);
            NEXT;
        }

        IS(MOD_ILL) {
            // Indirect % Local -> Local
            int32 numerator   = IX0(0).i;
            int32 denominator = LOC(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOC(2).i = numerator % denominator;
            STEP(4);
            NEXT;
        }

        IS(MOD_LLI) {
            // Local % Local -> Indirect
            int32 numerator   = LOC(0).i;
            int32 denominator = LOC(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IX0(2).i = numerator % denominator;
            STEP(4);
            NEXT;
        }

        IS(MOD_ILI) {
            // Indirect % Local -> Indirect
            int32 numerator   = IX0(0).i;
            int32 denominator = LOC(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IX1(2).i = numerator % denominator;
            STEP(4);
            NEXT;
        }

        IS(MOD_LIL) {
            // Local % Indirect -> Local
            int32 numerator   = LOC(0).i;
            int32 denominator = IX0(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOC(2).i = numerator % denominator;
            STEP(4);
            NEXT;
        }

        IS(MOD_IIL) {
            // Indirect % Indirect -> Local
            int32 numerator   = IX0(0).i;
            int32 denominator = IX1(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            LOC(2).i = numerator % denominator;
            STEP(4);
            NEXT;
        }

        IS(MOD_LII) {
            // Local % Indirect -> Indirect
            int32 numerator   = LOC(0).i;
            int32 denominator = IX0(1).i;
            if (!denominator) {
                EXIT(EXEC_DIVISION_BY_ZERO);
            }
            IX1(2).i = numerator % denominator;
            STEP(4);
            NEXT;
        }

        // Three operand logical AND) Commutative) 4 unique variants
        IS(AND_LLL) {
            // Local & Local -> Local
            LOC(2).u = LOC(0).u & LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(AND_ILL) {
            // Indirect & Local -> Local
            LOC(2).u = IX0(0).u & LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(AND_LLI) {
            // Local & Local -> Indirect
            IX0(2).u = LOC(0).u & LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(AND_ILI) {
            // Indirect & Local -> Indirect
            IX1(2).u = IX0(0).u & LOC(1).u;
            STEP(4);
            NEXT;
        }

        // Three operand logical OR) Commutative) 4 unique variants
        IS(OR_LLL) {
            // Local | Local -> Local
            LOC(2).u = LOC(0).u | LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(OR_ILL) {
            // Indirect | Local -> Local
            LOC(2).u = IX0(0).u | LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(OR_LLI) {
            // Local | Local -> Indirect
            IX0(2).u = LOC(0).u | LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(OR_ILI) {
            // Indirect | Local -> Indirect
            IX1(2).u = IX0(0).u | LOC(1).u;
            STEP(4);
            NEXT;
        }

        // Three operand logical XOR) Commutative) 4 unique variants
        IS(XOR_LLL) {
            // Local ^ Local -> Local
            LOC(2).u = LOC(0).u ^ LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(XOR_ILL) {
            // Indirect ^ Local -> Local
            LOC(2).u = IX0(0).u ^ LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(XOR_LLI) {
            // Local ^ Local -> Indirect
            IX0(2).u = LOC(0).u ^ LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(XOR_ILI) {
            // Indirect ^ Local -> Indirect
            IX1(2).u = IX0(0).u ^ LOC(1).u;
            STEP(4);
            NEXT;
        }

        // Three operand logical shift left) Noncommutative) 4 supported variants
        IS(LSL_LLL) {
            // Local << Local -> Local
            LOC(2).u = LOC(0).u << LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(LSL_ILL) {
            // Indirect << Local -> Local
            LOC(2).u = IX0(0).u << LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(LSL_LLI) {
            // Local << Local -> Indirect
            IX0(2).u = LOC(0).u << LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(LSL_ILI) {
            // Indirect << Local -> Indirect
            IX1(2).u = IX0(0).u << LOC(1).u;
            STEP(4);
            NEXT;
        }

        // Three operand logical shift right) Noncommutative) 4 supported variants
        IS(LSR_LLL) {
            // Local >> Local -> Local
            LOC(2).u = LOC(0).u >> LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(LSR_ILL) {
            // Indirect >> Local -> Local
            LOC(2).u = IX0(0).u >> LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(LSR_LLI) {
            // Local >> Local -> Indirect
            IX0(2).u = LOC(0).u >> LOC(1).u;
            STEP(4);
            NEXT;
        }

        IS(LSR_ILI) {
            // Indirect >> Local -> Indirect
            IX1(2).u = IX0(0).u >> LOC(1).u;
            STEP(4);
            NEXT;
        }

        // Integer Maximum) Commutative) 4 unique variants
        IS(MAX_LLL) {
            STEP(4);
            NEXT;
        }

        IS(MAX_ILL) {
            STEP(4);
            NEXT;
        }

        IS(MAX_LLI) {
            STEP(4);
            NEXT;
        }

        IS(MAX_ILI) {
            STEP(4);
            NEXT;
        }


        // Integer Minumum) Commutative) 4 unique variants
        IS(MIN_LLL) {
            STEP(4);
            NEXT;
        }

        IS(MIN_ILL) {
            STEP(4);
            NEXT;
        }

        IS(MIN_LLI) {
            STEP(4);
            NEXT;
        }

        IS(MIN_ILI) {
            STEP(4);
            NEXT;
        }


        // Floating point specific instructions ////////////////////////////////////////////////////////////////////

        // Two operand branch if greater or equal
        IS(FBGE_LL) {
            if (LOC(0).f >= LOC(1).f) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(FBGE_IL) {
            if (IX0(0).f >= LOC(1).f) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(FBGE_LI) {
            if (LOC(0).f >= IX0(1).f) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(FBGE_II) {
            if (IX0(0).f >= IX1(1).f) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        // Two operand branch if greater than
        IS(FBGT_LL) {
            if (LOC(0).f > LOC(1).f) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(FBGT_IL) {
            if (IX0(0).f > LOC(1).f) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(FBGT_LI) {
            if (LOC(0).f > IX0(1).f) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        IS(FBGT_II) {
            if (IX0(0).f > IX1(1).f) {
                STEP(J16(2));
                NEXT;
            }
            STEP(5);
            NEXT;
        }

        // Two operand) local to local handy maths functions
        IS(FINV_LL) {
            // Reciprocal
            LOC(1).f = 1.0f / LOC(0).f;
            STEP(3);
            NEXT;
        }

        IS(FSQRT_LL) {
            // Square root
            LOC(1).f = std::sqrt(LOC(0).f);
            STEP(3);
            NEXT;
        }

        IS(INVSQ_LL) {
            // Inverse square
            float32 sqr = LOC(0).f;
            sqr *= sqr;
            LOC(1).f = 1.0f / sqr;
            STEP(3);
            NEXT;
        }

        IS(FSIN_LL) {
            // Sine
            LOC(1).f = std::sin(LOC(0).f);
            STEP(3);
            NEXT;
        }

        IS(FCOS_LL) {
            // Cosine
            LOC(1).f = std::cos(LOC(0).f);
            STEP(3);
            NEXT;
        }

        IS(FACOS_LL) {
            // Arccosine
            LOC(1).f = std::acos(LOC(0).f);
            STEP(3);
            NEXT;
        }

        // Two operand float negate
        IS(FNEG_LL) {
            LOC(1).f = -LOC(0).f;
            STEP(3);
            NEXT;
        }

        IS(FNEG_IL) {
            LOC(1).f = -IX0(0).f;
            STEP(3);
            NEXT;
        }

        IS(FNEG_LI) {
            IX0(1).f = -LOC(0).f;
            STEP(3);
            NEXT;
        }

        IS(FNEG_II) {
            IX1(1).f = -IX0(0).f;
            STEP(3);
            NEXT;
        }

        // Three operand float addition) Commutative) 4 unique variants
        IS(FADD_LLL) {
            // Local + Local -> Local
            LOC(2).f = LOC(0).f + LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FADD_ILL) {
            // Indirect + Local -> Local
            LOC(2).f = IX0(0).f + LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FADD_LLI) {
            // Local + Local -> Indirect
            IX0(2).f = LOC(0).f + LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FADD_ILI) {
            // Indirect + Local -> Indirect
            IX1(2).f = IX0(0).f + LOC(1).f;
            STEP(4);
            NEXT;
        }

        // Three operand float subtraction) Noncommutative) 7 unique variants
        IS(FSUB_LLL) {
            // Local - Local -> Local
            LOC(2).f = LOC(0).f - LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FSUB_ILL) {
            // Indirect - Local -> Local
            LOC(2).f = IX0(0).f - LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FSUB_LLI) {
            // Local - Local -> Indirect
            IX0(2).f = LOC(0).f - LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FSUB_ILI) {
            // Indirect - Local -> Indirect
            IX1(2).f = IX0(0).f - LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FSUB_LIL) {
            // Local - Indirect -> Local
            LOC(2).f = LOC(0).f - IX0(0).f;
            STEP(4);
            NEXT;
        }

        IS(FSUB_IIL) {
            // Indirect - Indirect -> Local
            LOC(2).f = IX0(0).f - IX1(1).f;
            STEP(4);
            NEXT;
        }

        IS(FSUB_LII) {
            // Local - Indirect -> Indirect
            IX1(2).f = LOC(0).f - IX0(1).f;
            STEP(4);
            NEXT;
        }

        // Three operand float multiplication) Commutative) 4 unique variants
        IS(FMUL_LLL) {
            // Local * Local -> Local
            LOC(2).f = LOC(0).f * LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FMUL_ILL) {
            // Indirect * Local -> Local
            LOC(2).f = IX0(0).f * LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FMUL_LLI) {
            // Local * Local -> Indirect
            IX0(2).f = LOC(0).f * LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FMUL_ILI) {
            // Indirect * Local -> Indirect
            IX1(2).f = IX0(0).f * LOC(1).f;
            STEP(4);
            NEXT;
        }

        // Three operand float division) Noncommutative) 7 unique variants
        IS(FDIV_LLL) {
            LOC(2).f = LOC(0).f / LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FDIV_ILL) {
            // Indirect / Local -> Local
            LOC(2).f = IX0(0).f / LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FDIV_LLI) {
            // Local / Local -> Indirect
            IX0(2).f = LOC(0).f / LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FDIV_ILI) {
            // Indirect / Local -> Indirect
            IX1(2).f = IX0(0).f / LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FDIV_LIL) {
            // Local / Indirect -> Local
            LOC(2).f = IX0(0).f / LOC(1).f;
            STEP(4);
            NEXT;
        }

        IS(FDIV_IIL) {
            // Indirect / Indirect -> Local
            LOC(2).f = IX0(0).f / IX1(1).f;
            STEP(4);
            NEXT;
        }

        IS(FDIV_LII) {
            // Local / Indirect -> Indirect
            IX1(2).f = LOC(0).f / IX0(1).f;
            STEP(4);
            NEXT;
        }

        // Three operand float modulo) Noncommutative) 7 unique variants
        IS(FMOD_LLL) {
            LOC(2).f = std::fmod(LOC(0).f, LOC(1).f);
            STEP(4);
            NEXT;
        }

        IS(FMOD_ILL) {
            // Indirect % Local -> Local
            LOC(2).f = std::fmod(IX0(0).f, LOC(1).f);
            STEP(4);
            NEXT;
        }

        IS(FMOD_LLI) {
            // Local % Local -> Indirect
            IX0(2).f = std::fmod(LOC(0).f, LOC(1).f);
            STEP(4);
            NEXT;
        }

        IS(FMOD_ILI) {
            // Indirect % Local -> Indirect
            IX1(2).f = std::fmod(IX0(0).f, LOC(1).f);
            STEP(4);
            NEXT;
        }

        IS(FMOD_LIL) {
            // Local % Indirect -> Local
            LOC(2).f = std::fmod(IX0(0).f, LOC(1).f);
            STEP(4);
            NEXT;
        }

        IS(FMOD_IIL) {
            // Indirect % Indirect -> Local
            LOC(2).f = std::fmod(IX0(0).f, IX1(1).f);
            STEP(4);
            NEXT;
        }

        IS(FMOD_LII) {
            // Local % Indirect -> Indirect
            IX1(2).f = std::fmod(LOC(0).f, IX0(1).f);
            STEP(4);
            NEXT;
        }

        // Floating Point Maximum) Commutative) 4 unique variants
        IS(FMAX_LLL) {
            STEP(4);
            NEXT;
        }

        IS(FMAX_ILL) {
            STEP(4);
            NEXT;
        }

        IS(FMAX_LLI) {
            STEP(4);
            NEXT;
        }

        IS(FMAX_ILI) {
            STEP(4);
            NEXT;
        }

        // Floating Point Minimum) Commutative) 4 unique variants
        IS(FMIN_LLL) {
            STEP(4);
            NEXT;
        }

        IS(FMIN_ILL) {
            STEP(4);
            NEXT;
        }

        IS(FMIN_LLI) {
            STEP(4);
            NEXT;
        }

        IS(FMIN_ILI) {
            STEP(4);
            NEXT;
        }

        // Vector specific instructions ////////////////////////////////////////////////////////////////////////////

        // Vector branch if equal
        IS(VBEQ_LL) {
            STEP(5);
            NEXT;
        }

        IS(VBEQ_IL) {
            STEP(5);
            NEXT;
        }

        IS(VBEQ_II) {
            STEP(5);
            NEXT;
        }

        // Vector branch if not equal
        IS(VBNE_LL) {
            STEP(5);
            NEXT;
        }

        IS(VBNE_IL) {
            STEP(5);
            NEXT;
        }

        IS(VBNE_II) {
            STEP(5);
            NEXT;
        }

        // Two operand Vector instructions
        IS(VCOPY_LL) {
            STEP(3);
            NEXT;
        }

        IS(VCOPY_IL) {
            STEP(3);
            NEXT;
        }

        IS(VCOPY_LI) {
            STEP(3);
            NEXT;
        }

        IS(VCOPY_II) {
            STEP(3);
            NEXT;
        }

        // Vector negate
        IS(VNEG_LL) {
            STEP(3);
            NEXT;
        }

        IS(VNEG_IL) {
            STEP(3);
            NEXT;
        }

        IS(VNEG_LI) {
            STEP(3);
            NEXT;
        }

        IS(VNEG_II) {
            STEP(3);
            NEXT;
        }

        // Vector normalize
        IS(VNORM_LL) {
            STEP(3);
            NEXT;
        }

        IS(VNORM_IL) {
            STEP(3);
            NEXT;
        }

        IS(VNORM_LI) {
            STEP(3);
            NEXT;
        }

        IS(VNORM_II) {
            STEP(3);
            NEXT;
        }

        // Vector magnitude (scalar result)
        IS(VMAG_LL) {
            STEP(3);
            NEXT;
        }

        IS(VMAG_IL) {
            STEP(3);
            NEXT;
        }

        IS(VMAG_LI) {
            STEP(3);
            NEXT;
        }

        IS(VMAG_II) {
            STEP(3);
            NEXT;
        }

        // Three operand vector instructions

        // Vector addition) Commutative) 4 unique variants
        IS(VADD_LLL) {
            float32* vs1 = VLOC(0);
            float32* vs2 = VLOC(1);
            float32* vd  = VLOC(2);
            vd[0] = vs1[0] + vs2[0];
            vd[1] = vs1[1] + vs2[1];
            vd[2] = vs1[2] + vs2[2];
            STEP(4);
            NEXT;
        }

        IS(VADD_ILL) {
            float32* vs1 = VIX0(0);
            float32* vs2 = VLOC(1);
            float32* vd  = VLOC(2);
            vd[0] = vs1[0] + vs2[0];
            vd[1] = vs1[1] + vs2[1];
            vd[2] = vs1[2] + vs2[2];
            STEP(4);
            NEXT;
        }

        IS(VADD_LLI) {
            float32* vs1 = VLOC(0);
            float32* vs2 = VLOC(1);
            float32* vd  = VIX0(2);
            vd[0] = vs1[0] + vs2[0];
            vd[1] = vs1[1] + vs2[1];
            vd[2] = vs1[2] + vs2[2];
            STEP(4);
            NEXT;
        }

        IS(VADD_ILI) {
            float32* vs1 = VIX0(0);
            float32* vs2 = VLOC(1);
            float32* vd  = VIX1(2);
            vd[0] = vs1[0] + vs2[0];
            vd[1] = vs1[1] + vs2[1];
            vd[2] = vs1[2] + vs2[2];
            STEP(4);
            NEXT;
        }

        // Vector subtraction) Noncommutative) 7 unique variants
        IS(VSUB_LLL) {
            float32* vs1 = VLOC(0);
            float32* vs2 = VLOC(1);
            float32* vd  = VLOC(2);
            vd[0] = vs1[0] - vs2[0];
            vd[1] = vs1[1] - vs2[1];
            vd[2] = vs1[2] - vs2[2];
            STEP(4);
            NEXT;
        }

        IS(VSUB_ILL) {
            float32* vs1 = VIX0(0);
            float32* vs2 = VLOC(1);
            float32* vd  = VLOC(2);
            vd[0] = vs1[0] - vs2[0];
            vd[1] = vs1[1] - vs2[1];
            vd[2] = vs1[2] - vs2[2];
            STEP(4);
            NEXT;
        }

        IS(VSUB_LLI) {
            float32* vs1 = VLOC(0);
            float32* vs2 = VLOC(1);
            float32* vd  = VIX0(2);
            vd[0] = vs1[0] - vs2[0];
            vd[1] = vs1[1] - vs2[1];
            vd[2] = vs1[2] - vs2[2];
            STEP(4);
            NEXT;
        }

        IS(VSUB_ILI) {
            float32* vs1 = VIX0(0);
            float32* vs2 = VLOC(1);
            float32* vd  = VIX1(2);
            vd[0] = vs1[0] - vs2[0];
            vd[1] = vs1[1] - vs2[1];
            vd[2] = vs1[2] - vs2[2];
            STEP(4);
            NEXT;
        }

        IS(VSUB_LIL) {
            float32* vs1 = VLOC(0);
            float32* vs2 = VIX0(1);
            float32* vd  = VLOC(2);
            vd[0] = vs1[0] - vs2[0];
            vd[1] = vs1[1] - vs2[1];
            vd[2] = vs1[2] - vs2[2];
            STEP(4);
            NEXT;
        }

        IS(VSUB_IIL) {
            float32* vs1 = VIX0(0);
            float32* vs2 = VIX1(1);
            float32* vd  = VLOC(2);
            vd[0] = vs1[0] - vs2[0];
            vd[1] = vs1[1] - vs2[1];
            vd[2] = vs1[2] - vs2[2];
            STEP(4);
            NEXT;
        }

        IS(VSUB_LII) {
            float32* vs1 = VLOC(0);
            float32* vs2 = VIX0(1);
            float32* vd  = VIX1(2);
            vd[0] = vs1[0] - vs2[0];
            vd[1] = vs1[1] - vs2[1];
            vd[2] = vs1[2] - vs2[2];
            STEP(4);
            NEXT;
        }


        // Dot product (scalar result)) Commutative) 4 unique variants
        IS(VDOT_LLL) {
            STEP(4);
            NEXT;
        }

        IS(VDOT_ILL) {
            STEP(4);
            NEXT;
        }

        IS(VDOT_LLI) {
            STEP(4);
            NEXT;
        }

        IS(VDOT_ILI) {
            STEP(4);
            NEXT;
        }


        // Cross product (vector result)) Noncommutative) 7 unique variants
        IS(VCROSS_LLL) {
            STEP(4);
            NEXT;
        }

        IS(VCROSS_ILL) {
            STEP(4);
            NEXT;
        }

        IS(VCROSS_LLI) {
            STEP(4);
            NEXT;
        }

        IS(VCROSS_ILI) {
            STEP(4);
            NEXT;
        }

        IS(VCROSS_LIL) {
            STEP(4);
            NEXT;
        }

        IS(VCROSS_IIL) {
            STEP(4);
            NEXT;
        }

        IS(VCROSS_LII) {
            STEP(4);
            NEXT;
        }


        // Vector multiply by float) Commutative) 7 variants due to different input operand types
        IS(VFMUL_LLL) {
            STEP(4);
            NEXT;
        }

        IS(VFMUL_ILL) {
            STEP(4);
            NEXT;
        }

        IS(VFMUL_LLI) {
            STEP(4);
            NEXT;
        }

        IS(VFMUL_ILI) {
            STEP(4);
            NEXT;
        }

        IS(VFMUL_LIL) {
            STEP(4);
            NEXT;
        }

        IS(VFMUL_IIL) {
            STEP(4);
            NEXT;
        }

        IS(VFMUL_LII) {
            STEP(4);
            NEXT;
        }

        default:
            return EXEC_HALT_AND_CATCH_FIRE;
    }
    return SUCCESS;
}
