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

  // Push registers to stack (range)
  _PUSHR,

  // Pop registers from stack (range)
  _POPR,

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

  #define move_lr(sl,dr)       _OP(MOVE_LR), _SD(sl, dr),
  #define move_li(sl,dr,do)    _OP(MOVE_LI), _SD(sl, dr), _D8(do),

  // Float/Integer Move
  #define move_rr(sr,dr)       _OP(MOVE_RR), _SD(sr, dr),
  #define move_ri(sr,dr,do)    _OP(MOVE_RI), _SD(sr, dr), _D8(do),
  #define move_ir(sr,so,dr)    _OP(MOVE_IR), _SD(sr, dr), _D8(so),
  #define move_ii(sr,so,dr,do) _OP(MOVE_II), _SD(sr, dr), _D8(so), _D8(do),
  #define move_mr(dr)          _OP(MOVE_MR), _D(dr),
  #define move_mi(dr,do)       _OP(MOVE_MI), _D(dr), _D8(do),

  // Push registers to stack (range)
  #define pushr(sr,dr)         _OP(PUSHR), _SD(sr, dr),

  // Pop registers from stack (range)
  #define popr(sr,dr)          _OP(POPR), _SD(sr, dr),

  // Allocate Stack Storage
  #define asf(dr,sz)           _OP(ASF), _D(dr), _D8(sz),

  // Free Stack Storage
  #define fsf(dr,sz)           _OP(FSF), _D(dr), _D8(sz),

  // Vec3 Splat
  #define vspl_li(sl,dr,do)    _OP(VSPL_LI), _SD(sl, dr), _D8(do),
  #define vspl_ri(sr,dr,do)    _OP(VSPL_RI), _SD(sr, dr), _D8(do),
  #define vspl_ii(sr,so,dr,do) _OP(VSPL_II), _SD(sr, dr), _D8(so), _D8(do),
  #define vspl_la(sl)          _OP(VSPL_LA), _S(sl),
  #define vspl_ra(rs)          _OP(VSPL_RA), _S(rs),
  #define vspl_ia(rs,so)       _OP(VSPL_IA), _S(rs), _D8(so),


  // Vec3 Move
  #define vmve_ii(sr,so,dr,do) _OP(VMVE_II), _SD(sr, dr), _D8(so), _D8(do),
  #define vmve_ia(sr,so)       _OP(VMVE_IA), _S(sr), _D8(so),
  #define vmve_ai(dr,do)       _OP(VMVE_AI), _D(dr), _D8(do),

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

#endif
