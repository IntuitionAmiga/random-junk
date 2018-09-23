#include <cstdio>
#include <cmath>
#include <cfloat>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"
#include "include/opcode_macros.hpp"

using namespace GVM;

 

uint8 hello[] = {
  move_dr(1, 0, r0)
  call_h(1)
  ret
};

int main() {
  std::printf(
      "Max Opcode:%d\n\nInterpreter Size %d\n",
      Opcode::_MAX,
      (int)sizeof(Interpreter)
  );

  Interpreter test(256, 256);

  return 0;
}
