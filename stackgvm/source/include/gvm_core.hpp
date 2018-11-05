/**
 * TYTLGVM
 *
 * Twenty Years Too Late Game Virtual Machine
 */

#ifndef _GVM_CORE_HPP_
  #define _GVM_CORE_HPP_
  #include "host_machine.hpp"
  #include "gvm_opcode.hpp"

namespace GVM {

  class Interpreter {
    private:
      typedef union {
        int32   i;
        uint32  u;
        float32 f;
      } word;
      static word*   frameStack;
      static uint8*  frameSizeStack;
      static uint8** returnStack;
      static uint8*  programCounter;
      static word*   indirect[3];
  };

};

#endif
