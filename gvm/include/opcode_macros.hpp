#ifndef _OS25D_GVM_OPCODE_MACROS_HPP_
  #define _OS25D_GVM_OPCODE_MACROS_HPP_

  #define _OP(x) (uint8)Opcode::_##x
  #define _D8(x) (uint8)(x)
  #define _D16(x) (uint8)((x) >> 8), (uint8)((x) & 0xFF)

  #define _S(s) (uint8)(((s) & 0x0F) << 4)
  #define _D(d) (uint8)((d) & 0x0F)
  #define _SD(s,d) _S(s) | _D(d)

  #define r0 0
  #define r1 1
  #define r2 2
  #define r3 3
  #define r4 4
  #define r5 5
  #define r6 6
  #define r7 7
  #define r8 8
  #define r9 9
  #define r10 10
  #define r11 11
  #define r12 12
  #define r13 13
  #define r14 14
  #define r15 15
  #define GVM_CODE(x) uint8 _gvmCode##x[] =
  #define GVM_CODE_SIZE(x) (sizeof(_gvmCode##x))

// Standard definitions used in Macro Expansion
//
// sr : source register operand
// dr : destination register operand
// so : source offset
// do : destination offset
// jo : jump offset

  #define OS25D_GVM_OPCODE_MACRO
  #include "opcode_control.hpp"
  #include "opcode_data_move.hpp"
  #include "opcode_arithmetic.hpp"
  #include "opcode_logic.hpp"
  #undef OS25D_GVM_OPCODE_MACRO


#endif
