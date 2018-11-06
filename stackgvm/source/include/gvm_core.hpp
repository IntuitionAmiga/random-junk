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

  /**
   * FuncInfo
   *
   * Describes the runtime resolved properties of an enumerated, callable function.
   */
  struct FuncInfo {
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

  /**
   * CallInfo
   *
   * Describes the current function under evaluation.
   */
  struct CallInfo {
    const uint8* returnAddress;
    uint16       functionId;
    uint8        frameSize;
    uint8        reserved;
  };

  /**
   * Scalar
   *
   * Basic machine datatype.
   */
  union Scalar {
    int32   i;
    uint32  u;
    float32 f;
  };

  class Interpreter {
    private:
      static void*           workingSet;

      static const CallInfo* callStack;
      static const CallInfo* callStackBase;
      static const CallInfo* callStackTop;
      static Scalar*         frameStack;
      static Scalar*         frameStackBase;
      static Scalar*         frameStackTop;
      static Scalar*         indirect[3];
      static const uint8*    programCounter;

      static const FuncInfo* functionTable;
      static uint32          functionTableSize;

    public:
      enum {
        MIN_CALL_DEPTH = 8,
        MAX_CALL_DEPTH = 256,
        MIN_STACK_SIZE = FuncInfo::MAX_FRAME_SIZE,
        MAX_STACK_SIZE = FuncInfo::MAX_FRAME_SIZE * MAX_CALL_DEPTH,
        REDZONE_BUFFER = 128
      };
      static bool init(size_t rSize, size_t fSize, const FuncInfo* table);
      static bool execute(uint16 functionId);
      static void done();

    private:
      static bool validateFunctionTable(const FuncInfo* table);
  };

};

#endif
