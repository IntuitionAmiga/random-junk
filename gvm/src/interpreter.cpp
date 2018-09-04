#include <cstdio>
#include <cmath>
#include <cfloat>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"

using namespace GVM;

//

#define DISPATCH(o) switch(o)
//#define IS(o)   case Opcode::_##o: asm("# Opcode::_" #o "\n" : :);
#define IS(o)   case Opcode::_##o:
#define NEXT    goto forever
#define EXIT    goto bailout

void Interpreter::execute() {

  status = RUNNING;

forever:
  // Get the next opcode byte
  uint8 tmp1 = *pc++;

  // Speculatively decode the next byte as an operand pair as that is the most common case
  uint8 tmp2 = *pc++;
  uint8 dst  = tmp2 & 0x0F;
  uint8 src  = tmp2 >> 4;

  DISPATCH(tmp1) {

    // No Operation
    IS(NOP) {
      // [opcode]
      --pc;
      NEXT;
    }

    // Move 4-bit literal to register
    IS(MOVE_LR) {
      // [opcode:8] [L:4 | dst:4]
      reg[dst].w = src;
      NEXT;
    }

    // Move 4-bit literal to indirect
    IS(MOVE_LI) {
      // [opcode:8] [L:4 | dst:4] [dst_index:8]
      tmp2 = *pc++;
      reg[dst].pw[tmp2] = src;
      NEXT;
    }

    // Move register to register
    IS(MOVE_RR) {
      // [opcode:8] [src:4 | dst:4]
      reg[dst].w = reg[src].w;
      NEXT;
    }

    // Move register to indirect
    IS(MOVE_RI) {
      // [opcode:8] [src:4 | dst:4] [dst_index:8]
      tmp2 = *pc++;
      reg[dst].pi[tmp2] = reg[src].i;
      NEXT;
    }

    // Move indirect to register
    IS(MOVE_IR) {
      // [opcode:8] [src:4 | dst:4] [src_index:8]
      tmp2 = *pc++;
      reg[dst].i = reg[src].pi[tmp2];
      NEXT;
    }

    // Move indirect to indirect
    IS(MOVE_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pi[tmp2] = reg[src].pi[tmp1];
      NEXT;
    }

    // Branch 8-bit displacement
    IS(BRAS) {
      // [opcode:8] [signed_offset:8]
      pc += (int8)tmp2;
      NEXT;
    }

    // Branch 16-bit displacement
    IS(BRA) {
      // [opcode:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      uint16 offset = ((uint16)tmp2) << 8 | *pc;
      pc += (int16)offset;
      NEXT;
    }

    // Call 16-bit pc-relative
    IS(BCALL) {
      // [opcode:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      uint16 offset = ((uint16)tmp2) << 8 | *pc++;
      if (callStack < callStackTop) {
        *callStack++ = pc;
        pc += (int16)offset;
        NEXT;
      } else {
        status = CALL_STACK_OVERFLOW;
        EXIT;
      }
    }

    // Call 16-bit function symbol ID
    IS(CALL) {
      // [opcode:8] [symbol_id_msb:8] [symbol_id_lsb:8]
      uint16 symbol = ((uint16)tmp2) << 8 | *pc++;
      if (symbol >= codeSymbolCount) {
        status = UNKNOWN_CODE_SYMBOL;
        EXIT;
      }

      if (callStack < callStackTop) {
        *callStack++ = pc;
        pc = codeSymbol[symbol];
        NEXT;
      } else {
        status = CALL_STACK_OVERFLOW;
        EXIT;
      }
    }

    // Call 16-but host function symbol ID
    IS(CALLH) {
      // [opcode:8] [symbol_id_msb:8] [symbol_id_lsb:8]
      uint16 symbol = ((uint16)tmp2) << 8 | *pc++;
      if (symbol >= codeSymbolCount) {
        status = UNKNOWN_HOST_CODE_SYMBOL;
        EXIT;
      }

      HostCall f = hostCodeSymbol[symbol];
      if (f) {
        f(this);
        NEXT;
      } else {
        status = CALL_EMPTY_HOST;
      }
    }

    // Return from call
    IS(RET) {
      // [opcode:8]
      if (callStack > callStackBase) {
        pc = *(--callStack);
        NEXT;
      } else {
        status = COMPLETED;
        EXIT;
      }
    }

    // Push masked registers to data stack
    IS(PUSHR) {
      // [opcode:8] [reg_mask_msb:8] [reg_mask_lsb:8]
      uint16    mask = ((uint16)tmp2) << 8 | *pc++;
      Register* push = reg;
      while (mask && (dataStack < dataStackTop)) {
        if (mask & 1) {
          *dataStack++ = push->w;
          mask >>= 1;
        }
        ++push;
      }
      if (mask) {
        status = DATA_STACK_OVERFLOW;
        EXIT;
      }
      NEXT;
    }

    // Pop masked registers from data stack
    IS(POPR) {
      // [opcode:8] [reg_mask_msb:8] [reg_mask_lsb:8]
      uint16    mask = ((uint16)tmp2) << 8 | *pc++;
      Register* pop  = reg + NUM_REG - 1;
      while (mask && (dataStack > dataStackBase)) {
        if (mask & 0x8000) {
          pop->w = *(--dataStack);
          mask <<= 1;
        }
        --pop;
      }
      if (mask) {
        status = DATA_STACK_OVERFLOW;
        EXIT;
      }
      NEXT;
    }

    // Allocate Stack Frame Storage (up to 256 entries)
    IS(ASF) {
      // [opcode:8] [0:4 | dst:4] [(size-1):8]
      uint16 size = (uint16)tmp2 + 1;
      if (dataStack + size < dataStackTop) {
        reg[dst].pw = dataStack;
        dataStack += size;
        NEXT;
      }
      status = DATA_STACK_OVERFLOW;
      EXIT;
    }

    // Free Stack Frame Storage
    IS(FSF) {
      // [opcode:8] [0:4 | dst:4]
      uint32* last = reg[dst].pw;
      if (last < dataStackBase) {
        status = DATA_STACK_UNDERFLOW;
        EXIT;
      } else if (last >= dataStackTop) {
        status = DATA_STACK_OVERFLOW;
        EXIT;
      } else {
        dataStack = last;
        NEXT;
      }
    }

    // Decrement register counter and branch on non-zero
    IS(DBNZ_R) {
      // [opcode:8] [0:4 dst:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (--reg[dst].i) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Load Link and Branch if Not Null
    IS(LBNN_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if ( (reg[dst].w = reg[src].pw[tmp1]) ) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if register equal to zero
    IS(BEZ_R) {
      // [opcode:8] [0:4 dst:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (!reg[dst].w) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if indirect equal to zero
    IS(BEZ_I) {
      // [opcode:8] [0:4 dst:4] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (!reg[dst].pw[tmp1]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if register not equal to zero
    IS(BNZ_R) {
      // [opcode:8] [0:4 dst:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (reg[dst].w) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if indirect not equal to zero
    IS(BNZ_I) {
      // [opcode:8] [0:4 dst:4] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[dst].pw[tmp1]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if registers are equal
    IS(BEQ_RR) {
      // [opcode:8] [src:4 dst:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (reg[src].w == reg[dst].w) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if register and indirect are equal
    IS(BEQ_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[src].w == reg[dst].pw[tmp1]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if indirects are equal
    IS(BEQ_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (reg[src].pw[tmp1] == reg[dst].pw[tmp2]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if integer register source greater than or equal to register destination
    IS(BGE_RR) {
      // [opcode:8] [src:4 dst:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (reg[src].i >= reg[dst].i) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if integer register source greater than or equal to indirect destination
    IS(BGE_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[src].i >= reg[dst].pi[tmp1]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if integer indirect source greater than or equal to register destination
    IS(BGE_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[src].pi[tmp1] >= reg[dst].i) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if integer indirect source greater than or equal to indirect destination
    IS(BGE_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (reg[src].pi[tmp1] >= reg[dst].pi[tmp2]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if integer register source greater than register destination
    IS(BGT_RR) {
      // [opcode:8] [src:4 dst:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (reg[src].i > reg[dst].i) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if integer register source greater than indirect destination
    IS(BGT_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[src].i > reg[dst].pi[tmp1]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if integer indirect register source greater than register destination
    IS(BGT_IR) {
      // [opcode:8] [src:4 dst:4] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[src].pi[tmp1] > reg[dst].i) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if integer indirect register source greater than indirect destination
    IS(BGT_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (reg[src].pi[tmp1] > reg[dst].pi[tmp2]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Negate integer register to register
    IS(NEG_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].i = -reg[src].i;
      NEXT;
    }

    // Negate integer register to indirect
    IS(NEG_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pi[tmp1] = -reg[src].i;
      NEXT;
    }

    // Negate integer indirect to register
    IS(NEG_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].i = -reg[src].pi[tmp1];
      NEXT;
    }

    // Negate integer indirect to indirect
    IS(NEG_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pi[tmp2] = -reg[src].pi[tmp1];
      NEXT;
    }

    // Add 4-bit integer literal to register. The literal is 1-16, encoded as 0-15.
    IS(ADD_LR) {
      // [opcode:8] [(L-1):4 | dst:4]
      reg[dst].i += (src + 1);
      NEXT;
    }

    // Add 4-bit integer literal to indirect. The literal is 1-16, encoded as 0-15.
    IS(ADD_LI) {
      // [opcode:8] [L:4 | dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pi[tmp1] += (src + 1);
      NEXT;
    }

    // Add integer register to register
    IS(ADD_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].i += reg[src].i;
      NEXT;
    }

    // Add integer register to indirect
    IS(ADD_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pi[tmp1] += reg[src].i;
      NEXT;
    }

    // Add integer indirect to register
    IS(ADD_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].i += reg[src].pi[tmp1];
      NEXT;
    }

    // Add integer indirect to indirect
    IS(ADD_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pi[tmp2] += reg[src].pi[tmp1];
      NEXT;
    }

    // Subtract 4-bit integer literal from register. The literal is 1-16 encoded as 0-15.
    IS(SUB_LR) {
      // [opcode:8] [(L-1):4 | dst:4]
      reg[dst].i -= (src + 1);
      NEXT;
    }

    // Subtract 4-bit integer literal from indirect. The literal is 1-16 encoded as 0-15.
    IS(SUB_LI) {
      // [opcode:8] [(L-1):4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pi[tmp1] -= (src + 1);
      NEXT;
    }

    // Subtract integer register from register
    IS(SUB_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].i -= reg[src].i;
      NEXT;
    }

    // Subtract integer register from indirect
    IS(SUB_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pi[tmp1] -= reg[src].i;
      NEXT;
    }

    // Subtract integer indirect from register
    IS(SUB_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].i -= reg[src].pi[tmp1];
      NEXT;
    }

    // Subtract integer indirect from indirect
    IS(SUB_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pi[tmp2] -= reg[src].pi[tmp1];
      NEXT;
    }

    // Multiply integer register by 4-bit literal. The literal is 2-17, encoded as 0-15.
    IS(MUL_LR) {
      // [opcode:8] [(L-2):4 | dst:4]
      reg[dst].i *= (src + 2);
      NEXT;
    }

    // Multiply integer indirect by 4-bit literal. The literal is 2-17, encoded as 0-15.
    IS(MUL_LI) {
      // [opcode:8] [(L-2):4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pi[tmp1] *= (src + 2);
      NEXT;
    }

    // Multiply integer register by register
    IS(MUL_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].i *= reg[src].i;
      NEXT;
    }

    // Multiply integer indirect by register
    IS(MUL_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pi[tmp1] *= reg[src].i;
      NEXT;
    }

    // Multiply integer register by indirect
    IS(MUL_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].i *= reg[src].pi[tmp1];
      NEXT;
    }

    // Multiply integer indirect by indirect
    IS(MUL_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pi[tmp2] *= reg[src].pi[tmp1];
      NEXT;
    }

    // Divide integer literal into register
    IS(DIV_LR) {
      // [opcode:8] [(L-2):4 dst:4]. The literal is 2-17, encoded as 0-15.
      reg[dst].i /= (src + 2);
      NEXT;
    }

    // Divide integer literal into indirect
    IS(DIV_LI) {
      // [opcode:8] [(L-2):4 dst:4] [dst_index:8]. The literal is 2-17, encoded as 0-15.
      tmp1 = *pc++;
      reg[dst].pi[tmp1] /= (src + 2);
      NEXT;
    }

    // Divide integer register into register
    IS(DIV_RR) {
      // [opcode:8] [src:4 dst:4]
      int32 denominator =  reg[src].i;
      if (denominator) {
        reg[dst].i /= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    // Divide integer register into indirect
    IS(DIV_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      int32 denominator =  reg[src].i;
      if (denominator) {
        reg[dst].pi[tmp1] /= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    // Divide integer indirect int register
    IS(DIV_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      int32 denominator =  reg[src].pi[tmp1];
      if (denominator) {
        reg[dst].i /= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    // Divide integer indirect into indirect
    IS(DIV_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      int32 denominator =  reg[src].pi[tmp1];
      if (denominator) {
        reg[dst].pi[tmp2] /= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    // Modlulo integer literal into register
    IS(MOD_LR) {
      // [opcode:8] [(L-2):4 dst:4]. The literal is 2-17, encoded as 0-15.
      reg[dst].i %= (src + 2);
      NEXT;
    }

    // Modlulo integer literal into indirect
    IS(MOD_LI) {
      // [opcode:8] [(L-2):4 dst:4] [dst_index:8]. The literal is 2-17, encoded as 0-15.
      tmp1 = *pc++;
      reg[dst].pi[tmp1] %= (src + 2);
      NEXT;
    }

    // Modlulo integer register into register
    IS(MOD_RR) {
      // [opcode:8] [src:4 dst:4]
      int32 denominator =  reg[src].i;
      if (denominator) {
        reg[dst].i %= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    // Modlulo integer register into indirect
    IS(MOD_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      int32 denominator =  reg[src].i;
      if (denominator) {
        reg[dst].pi[tmp1] %= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    // Modlulo integer indirect into register
    IS(MOD_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      int32 denominator =  reg[src].pi[tmp1];
      if (denominator) {
        reg[dst].i %= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    // Modlulo integer indirect into indirect
    IS(MOD_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      int32 denominator =  reg[src].pi[tmp1];
      if (denominator) {
        reg[dst].pi[tmp2] &= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    // Logical AND register to register
    IS(AND_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].w &= reg[src].w;
      NEXT;
    }

    // Logical AND register to indirect
    IS(AND_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pw[tmp1] &= reg[src].w;
      NEXT;
    }

    // Logical AND indirect to register
    IS(AND_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].w &= reg[src].pw[tmp1];
      NEXT;
    }

    // Logical AND indirect to indirect
    IS(AND_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pw[tmp2] &= reg[src].pw[tmp1];
      NEXT;
    }

    // Logical OR register to register
    IS(OR_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].w |= reg[src].w;
      NEXT;
    }

    // Logical OR register to indirect
    IS(OR_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pw[tmp1] |= reg[src].w;
      NEXT;
    }

    // Logical OR indirect to register
    IS(OR_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].w |= reg[src].pw[tmp1];
      NEXT;
    }

    // Logical OR indirect to indirect
    IS(OR_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pw[tmp2] |= reg[src].pw[tmp1];
      NEXT;
    }

    // Logical XOR register to register
    IS(XOR_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].w ^= reg[src].w;
      NEXT;
    }

    // Logical XOR register to indirect
    IS(XOR_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pw[tmp1] ^= reg[src].w;
      NEXT;
    }

    // Logical XOR indirect to register
    IS(XOR_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].w ^= reg[src].pw[tmp1];
      NEXT;
    }

    // Logical XOR indirect to indirect
    IS(XOR_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pw[tmp2] ^= reg[src].pw[tmp1];
      NEXT;
    }

    // Logical NOT register to register
    IS(NOT_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].w = ~(reg[src].w);
      NEXT;
    }

    // Logical NOT register to indirect
    IS(NOT_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pw[tmp1] = ~(reg[src].w);
      NEXT;
    }

    // Logical NOT indirect to register
    IS(NOT_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].w = ~(reg[src].pw[tmp1]);
      NEXT;
    }

    // Logical NOT indirect to indirect
    IS(NOT_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pw[tmp2] = ~(reg[src].pw[tmp1]);
      NEXT;
    }

    // Logical Shift Left register by literal
    IS(LSL_LR) {
      // [opcode:8] [(L-1):4 dst:4]. The literal is 1-16, encoded as 0-15.
      reg[dst].w <<= (src + 1);
      NEXT;
    }

    // Logical Shift Left indirect by literal
    IS(LSL_LI) {
      // [opcode:8] [(L-1):4 dst:4]. The literal is 1-16, encoded as 0-15.
      tmp1 = *pc++;
      reg[dst].pw[tmp1] <<= (src + 1);
      NEXT;
    }

    // Logical Shift Left register by register
    IS(LSL_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].w <<= reg[src].w;
      NEXT;
    }

    // Logical Shift Left indirect by register
    IS(LSL_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pw[tmp1] <<= reg[src].w;
      NEXT;
    }

    // Logical Shift Left register by indirect
    IS(LSL_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].w <<= reg[src].pw[tmp1];
      NEXT;
    }

    // Logical Shift Left indirect by indirect
    IS(LSL_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pw[tmp2] <<= reg[src].pw[tmp1];
      NEXT;
    }

    // Logical Shift Right register by literal
    IS(LSR_LR) {
      // [opcode:8] [(L-1):4 dst:4]. The literal is 1-16, encoded as 0-15.
      reg[dst].w >>= (src + 1);
      NEXT;
    }

    // Logical Shift Right indirect by literal
    IS(LSR_LI) {
      // [opcode:8] [(L-1):4 dst:4]. The literal is 1-16, encoded as 0-15.
      tmp1 = *pc++;
      reg[dst].pw[tmp1] >>= (src + 1);
      NEXT;
    }

    // Logical Shift Right register by register
    IS(LSR_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].w >>= reg[src].w;
      NEXT;
    }

    // Logical Shift Right indirect by register
    IS(LSR_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pw[tmp1] >>= reg[src].w;
      NEXT;
    }

    // Logical Shift Right register by indirect
    IS(LSR_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].w >>= reg[src].pw[tmp1];
      NEXT;
    }

    // Logical Shift Right indirect by indirect
    IS(LSR_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pw[tmp2] >>= reg[src].pw[tmp1];
      NEXT;
    }

    // Negate float register to register
    IS(FNEG_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f = -reg[src].f;
      NEXT;
    }

    // Negate float register to indirect
    IS(FNEG_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] = -reg[src].f;
      NEXT;
    }

    // Negate float indirect to register
    IS(FNEG_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f = -reg[src].pf[tmp1];
      NEXT;
    }

    // Negate float indirect to indirect
    IS(FNEG_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pf[tmp2] = -reg[src].pf[tmp1];
      NEXT;
    }

    // Add float register to register
    IS(FADD_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f += reg[src].f;
      NEXT;
    }

    // Add float register to indirect
    IS(FADD_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] += reg[src].f;
      NEXT;
    }

    // Add float indirect to register
    IS(FADD_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f += reg[src].pf[tmp1];
      NEXT;
    }

    // Add float indirect to indirect
    IS(FADD_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pf[tmp2] += reg[src].pf[tmp1];
      NEXT;
    }

    // Subtract float register to register
    IS(FSUB_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f -= reg[src].f;
      NEXT;
    }

    // Subtract float register to indirect
    IS(FSUB_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] -= reg[src].f;
      NEXT;
    }

    // Subtract float indirect to register
    IS(FSUB_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f -= reg[src].pf[tmp1];
      NEXT;
    }

    // Subtract float indirect to indirect
    IS(FSUB_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pf[tmp2] -= reg[src].pf[tmp1];
      NEXT;
    }

    // Multiply float register to register
    IS(FMUL_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f *= reg[src].f;
      NEXT;
    }

    // Multiply float register to indirect
    IS(FMUL_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] *= reg[src].f;
      NEXT;
    }

    // Multiply float indirect to register
    IS(FMUL_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f *= reg[src].pf[tmp1];
      NEXT;
    }

    // Multiply float indirect to indirect
    IS(FMUL_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pf[tmp2] *= reg[src].pf[tmp1];
      NEXT;
    }

    // Divide float register to register
    IS(FDIV_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f /= reg[src].f;
      NEXT;
    }

    // Divide float register to indirect
    IS(FDIV_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] /= reg[src].f;
      NEXT;
    }

    // Divide float indirect to register
    IS(FDIV_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f /= reg[src].pf[tmp1];
      NEXT;
    }

    // Divide float indirect to indirect
    IS(FDIV_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pf[tmp2] /= reg[src].pf[tmp1];
      NEXT;
    }

    // Modulus float register to register
    IS(FMOD_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f = std::fmod(reg[dst].f, reg[src].f);
      NEXT;
    }

    // Modulus float register to indirect
    IS(FMOD_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      float32* f = &reg[dst].pf[tmp1];
      *f = std::fmod(*f, reg[src].f);
      NEXT;
    }

    // Modulus float indirect to register
    IS(FMOD_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f = std::fmod(reg[dst].f, reg[src].pf[tmp1]);
    }

    // Modulus float indirect to indirect
    IS(FMOD_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* f = &reg[dst].pf[tmp2];
      *f = std::fmod(*f, reg[src].pf[tmp1]);
      NEXT;
    }

    // Branch on floating point register to register equality within epsilon
    IS(FBEQ_RR) {
      // [opcode:8] [src:4 dst:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      float32 diff = reg[src].f - reg[dst].f;
      if (diff >= -FLT_EPSILON && diff <= FLT_EPSILON) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch on floating point register to indirect equality within epsilon
    IS(FBEQ_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      float32 diff = reg[src].f - reg[dst].pf[tmp1];
      if (diff >= -FLT_EPSILON && diff <= FLT_EPSILON) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch on floating point indirect to register equality within epsilon
    IS(FBEQ_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      float32 diff = reg[src].pf[tmp1] - reg[dst].f;
      if (diff >= -FLT_EPSILON && diff <= FLT_EPSILON) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch on floating point indirect to indirect equality within epsilon
    IS(FBEQ_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32 diff = reg[src].pf[tmp1] - reg[dst].pf[tmp2];
      if (diff >= -FLT_EPSILON && diff <= FLT_EPSILON) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch on floating point register greater than or equal to register
    IS(FBGE_RR) {
      // [opcode:8] [src:4 dst:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (reg[src].f >= reg[dst].f) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch on floating point register greater than or equal to indirect
    IS(FBGE_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[src].f >= reg[dst].pf[tmp1]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch on floating point indirect greater than or equal to register
    IS(FBGE_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[src].pf[tmp1] >= reg[dst].f) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch on floating point indirect greater than or equal to indirect
    IS(FBGE_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (reg[src].pf[tmp1] >= reg[dst].pf[tmp2]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    IS(FBGT_RR) {
      // [opcode:8] [src:4 dst:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (reg[src].f > reg[dst].f) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    IS(FBGT_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[src].f > reg[dst].pf[tmp1]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    IS(FBGT_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (reg[src].pf[tmp1] > reg[dst].f) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    IS(FBGT_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (reg[src].pf[tmp1] > reg[dst].pf[tmp2]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Square root float register to register
    IS(FSQRT_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f = std::sqrt(reg[src].f);
      NEXT;
    }

    // Square root float register to indirect
    IS(FSQRT_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] = std::sqrt(reg[src].f);
      NEXT;
    }

    // Square root float indirect to register
    IS(FSQRT_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f = std::sqrt(reg[src].pf[tmp1]);
    }

    // Square root float indirect to indirect
    IS(FSQRT_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pf[tmp2] = std::sqrt(reg[src].pf[tmp1]);
      NEXT;
    }

    // Sine float register to register
    IS(FSIN_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f = std::sin(reg[src].f);
      NEXT;
    }

    // Sine float register to indirect
    IS(FSIN_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] = std::sin(reg[src].f);
      NEXT;
    }

    // Sine float indirect to register
    IS(FSIN_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f = std::sin(reg[src].pf[tmp1]);
      NEXT;
    }

    // Sine float indirect to indirect
    IS(FSIN_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pf[tmp2] = std::sin(reg[src].pf[tmp1]);
      NEXT;
    }

    // Cosine float register to register
    IS(FCOS_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f = std::cos(reg[src].f);
      NEXT;
    }

    // Cosine float register to indirect
    IS(FCOS_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] = std::cos(reg[src].f);
      NEXT;
    }

    // Cosine float indirect to register
    IS(FCOS_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f = std::cos(reg[src].pf[tmp1]);
      NEXT;
    }

    // Cosine float indirect to indirect
    IS(FCOS_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pf[tmp2] = std::cos(reg[src].pf[tmp1]);
      NEXT;
    }

    // Tangent float register to register
    IS(FTAN_RR) {
      // [opcode:8] [src:4 dst:4]
      reg[dst].f = std::tan(reg[src].f);
      NEXT;
    }

    // Tangent float register to indirect
    IS(FTAN_RI) {
      // [opcode:8] [src:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] = std::tan(reg[src].f);
      NEXT;
    }

    // Tangent float indirect to register
    IS(FTAN_IR) {
      // [opcode:8] [src:4 dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].f = std::tan(reg[src].pf[tmp1]);
      NEXT;
    }

    // Tangent float indirect to indirect
    IS(FTAN_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      reg[dst].pf[tmp2] = std::tan(reg[src].pf[tmp1]);
      NEXT;
    }

    // Vector3 splat literal to vector
    IS(VSPL_LI) {
      // [opcode:8] [L:4 | dst:4] [dst_index:8]
      tmp1 = *pc++;
      float32* f = &reg[dst].pf[tmp1];
      f[0] = src;
      f[1] = src;
      f[2] = src;
      NEXT;
    }

    // Vector3 splat register to vector
    IS(VSPL_RI) {
      // [opcode:8] [src:4 | dst:4] [dst_index:8]
      tmp1 = *pc++;
      float32* f = &reg[dst].pf[tmp1];
      f[0] = reg[src].f;
      f[1] = reg[src].f;
      f[2] = reg[src].f;
      NEXT;
    }

    // Vector3 splat register to vector
    IS(VSPL_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32  v = reg[src].pf[tmp1];
      float32* f = &reg[dst].pf[tmp2];
      f[0] = v;
      f[1] = v;
      f[2] = v;
      NEXT;
    }

    // Vector3 copy vector indirect to vector
    IS(VMVE_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vd[0] = vs[0];
      vd[1] = vs[1];
      vd[2] = vs[2];
      NEXT;
    }

    // Vector3 branch if vector equal
    IS(VBEQ_II) {
      NEXT;
    }

    // Vector3 branch if vector not equal
    IS(VBNE_II) {
      NEXT;
    }

    // Vector3 add
    IS(VADD_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vd[0] += vs[0];
      vd[1] += vs[1];
      vd[2] += vs[2];
      NEXT;
    }

    // Vector3 subract
    IS(VSUB_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vd[0] -= vs[0];
      vd[1] -= vs[1];
      vd[2] -= vs[2];
      NEXT;
    }

    // Vector3 cross product
    IS(VMUL_II) {
      NEXT;
    }

    // Vector3 dot product to register
    IS(VDOT_IR) {
      NEXT;
    }

    // Vector3 dot product to indirect
    IS(VDOT_II) {
      NEXT;
    }

    // Vector3 magnitude to register
    IS(VMAG_IR) {
      // [opcode:8] [src:4 | dst:4] [src_index:8]
      tmp1 = *pc++;
      float32* f = &reg[src].pf[tmp1];
      reg[dst].f = std::sqrt(f[0]*f[0] + f[1]*f[1] + f[2]*f[2]);
      NEXT;
    }

    // Vector3 magnitude to indirect
    IS(VMAG_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* f = &reg[src].pf[tmp1];
      reg[dst].pf[tmp2] = std::sqrt(f[0]*f[0] + f[1]*f[1] + f[2]*f[2]);
      NEXT;
    }

    // Vector3 normalise
    IS(VNRM_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      float32  sf = 1.0f/std::sqrt(vs[0]*vs[0] + vs[1]*vs[1] + vs[2]*vs[2]);
      vd[0] = sf*vs[0];
      vd[1] = sf*vs[1];
      vd[2] = sf*vs[2];
      NEXT;
    }

    default:
      break;
  }

bailout:

  return;
}
