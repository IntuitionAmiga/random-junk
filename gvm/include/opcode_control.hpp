#if defined(OS25D_GVM_OPCODE_DEFINE)

  // ENUMERATION

  // No Operation
  _NOP,

  // Short unconditional branch (8-bit offset)
  _BRAS,

  // Unconditional Branch (16-bit offset)
  _BRA,

  // Computed branch (short)
  _TJMPS,

  // Computed branch
  _TJMP,

  // Branch Call (16-bit offset)
  _BCALL,

  // Function call (16-bit ID fixed)
  _CALL,

  // Function call (16-bit ID in register)
  _CALL_R,

  // Function call (16-bit ID via indirect)
  _CALL_I,

  // Host function call (16-bit ID fixed)
  _CALLH,

  // Return from call
  _RET,

  // Decrement and Branch if not Zero  (16-bit offset)
  _DBNZ_R,

  // Load Link and Branch if not Null  (16-bit offset)
  _LBNN_IR,

  // Float/Integer Branch if Zero  (16-bit offset)
  _BEZ_R,
  _BEZ_I,

  // Float/Integer Branch if Not Zero  (16-bit offset)
  _BNZ_R,
  _BNZ_I,

  // Float/Integer Branch if Equal  (16-bit offset)
  _BEQ_RR,
  _BEQ_RI,
  _BEQ_II,

  // Integer Branch if Greater or Equal  (16-bit offset)
  _BGE_RR,
  _BGE_RI,
  _BGE_IR,
  _BGE_II,

  // Integer Branch if Greater  (16-bit offset)
  _BGT_RR,
  _BGT_RI,
  _BGT_IR,
  _BGT_II,

  // Float Branch if Almost Equal  (16-bit offset)
  _FBEQ_RR,
  _FBEQ_RI,
  _FBEQ_IR,
  _FBEQ_II,

  // Float Branch if Greater or Equal  (16-bit offset)
  _FBGE_RR,
  _FBGE_RI,
  _FBGE_IR,
  _FBGE_II,

  // Float Branch if Greater  (16-bit offset)
  _FBGT_RR,
  _FBGT_RI,
  _FBGT_IR,
  _FBGT_II,

  // Vec3 Branch if equal
  _VBEQ_II,
  _VBEQ_IA,

  // Vec3 Branch if not equal
  _VBNE_II,
  _VBNE_IA,

#elif defined(OS25D_GVM_OPCODE_MACRO)

  // CODE MACROS

#elif defined(OS25D_GVM_OPCODE_HANDLER)

  // HANDLER CODE

  // No Operation
  IS(NOP) {
    // [opcode]
    --pc;
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
#endif
