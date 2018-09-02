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
  uint8 tmp1 = *pc++;

  // Speculatively decode the next byte as an operand pair as that is the most common case
  uint8 tmp2 = *pc++;  
  uint8 d    = tmp2 & 0x0F;
  uint8 s    = tmp2 >> 4;

  DISPATCH(tmp1) {
    IS(NOP) {
      // [opcode]
      --pc;
      NEXT;
    }

    IS(MOVE_LR) {
      // [opcode:8] [L:4 | d:4] 
      r[d].i = s;
      NEXT;
    }

    IS(MOVE_LI) {
      // [opcode:8] [L:4 | d:4] [d_index:8]
      tmp2 = *pc++;
      r[d].pi[tmp2] = s;
      NEXT;
    }

    IS(MOVE_RR) {
      // [opcode:8] [s:4 | d:4]
      r[d].i = r[s].i;
      NEXT;
    }

    IS(MOVE_RI) {
      // [opcode:8] [s:4 | d:4] [d_index:8]
      tmp2 = *pc++;
      r[d].pi[tmp2] = r[s].i;
      NEXT;
    }

    IS(MOVE_IR) {
      // [opcode:8] [s:4 | d:4] [s_index:8]
      tmp2 = *pc++;
      r[d].i = r[s].pi[tmp2];
      NEXT;
    }

    IS(MOVE_II) {
      // [opcode:8] [s:4 | d:4] [s_index:8] [d_index:8]
      tmp1 = *pc++;
      tmp2 = *pc++;
      r[d].pi[tmp2] = r[s].pi[tmp1];
      NEXT;
    }

    IS(BRAS) {
      // [opcode:8] [signed_offset:8]
      pc += (int8)tmp2;
      NEXT;
    }

    IS(BRA) {
      // [opcode:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      uint16 offset = ((uint16)tmp2) << 8 | *pc;
      pc += (int16)offset;
      NEXT;
    }

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

    IS(ASF) {
      // [opcode:8] [0:4 | d:4] [(size-1):8]
      NEXT;
    }

    IS(FSF) {
      // [opcode:8] [0:4 | s:4]
      NEXT;
    }

    IS(DBNZ_R) {
      // [opcode:8] [0:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      NEXT;
    }

    IS(LBNN_IR) {
      // [opcode:8] [s:4 d:4] [s_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      NEXT;
    }

    IS(BEZ_R) {
      // [opcode:8] [0:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      NEXT;
    }
   
    IS(BEZ_I) {
      // [opcode:8] [s:4 d:4] [s_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      NEXT;
    }

    IS(BNZ_R) {
      // [opcode:8] [0:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      NEXT;
    }

    IS(BNZ_I) {
      // [opcode:8] [s:4 d:4] [s_index:8] [signed_offset_msb:8] [signed_offset_lsb:8]
      NEXT;
    }

    IS(BEQ_RR) {
      // [opcode:8] [s:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      NEXT;
    }

    IS(BEQ_RI) {
      NEXT;
    }

    IS(BEQ_IR) {
      NEXT;
    }

    IS(BEQ_II) {
      NEXT;
    }

    IS(BGE_RR) {
      // [opcode:8] [s:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      NEXT;
    }

    IS(BGE_RI) {
      NEXT;
    }

    IS(BGE_IR) {
      NEXT;
    }

    IS(BGE_II) {
      NEXT;
    }

    IS(BGT_RR) {
      // [opcode:8] [s:4 d:4] [signed_offset_msb:8] [signed_offset_lsb:8]
      NEXT;
    }

    IS(BGT_RI) {
      NEXT;
    }

    IS(BGT_IR) {
      NEXT;
    }

    IS(BGT_II) {
      NEXT;
    }

    IS(NEG_RR) {
      // [opcode:8] [s:4 d:4]
      NEXT;
    }

    IS(NEG_RI) {
      NEXT;
    }

    IS(NEG_IR) {
      NEXT;
    }

    IS(NEG_II) {
      NEXT;
    }

    IS(ADD_LR) {
      NEXT;
    }

    IS(ADD_LI) {
      NEXT;
    }

    IS(ADD_RR) {
      NEXT;
    }

    IS(ADD_RI) {
      NEXT;
    }

    IS(ADD_IR) {
      NEXT;
    }

    IS(ADD_II) {
      NEXT;
    }

    IS(SUB_LR) {
      NEXT;
    }

    IS(SUB_LI) {
      NEXT;
    }

    IS(SUB_RR) {
      NEXT;
    }

    IS(SUB_RI) {
      NEXT;
    }

    IS(SUB_IR) {
      NEXT;
    }

    IS(SUB_II) {
      NEXT;
    }

    IS(MUL_LR) {
      NEXT;
    }

    IS(MUL_LI) {
      NEXT;
    }

    IS(MUL_RR) {
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
      NEXT;
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
      NEXT;
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
