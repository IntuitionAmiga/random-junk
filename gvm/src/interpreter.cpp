#include <cstdio>
#include <cmath>
#include <cfloat>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"

using namespace GVM;

//

#define DISPATCH(o) switch(o)
//#define IS(o)   case Opcode::_##o: asm("# Opcode::_" #o "\n" : :);
#define IS(o)   case Opcode::_##o:
#define NEXT    goto forever
#define EXIT    goto bailout

void Interpreter::execute() {

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

  return;
}

int Interpreter::call(uint16 symbol) {
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

