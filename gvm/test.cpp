#include <cstdio>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"
int main() {
  std::printf(
      "EA:%d\nOC:%d\n\nSize %d\n",
      GVM::AddressingMode::_MAX,
      GVM::Opcode::_MAX,
      (int)sizeof(GVM::Interpreter)
  );

  return 0;
}

