/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include "include/gvm_core.hpp"

using namespace GVM;

uint8 _gvm_add[] = {
  Opcode::_ADD_LLL, 1, 2, 0, // fs[0] = fs[1] + fs[2]
  Opcode::_RET
};


Function functionTable[] = {
  { 0, 0, 0, 0, 0 },           // index 0 must be null
  { _gvm_add, 3, 1, 2, 0 },
  { 0, 0, 0, 0, 0 }            // Null termimated set
};

int main() {
  std::printf("Max Opcode %d\n", Opcode::_MAX);

  Interpreter::init(100, 0, functionTable);

  Interpreter::execute(1);

  Interpreter::done();

  return 0;
}
