/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#ifndef _GVM_CORE_HPP_
  #define _GVM_CORE_HPP_
  #include "host_machine.hpp"
  #include "gvm_opcode.hpp"

namespace GVM {

  struct Function {
    uint8* entryPoint;
    uint8  frameSize;
    uint8  returnSize;
    uint8  paramSize;
    uint8  localSize;
    enum {
      MAX_RETURN_SIZE = 4,
      MAX_PARAM_SIZE  = 16,
      MAX_LOCAL_SIZE  = 88,
      MAX_FRAME_SIZE  = 108,
      MAX_ID          = (1<<16)-1
    };
  };

  class Interpreter {
    private:
      typedef union {
        int32   i;
        uint32  u;
        float32 f;
      } word;

      static void*         workingSet;

      static const uint8** returnStack;
      static const uint8** returnStackBase;
      static const uint8** returnStackTop;
      static word*         frameStack;
      static word*         frameStackBase;
      static word*         frameStackTop;
      static uint8*        frameSizeStack;
      static uint8*        frameSizeStackBase;

      static const uint8*  programCounter;
      static word*         indirect[3];

      static const Function* functionTable;
      static uint32          functionTableSize;

    public:
      enum {
        MIN_CALL_DEPTH = 8,
        MAX_CALL_DEPTH = 256,
        MIN_STACK_SIZE = Function::MAX_FRAME_SIZE,
        MAX_STACK_SIZE = Function::MAX_FRAME_SIZE * MAX_CALL_DEPTH,
        REDZONE_BUFFER = 128
      };
      static bool init(size_t rSize, size_t fSize, const Function* table);
      static bool execute(uint16 functionId);
      static void done();

    private:
      static bool validateFunctionTable(const Function* table);
  };

};

#endif
