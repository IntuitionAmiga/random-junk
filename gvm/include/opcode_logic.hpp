#if defined(OS25D_GVM_OPCODE_DEFINE)

  // ENUMERATION

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

  // CODE MACROS

#elif defined(OS25D_GVM_OPCODE_HANDLER)

  // HANDLER CODE

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
