#ifndef _OS25D_GVM_INTERPRETER_CORE_HPP_
  #define _OS25D_GVM_INTERPRETER_CORE_HPP_

namespace GVM {

  /**
   * Static realisation of GVM interpreter
   */
  class Interpreter {

    public:
      enum {
        NUM_REG = 16
      };

      // Machune statys
      typedef enum {
        RUNNING = 0,
        INITIAL,
        COMPLETED,
        BREAKPOINT,
        ILLEGAL_OPCODE,
        ZERO_DIVIDE,
        DATA_STACK_OVERFLOW,
        DATA_STACK_UNDERFLOW,
        CALL_STACK_OVERFLOW,
        CALL_EMPTY,
        CALL_EMPTY_HOST,
        UNKNOWN_CODE_SYMBOL,
        UNKNOWN_DATA_SYMBOL,
        UNKNOWN_HOST_CODE_SYMBOL,
        ILLEGAL_CALLABLE_SYMBOL,

        _MAX_STATUS
      } Status;

      // Basic Register Definition
      union Register {
        int32   i, *pi;
        float32 f, *pf;
        vec3f      *pv;
        uint32  w, *pw;
      };

      typedef void (*HostCall)();

      static uint32 init(uint32 callStackSize, uint32 dataStackSize);
      static void   done();
      static uint32 execute();

    protected:
      // General Purpose Registers
      static Register reg[NUM_REG];

      // Vector3 Scratch and Magnitude
      static float32  reg_vs[3];
      static float32  reg_m;

      // Program counter
      static const uint8*  pc;

      // Status register
      static uint32 status;

      // Stacks
      static const uint8** callStack;
      static uint32*       dataStack;

      // Stack limits
      static const uint8** callStackBase;
      static const uint8** callStackTop;
      static uint32*       dataStackBase;
      static uint32*       dataStackTop;

      // Symbol Tables
      static const uint8** codeSymbol;
      static HostCall*     hostCodeSymbol;
      static uint32**      dataSymbol;

      static uint16        codeSymbolCount;
      static uint16        hostCodeSymbolCount;
      static uint16        dataSymbolCount;

      static int  callSymbol(uint16 symbol);
  };

};

#endif
