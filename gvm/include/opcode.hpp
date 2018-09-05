#ifndef _OS25D_GVM_OPCODES_HPP_
  #define _OS25D_GVM_OPCODES_HPP_


namespace GVM {

  namespace AddressingMode {
    typedef enum {
      EA_LR, // Small Literal to Register
      EA_LI, // Small Literal to Indirect
      EA_RR, // Register to Register (1 byte 4:4)
      EA_RI, // Register to Indirect (1 byte X:4, 1 byte offset)
      EA_IR, // Indirect to Register (1 byte X:4, 1 byte offset)
      EA_II, // Indirect to Indirect (1 byte offset, 1 byte offset)
      _MAX
    } Enumeration;
  }

  namespace Opcode {
    typedef enum {
      _NOP,

      // Move small literal (0-15)
      _MOVE_LR,
      _MOVE_LI,

      // Float/Integer Move
      _MOVE_RR,
      _MOVE_RI,
      _MOVE_IR,
      _MOVE_II,

      // Short unconditional branch (8-bit offset)
      _BRAS,

      // Unconditional Branch (16-bit offset)
      _BRA,

      // Branch Call (16-bit offset)
      _BCALL,

      // Function call (16-bit ID)
      _CALL,

      // Host function call (16-bit ID)
      _CALLH,

      // Return from call
      _RET,

      // Push registers to stack (mask in 16-bit extension)
      _PUSHR,

      // Pop registers from stack (mask in 16-bit extension)
      _POPR,

      // Allocate Stack Storage
      _ASF,

      // Free Stack Storage
      _FSF,

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

      // Integer Negate
      _NEG_RR,
      _NEG_RI,
      _NEG_IR,
      _NEG_II,

      // Integer Add
      _ADD_LR,
      _ADD_LI,
      _ADD_RR,
      _ADD_RI,
      _ADD_IR,
      _ADD_II,

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

      // Vec3 Branch if equal
      _VBEQ_II,
      _VBEQ_IA,

      // Vec3 Branch if not equal
      _VBNE_II,
      _VBNE_IA,

      // Vec3 Add
      _VADD_II,  // vd += vs
      _VADD_IA,  // vd += vacc
      _VADD_AI,  // vacc += vs
      _VADD_IIA, // vacc = vs1 + vs2
      _VADD_IAI, // vd = vacc + vs

      // Vec3 Sub
      _VSUB_II,  // vd -= vs
      _VSUB_IA,  // vacc -= vs
      _VSUB_AI,  // vd -= vacc
      _VSUB_IIA, // vacc = vs1 - vs2
      _VSUB_IAI, // vd = vs - vacc
      _VSUB_AII, // vd = vacc - vs

      // Vec3 Cross
      _VMUL_IIA, // vacc = vs1 x vs2
      _VMUL_AII, // vd = vacc x vs
      _VMUL_IAI, // vd = vs x vacc

      // Vec3 Dot
      _VDOT_IIA, // vacc.m = vs1 . vs2
      _VDOT_AIR, // d   = vacc . vs
      _VDOT_AII, // [d] = vacc . vs

      // Vec3 Mag
      _VMAG_IR, // d = |vs|
      _VMAG_II, // [d] = |vs|
      _VMAG_AR, // d = |vacc|
      _VMAG_AI, // [d] = |vacc|
      _VMAG_A,  // vacc.m = |vacc|

      // Vec3 Normalize
      _VNRM_I,  // vd = vd / |vd|
      _VNRM_II, // vd = vs / |vs|
      _VNRM_IA, // vacc = vs / |vs|
      _VNRM_AI, // vd = vacc / |vacc|
      _VNRM_A,  // vacc = vacc / |vacc|

      _MAX
    } Enumeration;
  }
}


#endif
