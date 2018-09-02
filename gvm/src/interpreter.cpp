#include <cstdio>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"

using namespace GVM;

#define DISPATCH(o) switch(o)
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
  uint8 d    = tmp2 & 0x0F;
  uint8 s    = tmp2 >> 4;

  DISPATCH(tmp1) {

    // No Operation
    IS(NOP) {
      // [opcode]
      --pc;
      NEXT;
    }

    // Move 4-bit literal to register
    IS(MOVE_LR) {
      // [opcode:8] [L:4 | d:4] 
      r[d].i = s;
      NEXT;
    }

    // Move 4-bit literal to indirect
    IS(MOVE_LI) {
      // [opcode:8] [L:4 | d:4] [d_index:8]
      tmp2 = *pc++;
      r[d].pi[tmp2] = s;
      NEXT;
    }

    // Move register to register
    IS(MOVE_RR) {
      // [opcode:8] [s:4 | d:4]
      r[d].w = r[s].w;
      NEXT;
    }

    // Move register to indirect
    IS(MOVE_RI) {
      // [opcode:8] [s:4 | d:4] [d_index:8]
      tmp2 = *pc++;
      r[d].pi[tmp2] = r[s].i;
      NEXT;
    }

    // Move indirect to register
    IS(MOVE_IR) {
      // [opcode:8] [s:4 | d:4] [s_index:8]
      tmp2 = *pc++;
      r[d].i = r[s].pi[tmp2];
      NEXT;
    }

    // Move indirect to indirect
    IS(MOVE_II) {
      // [opcode:8] [s:4 | d:4] [s_index:8] [d_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      r[d].pi[tmp2] = r[s].pi[tmp1];
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
      Register* x    = r;
      while (mask && (dataStack < dataStackTop)) {
        if (mask & 1) {
          *dataStack++ = x->w;
          mask >>= 1;
        }
        ++x;
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
      Register* x    = r + 15;
      while (mask && (dataStack > dataStackBase)) {
        if (mask & 0x8000) {
          x->w = *(--dataStack);
          mask <<= 1;
        }
        --x;
      }
      if (mask) {
        status = DATA_STACK_OVERFLOW;
        EXIT;
      }
      NEXT;
    }

    // Allocate Stack Frame Storage (up to 256 entries)
    IS(ASF) {
      // [opcode:8] [0:4 | d:4] [(size-1):8]
      uint16 size = (uint16)tmp2 + 1;
      if (dataStack + size < dataStackTop) {
        r[d].pw = dataStack;
        dataStack += size;
        NEXT;
      }
      status = DATA_STACK_OVERFLOW;
      EXIT;
    }

    // Free Stack Frame Storage
    IS(FSF) {
      // [opcode:8] [0:4 | d:4]
      uint32* last = r[d].pw;
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
      // [opcode:8] [0:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (--r[d].i) {
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
      // [opcode:8] [s:4 d:4] [s_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if ( (r[d].w = r[s].pw[tmp1]) ) {
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
      // [opcode:8] [0:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (!r[d].w) {
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
      // [opcode:8] [0:4 d:4] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (!r[d].pw[tmp1]) {
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
      // [opcode:8] [0:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (r[d].w) {
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
      // [opcode:8] [0:4 d:4] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (r[d].pw[tmp1]) {
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
      // [opcode:8] [s:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (r[s].w == r[d].w) {
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
      // [opcode:8] [s:4 d:4] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (r[s].w == r[d].pw[tmp1]) {
        tmp2 = *pc++;
        uint16 offset = ((uint16)tmp2) << 8 | *pc;
        pc += (int16)offset;
      } else {
        pc += 2;
      }
      NEXT;
    }

    // Branch if indirect and register are equal - redundant?
    IS(BEQ_IR) {
      // [opcode:8] [s:4 d:4] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (r[s].pw[tmp1] == r[d].w) {
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
      // [opcode:8] [s:4 d:4] [s_index:8] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (r[s].pw[tmp1] == r[d].pw[tmp2]) {
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
      // [opcode:8] [s:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (r[s].i >= r[d].i) {
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
      // [opcode:8] [s:4 d:4] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (r[s].i >= r[d].pi[tmp1]) {
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
      // [opcode:8] [s:4 d:4] [s_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (r[s].pi[tmp1] >= r[d].i) {
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
      // [opcode:8] [s:4 d:4] [s_index:8] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (r[s].pi[tmp1] >= r[d].pi[tmp2]) {
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
      // [opcode:8] [s:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      if (r[s].i > r[d].i) {
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
      // [opcode:8] [s:4 d:4] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (r[s].i > r[d].pi[tmp1]) {
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
      // [opcode:8] [s:4 d:4] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      if (r[s].pi[tmp1] > r[d].i) {
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
      // [opcode:8] [s:4 d:4] [s_index:8] [d_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      if (r[s].pi[tmp1] > r[d].pi[tmp2]) {
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
      // [opcode:8] [s:4 d:4]
      r[d].i = -r[s].i;
      NEXT;
    }

    // Negate integer register to indirect
    IS(NEG_RI) {
      // [opcode:8] [s:4 d:4] [d_index:8]
      tmp1 = *pc++;
      r[d].pi[tmp1] = -r[s].i;
      NEXT;
    }

    // Negate integer indirect to register
    IS(NEG_IR) {
      // [opcode:8] [s:4 d:4] [s_index:8]
      tmp1 = *pc++;
      r[d].i = -r[s].pi[tmp1];
      NEXT;
    }

    // Negate integer indirect to indirect
    IS(NEG_II) {
      // [opcode:8] [s:4 d:4] [s_index:8] [d_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      r[d].pi[tmp2] = -r[s].pi[tmp1];
      NEXT;
    }

    // Add 4-bit integer literal to register
    IS(ADD_LR) {
      // [opcode:8] [L:4 | d:4] 
      r[d].i += s;
      NEXT;
    }

    // Add 4-bit integer literal to indirect
    IS(ADD_LI) {
      // [opcode:8] [L:4 | d:4] [d_index:8]
      tmp1 = *pc++;
      r[d].pi[tmp1] += s;
      NEXT;
    }

    // Add integer register to register
    IS(ADD_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].i += r[s].i;
      NEXT;
    }

    // Add integer register to indirect
    IS(ADD_RI) {
      // [opcode:8] [s:4 d:4] [d_index:8]
      tmp1 = *pc++;
      r[d].pi[tmp1] += r[s].i;
      NEXT;
    }

    // Add integer indirect to register
    IS(ADD_IR) {
      // [opcode:8] [s:4 d:4] [s_index:8]
      tmp1 = *pc++;
      r[d].i += r[s].pi[tmp1];
      NEXT;
    }

    // Add integer indirect to indirect
    IS(ADD_II) {
      // [opcode:8] [s:4 d:4] [s_index:8] [d_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      r[d].pi[tmp2] += r[s].pi[tmp1];
      NEXT;
    }

    // Subtract 4-bit integer literal from register 
    IS(SUB_LR) {
      // [opcode:8] [L:4 | d:4] 
      r[d].i -= s;
      NEXT;
    }

    // Subtract 4-bit integer literal from indirect 
    IS(SUB_LI) {
      // [opcode:8] [s:4 d:4] [d_index:8]
      tmp1 = *pc++;
      r[d].pi[tmp1] -= s;
      NEXT;
    }

    // Subtract integer register from register
    IS(SUB_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].i -= r[s].i;
      NEXT;
    }

    // Subtract integer register from indirect
    IS(SUB_RI) {
      // [opcode:8] [s:4 d:4] [d_index:8]
      tmp1 = *pc++;
      r[d].pi[tmp1] -= r[s].i;
      NEXT;
    }

    // Subtract integer indirect from register
    IS(SUB_IR) {
      // [opcode:8] [s:4 d:4] [s_index:8]
      tmp1 = *pc++;
      r[d].i -= r[s].pi[tmp1];
      NEXT;
    }

    // Subtract integer indirect from indirect
    IS(SUB_II) {
      // [opcode:8] [s:4 d:4] [s_index:8] [d_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      r[d].pi[tmp2] -= r[s].pi[tmp1];
      NEXT;
    }

    IS(MUL_LR) {
      // [opcode:8] [(L-1):4 | d:4] 
      r[d].i *= s;
      NEXT;
    }

    IS(MUL_LI) {
      NEXT;
    }

    IS(MUL_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].i *= r[s].i;
      NEXT;
    }

    IS(MUL_RI) {
      NEXT;
    }

    IS(MUL_IR) {
      NEXT;
    }

    IS(MUL_II) {
      NEXT;
    }

    IS(DIV_LR) {
      NEXT;
    }

    IS(DIV_LI) {
      NEXT;
    }

    IS(DIV_RR) {
      // [opcode:8] [s:4 d:4]
      int32 denominator =  r[s].i;
      if (denominator) {
        r[d].i /= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    IS(DIV_RI) {
      NEXT;
    }

    IS(DIV_IR) {
      NEXT;
    }

    IS(DIV_II) {
      NEXT;
    }

    IS(MOD_LR) {
      NEXT;
    }

    IS(MOD_LI) {
      NEXT;
    }

    IS(MOD_RR) {
      // [opcode:8] [s:4 d:4]
      int32 denominator =  r[s].i;
      if (denominator) {
        r[d].i %= denominator;
        NEXT;
      } else {
        status = ZERO_DIVIDE;
        EXIT;
      }
    }

    IS(MOD_RI) {
      NEXT;
    }

    IS(MOD_IR) {
      NEXT;
    }

    IS(MOD_II) {
      NEXT;
    }

    IS(AND_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].w &= r[s].w;
      NEXT;
    }

    IS(AND_RI) {
      NEXT;
    }

    IS(AND_IR) {
      NEXT;
    }

    IS(AND_II) {
      NEXT;
    }

    IS(OR_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].w |= r[s].w;
      NEXT;
    }

    IS(OR_RI) {
      NEXT;
    }

    IS(OR_IR) {
      NEXT;
    }

    IS(OR_II) {
      NEXT;
    }

    IS(XOR_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].w ^= r[s].w;
      NEXT;
    }

    IS(XOR_RI) {
      NEXT;
    }

    IS(XOR_IR) {
      NEXT;
    }

    IS(XOR_II) {
      NEXT;
    }

    IS(NOT_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].w = ~(r[s].w);
      NEXT;
    }

    IS(NOT_RI) {
      NEXT;
    }

    IS(NOT_IR) {
      NEXT;
    }

    IS(NOT_II) {
      NEXT;
    }

    IS(LSL_LR) {
      NEXT;
    }

    IS(LSL_LI) {
      NEXT;
    }

    IS(LSL_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].w <<= r[s].w;
      NEXT;
    }

    IS(LSL_RI) {
      NEXT;
    }

    IS(LSL_IR) {
      NEXT;
    }

    IS(LSL_II) {
      NEXT;
    }

    IS(LSR_LR) {
      NEXT;
    }

    IS(LSR_LI) {
      NEXT;
    }

    IS(LSR_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].w >>= r[s].w;
      NEXT;
    }

    IS(LSR_RI) {
      NEXT;
    }

    IS(LSR_IR) {
      NEXT;
    }

    IS(LSR_II) {
      NEXT;
    }

    IS(FNEG_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].f = -r[s].f;
      NEXT;
    }

    IS(FNEG_RI) {
      NEXT;
    }

    IS(FNEG_IR) {
      NEXT;
    }

    IS(FNEG_II) {
      NEXT;
    }

    IS(FADD_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].f += r[s].f;
      NEXT;
    }

    IS(FADD_RI) {
      NEXT;
    }

    IS(FADD_IR) {
      NEXT;
    }

    IS(FADD_II) {
      NEXT;
    }

    IS(FSUB_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].f -= r[s].f;
      NEXT;
    }

    IS(FSUB_RI) {
      NEXT;
    }

    IS(FSUB_IR) {
      NEXT;
    }

    IS(FSUB_II) {
      NEXT;
    }

    IS(FMUL_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].f *= r[s].f;
      NEXT;
    }

    IS(FMUL_RI) {
      NEXT;
    }

    IS(FMUL_IR) {
      NEXT;
    }

    IS(FMUL_II) {
      NEXT;
    }

    IS(FDIV_RR) {
      // [opcode:8] [s:4 d:4]
      r[d].f /= r[s].f;
      NEXT;
    }

    IS(FDIV_RI) {
      NEXT;
    }

    IS(FDIV_IR) {
      NEXT;
    }

    IS(FDIV_II) {
      NEXT;
    }

    IS(FMOD_RR) {
      NEXT;
    }

    IS(FMOD_RI) {
      NEXT;
    }

    IS(FMOD_IR) {
      NEXT;
    }

    IS(FMOD_II) {
      NEXT;
    }

    IS(FBEQ_RR) {
      NEXT;
    }

    IS(FBEQ_RI) {
      NEXT;
    }

    IS(FBEQ_IR) {
      NEXT;
    }

    IS(FBEQ_II) {
      NEXT;
    }

    IS(FBGE_RR) {
      NEXT;
    }

    IS(FBGE_RI) {
      NEXT;
    }

    IS(FBGE_IR) {
      NEXT;
    }

    IS(FBGE_II) {
      NEXT;
    }

    IS(FBGT_RR) {
      NEXT;
    }

    IS(FBGT_RI) {
      NEXT;
    }

    IS(FBGT_IR) {
      NEXT;
    }

    IS(FBGT_II) {
      NEXT;
    }

    IS(FSQRT_RR) {
      NEXT;
    }

    IS(FSQRT_RI) {
      NEXT;
    }

    IS(FSQRT_IR) {
      NEXT;
    }

    IS(FSQRT_II) {
      NEXT;
    }

    IS(FSIN_RR) {
      NEXT;
    }

    IS(FSIN_RI) {
      NEXT;
    }

    IS(FSIN_IR) {
      NEXT;
    }

    IS(FSIN_II) {
      NEXT;
    }

    IS(FCOS_RR) {
      NEXT;
    }

    IS(FCOS_RI) {
      NEXT;
    }

    IS(FCOS_IR) {
      NEXT;
    }

    IS(FCOS_II) {
      NEXT;
    }

    IS(FTAN_RR) {
      NEXT;
    }

    IS(FTAN_RI) {
      NEXT;
    }

    IS(FTAN_IR) {
      NEXT;
    }

    IS(FTAN_II) {
      NEXT;
    }

    IS(VSPL_LI) {
      NEXT;
    }

    IS(VSPL_RI) {
      NEXT;
    }

    IS(VSPL_II) {
      NEXT;
    }

    IS(VMVE_II) {
      NEXT;
    }

    IS(VBEQ_II) {
      NEXT;
    }

    IS(VBNE_II) {
      NEXT;
    }

    IS(VADD_II) {
      NEXT;
    }

    IS(VSUB_II) {
      NEXT;
    }

    IS(VMUL_II) {
      NEXT;
    }

    IS(VDOT_IR) {
      NEXT;
    }

    IS(VDOT_II) {
      NEXT;
    }

    IS(VMAG_IR) {
      NEXT;
    }

    IS(VMAG_II) {
      NEXT;
    }

    IS(VNRM_II) {
      NEXT;
    }

    default:
      break;
  }

bailout:

  return;
}
