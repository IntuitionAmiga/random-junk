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
