#include <cstdio>
#include <cmath>
#include <cfloat>
#include <cstring>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"
#include "include/opcode_macros.hpp"


using namespace GVM;

#include "include/verification/single_opcode_tests.hpp"

class SingleOpcodeInterpreter : public Interpreter {

  public:
    void step(const uint8* code);

    void setCallStack(const uint8** location, uint32 size) {
      callStackBase = location;
      callStackTop  = location + (size-1);
      callStack     = location;
    }

    void setDataStack(uint32* location, uint32 size) {
      dataStackBase = location;
      dataStackTop  = location + (size-1);
      dataStack     = location;
    }

    void setCodeSymbolTable(const uint8** location, uint16 count) {
      codeSymbol      = location;
      codeSymbolCount = count;
    }

    void setHostCodeSymbolTable(HostCall* location, uint16 count) {
      hostCodeSymbol      = location;
      hostCodeSymbolCount = count;
    }

    void setDataSymbolTable(uint32** location, uint16 count) {
      dataSymbol      = location;
      dataSymbolCount = count;
    }
};

// Stub
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

#define DISPATCH(o) switch(o)
#define IS(o)   case Opcode::_##o:
#define NEXT    goto bailout
#define EXIT    goto bailout

void SingleOpcodeInterpreter::step(const uint8* code) {

  pc = code;

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

int main() {

  const int declaredSize = sizeof(opcode_tests)/sizeof(uint8*);

  std::printf(
    "Enumerated opcodes:\n"
    "\topcode_control.hpp\n"
    "\tDeclared : %d\n"
    "\topcode_data_move.hpp\n"
    "\tDeclared : %d\n"
    "\topcode_arithmetic.hpp\n"
    "\tDeclared : %d\n"
    "\topcode_logic.hpp\n"
    "\tDeclared : %d\n"
    "\tMAX      : %d\n"
    "\tDeclared : %d\n",
    (int)Opcode::_VBNE_IA - (int)Opcode::_HALT,
    (int)Opcode::_VMVE_AI - (int)Opcode::_MOVE_LR,
    (int)Opcode::_VNRM_A -  (int)Opcode::_NEG_RR,
    (int)Opcode::_LSR_II -  (int)Opcode::_AND_RR,
    (int)Opcode::_MAX,
    declaredSize
  );
  if (Opcode::_MAX != declaredSize) {
    std::printf("\nERROR - Declared and Enumerated counts do not match\n");
  } else {
    for (int i = 1; i < declaredSize; i++) {
      int len = std::strlen((const char*)opcode_tests[i]);
      std::printf(
        "Instruction %d\n\tvasm: %s\n\tsize: %d\n\tcode: ",
        i,
        assembler[i],
        len
      );
      for (int j=0; j<len; j++) {
        std::printf("0x%02X ", opcode_tests[i][j]);
      }
      std::puts("\n");
    }
  }

  return 0;
}
