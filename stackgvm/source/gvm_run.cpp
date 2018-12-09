/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include <cstdlib>
#include <cmath>
#include "include/gvm_core.hpp"
#include "include/gvm_debug.hpp"

using namespace GVM;

#define FETCH         switch (*programCounter)
#ifdef _GVM_DEBUG_OPCODES_
    #define IS(opcode)    case Opcode::_##opcode: std::fprintf(stderr, "\t%-10s %3d %3d %3d\n", #opcode, (int)programCounter[1], (int)programCounter[2], (int)programCounter[3]);
#else
    #define IS(opcode)    case Opcode::_##opcode:
#endif
#define NEXT          goto forever
#define STEP(size)    programCounter += (size)
#define EXIT(code)    return ((code))

// Local Operand, dereferences a Scalar on the stack frame by the signed 8-bit operand.
// Parameter is the operand byte number.

#ifdef _GVM_OPT_CACHE_POINTERS_
    #define DECLARE_PTRS     Scalar* myFS, myIR[2];
    #define UPDATE_PTRS      myFS = frameStack; myIR[0] = callStack->indirection[0]; myIR[1] = callStack->indirection[1];
    #define LOC(operand)   ( myFS[(int8)programCounter[(operand) + 1]] )
    #define IR(idx)          myIR[(idx)]
#else
    #define DECLARE_PTRS
    #define UPDATE_PTRS
    #define LOC(operand)   ( frameStack[(int8)programCounter[(operand) + 1]] )
    #define IR(idx)          callStack->indirection[(idx)]
#endif

// Vector local operand, returns a float32 pointer to the zeroth element of the vector
#define VLOC(operand)  ( (float32*)&LOC(operand) )

// Vector expressed as triplet of unsigned words - for data transfer operations
#define ULOC(operand)  ( (uint32*)&LOC(operand) )

// Indirect Operand, dereferences one of the index registers by the unsigned 8-bit operand.

#define IX(idx, operand) ( IR(idx)[programCounter[(operand) + 1]] )
#define IX0(operand)     ( IR(0)[programCounter[(operand) + 1]] )
#define IX1(operand)     ( IR(1)[programCounter[(operand) + 1]] )


// Vector Indirect Operand,
#define VIX0(operand)    ((float32*)&IX0(operand))
#define VIX1(operand)    ((float32*)&IX1(operand))

// Vector expressed as triplet of unsigned words - for data transfoer operations
#define UIX0(operand)    ((uint32*)&IX0(operand))
#define UIX1(operand)    ((uint32*)&IX1(operand))

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


const float32 invRMax = 1.0f / (float32)RAND_MAX;

Result Interpreter::run() {
    DECLARE_PTRS;

    float32 *vs1, *vs2, *vd, sf;
    uint32  *us, *ud;

    UPDATE_PTRS;
forever:

    FETCH {
        #include "include/gvm_untyped.hpp"
        #include "include/gvm_integer.hpp"
        #include "include/gvm_float.hpp"
        #include "include/gvm_vector.hpp"
        default:
            return EXEC_HALT_AND_CATCH_FIRE;
    }
    return SUCCESS;
}
