#include <cstdio>
#include <cmath>
#include <cfloat>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter_core.hpp"

using namespace GVM;

// General Purpose Registers
Interpreter::Register Interpreter::reg[NUM_REG];

// Vector3 Scratch and Magnitude
float32       Interpreter::reg_vs[3];
float32       Interpreter::reg_m;

// Program counter
const uint8*  Interpreter::pc = 0;

// Status register
uint32        Interpreter::status;

// Stacks
const uint8** Interpreter::callStack = 0;
uint32*       Interpreter::dataStack = 0;

// Stack limits
const uint8** Interpreter::callStackBase = 0;
const uint8** Interpreter::callStackTop  = 0;
uint32*       Interpreter::dataStackBase = 0;
uint32*       Interpreter::dataStackTop  = 0;

// Symbol Tables
const uint8**          Interpreter::codeSymbol     = 0;
Interpreter::HostCall* Interpreter::hostCodeSymbol = 0;
uint32**               Interpreter::dataSymbol     = 0;
uint16                 Interpreter::codeSymbolCount     = 0;
uint16                 Interpreter::hostCodeSymbolCount = 0;
uint16                 Interpreter::dataSymbolCount     = 0;

#define DISPATCH(o) switch(o)
#define IS(o)   case Opcode::_##o:
#define NEXT    goto forever
#define EXIT    goto bailout

uint32 Interpreter::execute() {

  status = RUNNING;

forever:
  // Get the next opcode byte
  uint8 tmp1 = *pc++;

  // Speculatively decode the next byte as an operand pair as that is the most common case
  uint8 tmp2 = *pc++;
  uint8 dst  = tmp2 & 0x0F;
  uint8 src  = tmp2 >> 4;

  DISPATCH(tmp1) {
    #define OS25D_GVM_OPCODE_HANDLER
    #include "include/opcode_control.hpp"
    #include "include/opcode_data_move.hpp"
    #include "include/opcode_arithmetic.hpp"
    #include "include/opcode_logic.hpp"
    #undef OS25D_GVM_OPCODE_HANDLER

    default:
      status = ILLEGAL_OPCODE;
  }

bailout:

  return status;
}

int Interpreter::callSymbol(uint16 symbol) {
  if (!symbol || symbol >= codeSymbolCount) {
    status = UNKNOWN_CODE_SYMBOL;
    return 0;
  }

  if (callStack < callStackTop) {
    *callStack++ = pc;
    pc = codeSymbol[symbol];
    return 1;
  } else {
    status = CALL_STACK_OVERFLOW;
    return 0;
  }
}

