#if defined(OS25D_GVM_OPCODE_DEFINE)

  // ENUMERATION ///////////////////////////////////////////////////////////////////////////////////////////////////////

  // Integer Negate
  _NEG_RR, //  rd  = -rs
  _NEG_RI, // (rd) = -rs
  _NEG_IR, //  rd  = -(rs)
  _NEG_II, // (rd) = -(rs)

  // Integer Add
  _ADD_LR, //  rd  +=  I
  _ADD_LI, // (rd) +=  I
  _ADD_RR, //  rd  +=  rs
  _ADD_RI, // (rd) +=  rs
  _ADD_IR, //  rd  += (rs)
  _ADD_II, // (rd) += (rs)

  // Integer Sub
  _SUB_LR,
  _SUB_LI,
  _SUB_RR,
  _SUB_RI,
  _SUB_IR,
  _SUB_II,

  // Integer Mul
  _MUL_LR,
  _MUL_LI,
  _MUL_RR,
  _MUL_RI,
  _MUL_IR,
  _MUL_II,

  // Integer Div
  _DIV_LR,
  _DIV_LI,
  _DIV_RR,
  _DIV_RI,
  _DIV_IR,
  _DIV_II,

  // Integer Mod
  _MOD_LR,
  _MOD_LI,
  _MOD_RR,
  _MOD_RI,
  _MOD_IR,
  _MOD_II,

  // Float Negate
  _FNEG_RR,
  _FNEG_RI,
  _FNEG_IR,
  _FNEG_II,

  // Float Add
  _FADD_RR,
  _FADD_RI,
  _FADD_IR,
  _FADD_II,

  // Float Sub
  _FSUB_RR,
  _FSUB_RI,
  _FSUB_IR,
  _FSUB_II,

  // Float Mul
  _FMUL_RR,
  _FMUL_RI,
  _FMUL_IR,
  _FMUL_II,

  // Float Div
  _FDIV_RR,
  _FDIV_RI,
  _FDIV_IR,
  _FDIV_II,

  // Float Mod
  _FMOD_RR,
  _FMOD_RI,
  _FMOD_IR,
  _FMOD_II,

  // Float Square Root
  _FSQRT_RR,
  _FSQRT_RI,
  _FSQRT_IR,
  _FSQRT_II,

  // Float Sine
  _FSIN_RR,
  _FSIN_RI,
  _FSIN_IR,
  _FSIN_II,

  // Float Cosine
  _FCOS_RR,
  _FCOS_RI,
  _FCOS_IR,
  _FCOS_II,

  // Float Tangent
  _FTAN_RR,
  _FTAN_RI,
  _FTAN_IR,
  _FTAN_II,

  // Vec3 scale by float
  _VSCL_RI,  // (vd) *=  rs
  _VSCL_II,  // (vd) *= (rs)
  _VSCL_MI,  // (vd) *=  m
  _VSCL_RA,  //  va  *=  rs
  _VSCL_IA,  //  va  *= (rs)
  _VSCL_MA,  //  va  *=  m

  // Vec3 Addition
  _VADD_II,  // (vd) += (vs)
  _VADD_IA,  // (vd) +=  va
  _VADD_AI,  //  va  += (vs)
  _VADD_IIA, //  va  =  (vs1) + (vs2)
  _VADD_IAI, // (vd) =   va   + (vs)

  // Vec3 Subtraction
  _VSUB_II,  // (vd) -= (vs)
  _VSUB_IA,  //  va  -=  va
  _VSUB_AI,  // (vd) -=  va
  _VSUB_IIA, //  va  =  (vs1) - (vs2)
  _VSUB_IAI, // (vd) =  (vs)  - (va)
  _VSUB_AII, // (vd) =   va   - (vs)

  // Vec3 Cross
  _VMUL_IIA, //  va  = (vs1) x (vs2)
  _VMUL_AII, // (vd) =  va   x (vs)
  _VMUL_IAI, // (vd) = (vs)  x  va

  // Vec3 Dot
  _VDOT_IIM, //  m   = (vs1) . (vs2)
  _VDOT_AIR, //  rd  =  va   . (vs)
  _VDOT_AII, // (rd) =  va   . (vs)

  // Vec3 Magnitude
  _VMAG_IR, //  rd   = |(vs)|
  _VMAG_II, // (rd)  = |(vs)|
  _VMAG_AR, //  rd   =  |va|
  _VMAG_AI, // (rd]) =  |va|
  _VMAG_M,  //  m    =  |va|

  // Vec3 Normalize
  _VNRM_I,  // (vd) = (vd) / |(vd)|
  _VNRM_II, // (vd) = (vs) / |(vs)|
  _VNRM_IA, //  va  = (vs) / |(vs)|
  _VNRM_AI, // (vd) =  va  /  |va|
  _VNRM_A,  //  va  =  va  /  |va|

#elif defined(OS25D_GVM_OPCODE_MACRO)

  // CODE MACROS ///////////////////////////////////////////////////////////////////////////////////////////////////////

#elif defined(OS25D_GVM_OPCODE_HANDLER)

  // HANDLER CODE //////////////////////////////////////////////////////////////////////////////////////////////////////

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
#endif
