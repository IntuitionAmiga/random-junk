#include <cstdio>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"
int main() {
  std::printf(
      "Max Opcode:%d\n\nInterpreter Size %d\n",
      GVM::Opcode::_MAX,
      (int)sizeof(GVM::Interpreter)
  );

  return 0;
}

