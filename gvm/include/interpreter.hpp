#ifndef _OS25D_GVM_INTERPRETER_HPP_
  #define _OS25D_GVM_INTERPRETER_HPP_

#include "interpreter_core.hpp"

namespace GVM {

  class Interpreter : public InterpreterCore {

    public:
      void execute();

      Interpreter(uint32 dStackSize, uint32 cStackSize);
      ~Interpreter();

    void setCodeSymbolTable(const uint8** location, uint16 count) {
      codeSymbol      = location;
      codeSymbolCount = count;
    }

    void setHostCodeSymbolTable(HostCall* location, uint16 count) {
      hostCodeSymbol      = location;
      hostCodeSymbolCount = count;
    }

    void setDataSymbolTable(uint32** location, uint16 count) {
      dataSymbol      = location;
      dataSymbolCount = count;
    }

    protected:
      int  callSymbol(uint16 symbol);
  };

};

#endif
