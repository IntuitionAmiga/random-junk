#ifndef _OS25D_GVM_INTERPRETER_HPP_
  #define _OS25D_GVM_INTERPRETER_HPP_

namespace GVM {

  class Interpreter {

    public:
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
        uint32  w;
      };

      typedef void (*HostCall)(Interpreter* vm);

    private:
      Register r[16];

      // Program counter
      const uint8*  pc;

      // Status register
      uint32 status;

      // Stacks
      const uint8** callStack;
      uint32*       dataStack;

      // Stack limits
      const uint8** callStackBase;
      const uint8** callStackTop;
      uint32*       dataStackBase;
      uint32*       dataStackTop;

      // Synbol Tables
      const uint8** codeSymbol;
      HostCall*     hostCodeSymbol;
      uint32**      dataSymbol;
 
      uint16        codeSymbolCount;
      uint16        hostCodeSymbolCount;
      uint16        dataSymbolCount;

    public:
      void execute();      
  };

};

#endif
