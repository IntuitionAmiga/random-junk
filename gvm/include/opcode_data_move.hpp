#if defined(OS25D_GVM_OPCODE_DEFINE)

  // ENUMERATION ///////////////////////////////////////////////////////////////////////////////////////////////////////

  // Move small literal (0-15)
  _MOVE_LR, //  rd  = I
  _MOVE_LI, // (rd) = I

  // Float/Integer Move
  _MOVE_RR, //  rd  =  rs
  _MOVE_RI, // (rd) =  rs
  _MOVE_IR, //  rd  = (rs)
  _MOVE_II, // (rd) = (rs)
  _MOVE_MR, //  rd  =  m
  _MOVE_MI, // (rd) =  m

  _MOVE_DR, //  rd  = data[symbol_id][offset]
  _MOVE_DI, // (rd) = data[symbol_id][offset]


  // Push registers to stack (range)
  _PUSHR,

  // Pop registers from stack (range)
  _POPR,

  // Push indirect values to stack
  _PUSH_I,

  // Pop values from stack to indirect destination
  _POP_I,

  // Allocate Stack Storage
  _ASF,

  // Free Stack Storage
  _FSF,

  // Vec3 Splat
  _VSPL_LI,
  _VSPL_RI,
  _VSPL_II,
  _VSPL_LA,
  _VSPL_RA,
  _VSPL_IA,

  // Vec3 Move
  _VMVE_II,
  _VMVE_IA,
  _VMVE_AI,

#elif defined(OS25D_GVM_OPCODE_MACRO)

  // CODE MACROS ///////////////////////////////////////////////////////////////////////////////////////////////////////

  #define move_lr(sl,rd)        _OP(MOVE_LR), _SD(sl, rd),
  #define move_li(sl,rd,do)     _OP(MOVE_LI), _SD(sl, rd), _D8(do),

  // Float/Integer Move
  #define move_rr(rs,rd)        _OP(MOVE_RR), _SD(rs, rd),
  #define move_ri(rs,rd,do)     _OP(MOVE_RI), _SD(rs, rd), _D8(do),
  #define move_ir(rs,so,rd)     _OP(MOVE_IR), _SD(rs, rd), _D8(so),
  #define move_ii(rs,so,rd,do)  _OP(MOVE_II), _SD(rs, rd), _D8(so), _D8(do),
  #define move_mr(rd)           _OP(MOVE_MR), _D(rd),
  #define move_mi(rd,do)        _OP(MOVE_MI), _D(rd), _D8(do),

  // Load global data symbol
  #define move_dr(gd,so,rd)    _OP(MOVE_DR), _D(rd), _D8(so), _D16(gd),
  #define move_di(gd,so,rd,do) _OP(MOVE_DI), _D(rd), _D8(do), _D8(so), _D16(gd),

  // Push registers to stack (range)
  #define pushr(rs,rd)         _OP(PUSHR), _SD(rs, rd),

  // Pop registers from stack (range)
  #define popr(rs,rd)          _OP(POPR), _SD(rs, rd),

  // Push registers to stack (range)
  #define push_i(rs,so)         _OP(PUSH_I), _S(rs), _D8(so),

  // Pop registers from stack (range)
  #define pop_i(rd,do)          _OP(POP_I), _D(rd), _D8(do),

  // Allocate Stack Storage
  #define asf(rd,sz)           _OP(ASF), _D(rd), _D8(sz),

  // Free Stack Storage
  #define fsf(rd,sz)           _OP(FSF), _D(rd), _D8(sz),

  // Vec3 Splat
  #define vspl_li(sl,rd,do)    _OP(VSPL_LI), _SD(sl, rd), _D8(do),
  #define vspl_ri(rs,rd,do)    _OP(VSPL_RI), _SD(rs, rd), _D8(do),
  #define vspl_ii(rs,so,rd,do) _OP(VSPL_II), _SD(rs, rd), _D8(so), _D8(do),
  #define vspl_la(sl)          _OP(VSPL_LA), _S(sl),
  #define vspl_ra(rs)          _OP(VSPL_RA), _S(rs),
  #define vspl_ia(rs,so)       _OP(VSPL_IA), _S(rs), _D8(so),

  // Vec3 Move
  #define vmve_ii(rs,so,rd,do) _OP(VMVE_II), _SD(rs, rd), _D8(so), _D8(do),
  #define vmve_ia(rs,so)       _OP(VMVE_IA), _S(rs), _D8(so),
  #define vmve_ai(rd,do)       _OP(VMVE_AI), _D(rd), _D8(do),

#elif defined(OS25D_GVM_OPCODE_HANDLER)

  // HANDLER CODE //////////////////////////////////////////////////////////////////////////////////////////////////////

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
    reg[dst].f = reg_m;
    NEXT;
  }

  // Move magnitude to indirect
  IS(MOVE_MI) {
    // [opcode:8] [0:4 | dst:4] [dst_index:8]
    tmp1 = *pc++;
    reg[dst].pf[tmp1] = reg_m;
    NEXT;
  }

  // Move global data to register
  IS(MOVE_DR) {
    // [opcode:8] [0:4 | dst:4] [symbol_index:8] [data_symbol_id_msb:8] [data_symbol_id_lsb:8]

    tmp1 = *pc++;
    tmp2 = *pc++;
    uint16 symbol = ((uint16)tmp2) << 8 | *pc++;

    if (!symbol || symbol >= dataSymbolCount) {
      status = UNKNOWN_DATA_SYMBOL;
      EXIT;
    }

    reg[dst].w = dataSymbol[symbol][tmp1];

    NEXT;
  }

  // Move global data to indirect
  IS(MOVE_DI) {
    // [opcode:8] [0:4 | dst:4] [dst_index:8] [symbol_index:8] [data_symbol_id_msb:8] [data_symbol_id_lsb:8]

    tmp1 = *pc++;
    tmp2 = *pc++;
    uint16 symbol = ((uint16)*pc++) << 8; symbol |= *pc++;

    if (!symbol || symbol >= dataSymbolCount) {
      status = UNKNOWN_DATA_SYMBOL;
      EXIT;
    }

    reg[dst].pw[tmp1] = dataSymbol[symbol][tmp2];

    NEXT;
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
      Register* pop = &reg[dst];
      while (tmp2--) {
        pop->w = *(--dataStack);
        pop--;
      }
    } else {
      status = DATA_STACK_UNDERFLOW;
      EXIT;
    }
    NEXT;
  }

  // Push indirect value to stack
  IS(PUSH_I) {
    // [opcode:8] [src:4 | 0:4] [src_offset:8]

    if (dataStack < dataStackTop) {
      *dataStack++ = *(reg[src].pw);
      NEXT;
    } else {
      status = DATA_STACK_UNDERFLOW;
      EXIT;
    }
  }

  // Pop stack value to indirect
  IS(POP_I) {
    // [opcode:8] [0:4 | dst:4] [src_offset:8]

    if (dataStack > dataStackBase) {
      *(reg[src].pw) = *(--dataStack);
      NEXT;
    } else {
      status = DATA_STACK_OVERFLOW;
      EXIT;
    }
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
    reg_vs[0] = src;
    reg_vs[1] = src;
    reg_vs[2] = src;
    NEXT;
  }

  // Vector3 splat register to vector accumulator
  IS(VSPL_RA) {
    // [opcode:8] [src:4 | dst:4]
    reg_vs[0] = reg[src].f;
    reg_vs[1] = reg[src].f;
    reg_vs[2] = reg[src].f;
    NEXT;
  }

  // Vector3 splat indirect to vector accumulator
  IS(VSPL_IA) {
    // [opcode:8] [src:4 | dst:4] [src_index:8]
    tmp1       = *pc++;
    float32  s = reg[src].pf[tmp1];
    reg_vs[0] = s;
    reg_vs[1] = s;
    reg_vs[2] = s;
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
    reg_vs[0] = vs[0];
    reg_vs[1] = vs[1];
    reg_vs[2] = vs[2];
    NEXT;
  }

  // Vector3 copy vector indirect to accumulator
  IS(VMVE_AI) {
    // [opcode:8] [src:4 | dst:4] [dst_index:8]
    tmp1        = *pc++;
    float32* vd = &reg[dst].pf[tmp1];
    vd[0] = reg_vs[0];
    vd[1] = reg_vs[1];
    vd[2] = reg_vs[2];
    NEXT;
  }

#endif
