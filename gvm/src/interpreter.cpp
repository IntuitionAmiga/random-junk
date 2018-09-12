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
      tmp1 = *pc++;
      reg[dst].pw[tmp1] = src;
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
      tmp1 = *pc++;
      reg[dst].pi[tmp1] = reg[src].i;
      NEXT;
    }

    // Move indirect to register
    IS(MOVE_IR) {
      // [opcode:8] [src:4 | dst:4] [src_index:8]
      tmp1 = *pc++;
      reg[dst].i = reg[src].pi[tmp1];
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

    // Move magnitude to register
    IS(MOVE_MR) {
      // [opcode:8] [0:4 | dst:4]
      reg[dst].f = vacc[3];
      NEXT;
    }

    // Move magnitude to indirect
    IS(MOVE_MI) {
      // [opcode:8] [0:4 | dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] = vacc[3];
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

    // Table jump (small), up to 18 8-bit displacements
    IS(TJMPS) {
      // [opcode:8] [(N-2):4 | reg:4] [offset_0:8] [offset_1:8]...[offset_N-1:8]

      // Source nybble is table size - 2
      src += 2;

      // Get the jump index
      tmp1 = reg[dst].w;

      // Any values greater than the max fall through to the code after the jump
      if (tmp1 > src) {
        // Skip to the next instruction after the last table entry
        pc += src;
      } else {
        tmp2 = pc[tmp1];
        pc += (int8)tmp2;
      }
      NEXT;
    }

    // Table jump, up to 258 16-bit displacements
    IS(TJMP) {
      // [opcode:8] [0:4 | reg:4] [(N-2):8] [offset_0_MSB:8] [offset_0_LSB:8]...

      // First extension byte is table size - 2.
      uint16 size = ((*pc++) + 2);

      // Get the jump index
      uint16 jump = reg[dst].w;

      // Any values greater than the max fall through to the code after the jump
      if (jump > size) {
        // Skip to the next instruction after the last table entry
        pc += size;
      } else {
        // Double the jump index as each entry is 2 bytes
        jump <<= 1;
        size = pc[jump] << 8 | pc[jump+1];
        pc += (int16)size;
      }
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
      if (call(symbol)) {
        NEXT;
      }
      EXIT;
    }

    // Function call (16-bit ID in register)
    IS(CALL_R) {
      uint16 symbol = reg[src].w;
      if (call(symbol)) {
        NEXT;
      }
      EXIT;
    }

    // Function call (16-bit ID via indirect)
    IS(CALL_I) {
      tmp1 = *pc++;
      uint16 symbol = reg[src].pw[tmp1];
      if (call(symbol)) {
        NEXT;
      }
      EXIT;
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
        EXIT;
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

    // Push registers to data stack
    IS(PUSHR) {
      // [opcode:8] [range_start:4 range_end:4]

      tmp2 = 1 + (dst - src);
      if ((dataStack + tmp2) < dataStackTop) {
        Register* push = &reg[src];
        while (tmp2--) {
          *dataStack++ = push->w;
          push++;
        }
      } else {
        status = DATA_STACK_OVERFLOW;
        EXIT;
      }
      NEXT;
    }

    // Pop registers from data stack
    IS(POPR) {
      // [opcode:8] [range_start:4 range_end:4]

      tmp2 = 1 + (dst - src);
      if ((dataStack - tmp1) > dataStackBase) {

      } else {
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
        tmp1 = *pc++;
        uint16 offset = ((uint16)tmp1) << 8 | *pc;
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
        tmp1 = *pc++;
        uint16 offset = ((uint16)tmp1) << 8 | *pc;
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
        tmp1 = *pc++;
        uint16 offset = ((uint16)tmp1) << 8 | *pc;
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
        tmp1 = *pc++;
        uint16 offset = ((uint16)tmp1) << 8 | *pc;
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
        tmp1 = *pc++;
        uint16 offset = ((uint16)tmp1) << 8 | *pc;
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
        tmp1 = *pc++;
        uint16 offset = ((uint16)tmp1) << 8 | *pc;
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
        tmp1 = *pc++;
        uint16 offset = ((uint16)tmp1) << 8 | *pc;
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
        tmp1 = *pc++;
        uint16 offset = ((uint16)tmp1) << 8 | *pc;
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
        tmp1 = *pc++;
        uint16 offset = ((uint16)tmp1) << 8 | *pc;
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
      tmp1        = *pc++;
      float32* vd = &reg[dst].pf[tmp1];
      vd[0] = src;
      vd[1] = src;
      vd[2] = src;
      NEXT;
    }

    // Vector3 splat register to vector
    IS(VSPL_RI) {
      // [opcode:8] [src:4 | dst:4] [dst_index:8]
      tmp1        = *pc++;
      float32* vd = &reg[dst].pf[tmp1];
      vd[0] = reg[src].f;
      vd[1] = reg[src].f;
      vd[2] = reg[src].f;
      NEXT;
    }

    // Vector3 splat indirect to vector
    IS(VSPL_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32   s = reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vd[0] = s;
      vd[1] = s;
      vd[2] = s;
      NEXT;
    }

    // Vector3 splat literal to vector accumulator
    IS(VSPL_LA) {
      // [opcode:8] [L:4 | dst:4]
      vacc[0] = src;
      vacc[1] = src;
      vacc[2] = src;
      NEXT;
    }

    // Vector3 splat register to vector accumulator
    IS(VSPL_RA) {
      // [opcode:8] [src:4 | dst:4]
      vacc[0] = reg[src].f;
      vacc[1] = reg[src].f;
      vacc[2] = reg[src].f;
      NEXT;
    }

    // Vector3 splat indirect to vector accumulator
    IS(VSPL_IA) {
      // [opcode:8] [src:4 | dst:4] [src_index:8]
      tmp1       = *pc++;
      float32  s = reg[src].pf[tmp1];
      vacc[0] = s;
      vacc[1] = s;
      vacc[2] = s;
      NEXT;
    }

    // Vector3 copy vector indirect to vector
    IS(VMVE_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1        = *pc++;
      tmp2        = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vd[0] = vs[0];
      vd[1] = vs[1];
      vd[2] = vs[2];
      NEXT;
    }

    // Vector3 copy vector indirect to accumulator
    IS(VMVE_IA) {
      // [opcode:8] [src:4 | dst:4] [src_index:8]
      tmp1        = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      vacc[0] = vs[0];
      vacc[1] = vs[1];
      vacc[2] = vs[2];
      NEXT;
    }

    // Vector3 copy vector indirect to accumulator
    IS(VMVE_AI) {
      // [opcode:8] [src:4 | dst:4] [dst_index:8]
      tmp1        = *pc++;
      float32* vd = &reg[dst].pf[tmp1];
      vd[0] = vacc[0];
      vd[1] = vacc[1];
      vd[2] = vacc[2];
      NEXT;
    }

    // Vector3 branch if vectors equal
    IS(VBEQ_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (
        reg[src].pw[tmp1] == reg[dst].pw[tmp2] &&
        reg[src].pw[tmp1 + 1] == reg[dst].pw[tmp2 + 1] &&
        reg[src].pw[tmp1 + 2] == reg[dst].pw[tmp2 + 2]
      ) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Vector3 branch if vector and accumulator equal
    IS(VBEQ_IA) {
      // todo
      pc += 3;
      NEXT;
    }


    // Vector3 branch if vectors not equal
    IS(VBNE_II) {
      // [opcode:8] [src:4 dst:4] [src_index:8] [dst_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (
        reg[src].pw[tmp1] != reg[dst].pw[tmp2] ||
        reg[src].pw[tmp1 + 1] != reg[dst].pw[tmp2 + 1] ||
        reg[src].pw[tmp1 + 2] != reg[dst].pw[tmp2 + 2]
      ) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Vector3 branch if vector and accumulator not equal
    IS(VBNE_IA) {
      // todo
      pc += 3;
      NEXT;
    }

    // Vector3 scale by float register
    IS(VSCL_RI) {
      // [opcode:8] [src:4 | dst:4] [dst_index:8]
      tmp1        = *pc++;
      float32* vd = &reg[dst].pf[tmp1];
      vd[0] *= reg[src].f;
      vd[1] *= reg[src].f;
      vd[2] *= reg[src].f;
      NEXT;
    }

    // Vector3 scale by float indirect
    IS(VSCL_II) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32  s  = reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vd[0] *= s;
      vd[1] *= s;
      vd[2] *= s;
      NEXT;
    }

    // Vector3 scale by float magnitude register
    IS(VSCL_MI) {
      // [opcode:8] [0:4 | dst:4] [dst_index:8]
      tmp1        = *pc++;
      float32* vd = &reg[dst].pf[tmp1];
      vd[0] *= vacc[3];
      vd[1] *= vacc[3];
      vd[2] *= vacc[3];
      NEXT;
    }

    // Vector3 accumulator scale by float register
    IS(VSCL_RA) {
      // [opcode:8] [src:4 | 0:4]
      vacc[0] *= reg[src].f;
      vacc[1] *= reg[src].f;
      vacc[2] *= reg[src].f;
      NEXT;
    }

    // Vector3 accumulator scale by float indirect
    IS(VSCL_IA) {
      // [opcode:8] [src:4 | 0:4] [src_index:8]
      tmp1      = *pc++;
      float32 s = reg[src].pf[tmp1];
      vacc[0] *= s;
      vacc[1] *= s;
      vacc[2] *= s;
      NEXT;
    }

    // Vector3 accumulator scale by float magnitude
    IS(VSCL_MA) {
      // [opcode:8]
      vacc[0] *= vacc[3];
      vacc[1] *= vacc[3];
      vacc[2] *= vacc[3];
      pc--;
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

    // Vector3 add to accumulator
    IS(VADD_IA) {
      // [opcode:8] [src:4 | dst:4] [src_index:8]
      tmp1 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      vacc[0] += vs[0];
      vacc[1] += vs[1];
      vacc[2] += vs[2];
      NEXT;
    }

    // Vector3 add from accumulator
    IS(VADD_AI) {
      // [opcode:8] [src:4 | dst:4] [dst_index:8]
      tmp1 = *pc++;
      float32* vd = &reg[dst].pf[tmp1];
      vd[0] += vacc[0];
      vd[1] += vacc[1];
      vd[2] += vacc[2];
      NEXT;
    }

    // Vector3 add pair and replace accumulator
    IS(VADD_IIA) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vacc[0] = vd[0] + vs[0];
      vacc[1] = vd[1] + vs[1];
      vacc[2] = vd[2] + vs[2];
      NEXT;
    }

    // Vector3 add vector and accumulator into vector
    IS(VADD_IAI) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vd[0] = vs[0] + vacc[0];
      vd[1] = vs[1] + vacc[1];
      vd[2] = vs[2] + vacc[2];
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

    // Vector3 subtract from accumulator
    IS(VSUB_IA) {
      // [opcode:8] [src:4 | dst:4] [src_index:8]
      tmp1 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      vacc[0] -= vs[0];
      vacc[1] -= vs[1];
      vacc[2] -= vs[2];
      NEXT;
    }

    // Vector3 subtract accumulator from vector
    IS(VSUB_AI) {
      // [opcode:8] [src:4 | dst:4] [dst_index:8]
      tmp1 = *pc++;
      float32* vd = &reg[dst].pf[tmp1];
      vd[0] -= vacc[0];
      vd[1] -= vacc[1];
      vd[2] -= vacc[2];
      NEXT;
    }

    // Vector3 subtract pair and replace accumulator
    IS(VSUB_IIA) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vacc[0] = vd[0] - vs[0];
      vacc[1] = vd[1] - vs[1];
      vacc[2] = vd[2] - vs[2];
      NEXT;
    }

    // Vector3 subtract accumulator from vector into vector
    IS(VSUB_IAI) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vd[0] = vs[0] - vacc[0];
      vd[1] = vs[1] - vacc[1];
      vd[2] = vs[2] - vacc[2];
      NEXT;
    }

    // Vector3 subtract vector from accumulator into vector
    IS(VSUB_AII) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vd[0] = vacc[0] - vs[0];
      vd[1] = vacc[1] - vs[1];
      vd[2] = vacc[2] - vs[2];
      NEXT;
    }

    // Vector3 cross product vectors into accumulator
    IS(VMUL_IIA) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* src1 = &reg[src].pf[tmp1];
      float32* src2 = &reg[dst].pf[tmp2];
      // x =  v1.y * v2.z - v1.z * v2.y,
      // y =  v1.z * v2.x - v1.x * v2.z,
      // z =  v1.x * v2.y - v1.y * v2.x
      vacc[0] = src1[1] * src2[2] - src1[2] * src2[1];
      vacc[1] = src1[2] * src2[0] - src1[0] * src2[2];
      vacc[2] = src1[0] * src2[1] - src1[1] * src2[0];
      NEXT;
    }

    // Vector3 cross product vector with accumulator into vector
    IS(VMUL_AII) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      // x =  v1.y * v2.z - v1.z * v2.y,
      // y =  v1.z * v2.x - v1.x * v2.z,
      // z =  v1.x * v2.y - v1.y * v2.x
      vd[0] = vacc[1] * vs[2] - vacc[2] * vs[1];
      vd[1] = vacc[2] * vs[0] - vacc[0] * vs[2];
      vd[2] = vacc[0] * vs[1] - vacc[1] * vs[0];
      NEXT;
    }

    // Vector3 cross product vector with accumulator into vector
    IS(VMUL_IAI) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      // x =  v1.y * v2.z - v1.z * v2.y,
      // y =  v1.z * v2.x - v1.x * v2.z,
      // z =  v1.x * v2.y - v1.y * v2.x
      vd[0] = vs[1] * vacc[2] - vs[2] * vacc[1];
      vd[1] = vs[2] * vacc[0] - vs[0] * vacc[2];
      vd[2] = vs[0] * vacc[1] - vs[1] * vacc[0];
      NEXT;
    }

    // Vector3 dot product product of two vectors, into accumulator magnitude
    IS(VDOT_IIM) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32* vd = &reg[dst].pf[tmp2];
      vacc[3] = vd[0] * vs[0] + vd[1] * vs[1] + vd[2] * vs[2];
      NEXT;
    }

    // Vector3 dot product of accumulator, vector into register
    IS(VDOT_AIR) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      reg[dst].f = vacc[0] * vs[0] + vacc[1] * vs[1] + vacc[2] * vs[2];
      NEXT;
    }

    // Vector3 dot product of accumulator, vector into indirect
    IS(VDOT_AII) {
      // [opcode:8] [src:4 | dst:4] [src_index:8] [dst_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      reg[dst].pf[tmp2] = vacc[0] * vs[0] + vacc[1] * vs[1] + vacc[2] * vs[2];
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

    // Vector3 accumulator magnitude to register
    IS(VMAG_AR) {
      // [opcode:8] [0:4 | dst:4]
      reg[dst].f = std::sqrt(vacc[0]*vacc[0] + vacc[1]*vacc[1] + vacc[2]*vacc[2]);
      NEXT;
    }

    // Vector3 accumulator magnitude to indirect
    IS(VMAG_AI) {
      // [opcode:8] [0:4 | dst:4] [dst_index:8]
      tmp1 = *pc++;
      reg[dst].pf[tmp1] = std::sqrt(vacc[0]*vacc[0] + vacc[1]*vacc[1] + vacc[2]*vacc[2]);
      NEXT;
    }

    // Vector3 accumulator magnitude to accumulator
    IS(VMAG_M) {
      // [opcode:8]
      vacc[3] = std::sqrt(vacc[0]*vacc[0] + vacc[1]*vacc[1] + vacc[2]*vacc[2]);

      // No operands, back up a byte
      --pc;
      NEXT;
    }

    // Vector3 normalise in place
    IS(VNRM_I) {
      // [opcode:8] [0:4 dst:4] [dst_index:8]
      tmp1 = *pc++;
      float32* vd = &reg[dst].pf[tmp1];
      float32  sf = 1.0f/std::sqrt(vd[0]*vd[0] + vd[1]*vd[1] + vd[2]*vd[2]);
      vd[0] *= sf;
      vd[1] *= sf;
      vd[2] *= sf;
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

    // Vector3 normalise to accumulator
    IS(VNRM_IA) {
      // [opcode:8] [src:4 | 0:4] [src_index:8]
      tmp1 = *pc++;
      float32* vs = &reg[src].pf[tmp1];
      float32  sf = 1.0f/std::sqrt(vs[0]*vs[0] + vs[1]*vs[1] + vs[2]*vs[2]);
      vacc[0] = sf*vs[0];
      vacc[1] = sf*vs[1];
      vacc[2] = sf*vs[2];
      NEXT;
    }

    // Vector3 normalise from accumulator
    IS(VNRM_AI) {
      // [opcode:8] [0:4 | dst:4] [dst_index:8]
      tmp1 = *pc++;
      float32* vd = &reg[dst].pf[tmp1];
      float32  sf = 1.0f/std::sqrt(vacc[0]*vacc[0] + vacc[1]*vacc[1] + vacc[2]*vacc[2]);
      vd[0] = sf*vacc[0];
      vd[1] = sf*vacc[1];
      vd[2] = sf*vacc[2];
      NEXT;
    }

    // Vector3 normalise accumulator in place
    IS(VNRM_A) {
      // [opcode:8]
      float32  sf = 1.0f/std::sqrt(vacc[0]*vacc[0] + vacc[1]*vacc[1] + vacc[2]*vacc[2]);
      vacc[0] *= sf;
      vacc[1] *= sf;
      vacc[2] *= sf;

      // no operands, back up a byte
      --pc;
      NEXT;
    }

    default:
      status = ILLEGAL_OPCODE;
  }

bailout:

  return;
}

int Interpreter::call(uint16 symbol) {
  if (!symbol || symbol >= codeSymbolCount) {
    status = UNKNOWN_CODE_SYMBOL;
    return 0;
  }

  if (callStack < callStackTop) {
    *callStack++ = pc;
    pc = codeSymbol[symbol];
    return 1;
  } else {
    status = CALL_STACK_OVERFLOW;
    return 0;
  }
}

