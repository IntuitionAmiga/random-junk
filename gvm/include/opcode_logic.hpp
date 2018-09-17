#if defined(OS25D_GVM_OPCODE_DEFINE)

  // ENUMERATION ///////////////////////////////////////////////////////////////////////////////////////////////////////

  // Logic AND
  _AND_RR,
  _AND_RI,
  _AND_IR,
  _AND_II,

  // Logic OR
  _OR_RR,
  _OR_RI,
  _OR_IR,
  _OR_II,

  // Logic XOR
  _XOR_RR,
  _XOR_RI,
  _XOR_IR,
  _XOR_II,

  // Logic NOT
  _NOT_RR,
  _NOT_RI,
  _NOT_IR,
  _NOT_II,

  // Logic SHL
  _LSL_LR,
  _LSL_LI,
  _LSL_RR,
  _LSL_RI,
  _LSL_IR,
  _LSL_II,

  // Logic SHR
  _LSR_LR,
  _LSR_LI,
  _LSR_RR,
  _LSR_RI,
  _LSR_IR,
  _LSR_II,

#elif defined(OS25D_GVM_OPCODE_MACRO)

  // CODE MACROS ///////////////////////////////////////////////////////////////////////////////////////////////////////

  // Logic AND
  #define and_rr(rs,rd)       _OP(AND_RR), _SD(rs, rd),
  #define and_ri(rs,rd,do)    _OP(AND_RI), _SD(rs, rd), _D8(do),
  #define and_ir(rs,so,rd)    _OP(AND_IR), _SD(rs, rd), _D8(so),
  #define and_ii(rs,so,rd,do) _OP(AND_II), _SD(rs, rd), _D8(so), _D8(do),

  // Logic OR
  #define or_rr(rs,rd)        _OP(OR_RR), _SD(rs, rd),
  #define or_ri(rs,rd,do)     _OP(OR_RI), _SD(rs, rd), _D8(do),
  #define or_ir(rs,so,rd)     _OP(OR_IR), _SD(rs, rd), _D8(so),
  #define or_ii(rs,so,rd,do)  _OP(OR_II), _SD(rs, rd), _D8(so), _D8(do),

  // Logic XOR
  #define xor_rr(rs,rd)       _OP(XOR_RR), _SD(rs, rd),
  #define xor_ri(rs,rd,do)    _OP(XOR_RI), _SD(rs, rd), _D8(do),
  #define xor_ir(rs,so,rd)    _OP(XOR_IR), _SD(rs, rd), _D8(so),
  #define xor_ii(rs,so,rd,do) _OP(XOR_II), _SD(rs, rd), _D8(so), _D8(do),

  // Logic NOT
  #define not_rr(rs,rd)       _OP(NOT_RR), _SD(rs, rd),
  #define not_ri(rs,rd,do)    _OP(NOT_RI), _SD(rs, rd), _D8(do),
  #define not_ir(rs,so,rd)    _OP(NOT_IR), _SD(rs, rd), _D8(so),
  #define not_ii(rs,so,rd,do) _OP(NOT_II), _SD(rs, rd), _D8(so), _D8(do),

  // Logic SHL
  #define lsl_lr(sl,rd)       _OP(LSL_LR), _SD(sl, rd),
  #define lsl_li(sl,rd,do)    _OP(LSL_LI), _SD(sl, rd), _D8(do),
  #define lsl_rr(rs,rd)       _OP(LSL_RR), _SD(rs, rd),
  #define lsl_ri(rs,rd,do)    _OP(LSL_RI), _SD(rs, rd), _D8(do),
  #define lsl_ir(rs,so,rd)    _OP(LSL_IR), _SD(rs, rd), _D8(so),
  #define lsl_ii(rs,so,rd,do) _OP(LSL_II), _SD(rs, rd), _D8(so), _D8(do),

  // Logic SHR
  #define lsr_lr(sl,rd)       _OP(LSR_LR), _SD(sl, rd),
  #define lsr_li(sl,rd,do)    _OP(LSR_LI), _SD(sl, rd), _D8(do),
  #define lsr_rr(rs,rd)       _OP(LSR_RR), _SD(rs, rd),
  #define lsr_ri(rs,rd,do)    _OP(LSR_RI), _SD(rs, rd), _D8(do),
  #define lsr_ir(rs,so,rd)    _OP(LSR_IR), _SD(rs, rd), _D8(so),
  #define lsr_ii(rs,so,rd,do) _OP(LSR_II), _SD(rs, rd), _D8(so), _D8(do),

#elif defined(OS25D_GVM_OPCODE_HANDLER)

  // HANDLER CODE //////////////////////////////////////////////////////////////////////////////////////////////////////

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

#endif
