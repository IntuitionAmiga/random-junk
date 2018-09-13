#ifndef _OS25D_GVM_OPCODES_HPP_
  #define _OS25D_GVM_OPCODES_HPP_


namespace GVM {

  namespace AddressingMode {
    typedef enum {
      EA_LR, // Small Literal to Register
      EA_LI, // Small Literal to Indirect
      EA_RR, // Register to Register (1 byte 4:4)
      EA_RI, // Register to Indirect (1 byte X:4, 1 byte offset)
      EA_IR, // Indirect to Register (1 byte X:4, 1 byte offset)
      EA_II, // Indirect to Indirect (1 byte offset, 1 byte offset)
      _MAX
    } Enumeration;
  }

  namespace Opcode {

    // Legend
    //
    // I    scalar small immediate
    //
    // General registers
    //
    // rs   scalar source register direct
    // (rs) scalar source register indirect
    // rd   scalar destination register direct
    // (rd) scalar destination register indirect
    // (vs) vector source
    // (vd) vector destination
    //
    // Special registers
    // m    scalar magnitude (of vector)
    // va   vector accumulator

    typedef enum {
      #define OS25D_GVM_OPCODE_DEFINE
      #include "opcode_control.hpp"
      #include "opcode_data_move.hpp"
      #include "opcode_arithmetic.hpp"
      #include "opcode_logic.hpp"
      #undef OS25D_GVM_OPCODE_DEFINE

      _MAX
    } Enumeration;
  }
}


#endif
