#include <cstdio>
#include <cmath>
#include <cfloat>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"
#include "include/opcode_macros.hpp"
using namespace GVM;

// Examine the assembled output for the following arrays to confirm they have the expected byte sequences

// Conventions used:
// Small immediate literal shall always be 3
// source register shall always be r7
// source register index (indirect) shall always be 1
// destination register shall always be r8
// destination register index (indirect) shall always be 2
// PC branch offset shall always be -2
// Symbol ID shall always be 0xFFFF (-1)

uint8 op_nop[]     = { nop };
uint8 op_bras[]    = { bras(-2) };
uint8 op_bra[]     = { bra(-2) };
uint8 op_bcall[]   = { bcall(-1) };
uint8 op_call[]    = { call(0xFFFF) };
uint8 op_call_r[]  = { call_r(r7) };
uint8 op_call_i[]  = { call_i(r7, 1) };
uint8 op_call_h[]  = { call_h(0xFFFF) };
uint8 op_ret[]     = { ret };
uint8 op_dbnz[]    = { dbnz(r7, -2) };
uint8 op_ldbnn[]   = { ldbnn(r7, 1, r8, -2) };
uint8 op_bez_r[]   = { bez_r(r7, -2) };
uint8 op_bez_i[]   = { bez_i(r7, 1, -2) };
uint8 op_bnz_r[]   = { bnz_r(r7, -2) };
uint8 op_bnz_i[]   = { bnz_i(r7, 1, -2) };
uint8 op_beq_rr[]  = { beq_rr(r7, r8, -2) };
uint8 op_beq_ri[]  = { beq_ri(r7, r8, 2, -2) };
uint8 op_beq_ii[]  = { beq_ii(r7, 1, r8, 2, -2) };
uint8 op_bge_rr[]  = { bge_rr(r7, r8, -2) };
uint8 op_bge_ri[]  = { bge_ri(r7, r8, 2, -2) };
uint8 op_bge_ir[]  = { bge_ir(r7, 1, r8, -2) };
uint8 op_bge_ii[]  = { bge_ii(r7, 1, r8, 2, -2) };
uint8 op_bgt_rr[]  = { bgt_rr(r7, r8, -2) };
uint8 op_bgt_ri[]  = { bgt_ri(r7, r8, 2, -2) };
uint8 op_bgt_ir[]  = { bgt_ir(r7, 1, r8, -2) };
uint8 op_bgt_ii[]  = { bgt_ii(r7, 1, r8, 2, -2) };
uint8 op_fbeq_rr[] = { fbge_rr(r7, r8, -2) };
uint8 op_fbeq_ri[] = { fbge_ri(r7, r8, 2, -2) };
uint8 op_fbeq_ii[] = { fbge_ii(r7, 1, r8, 2, -2) };
uint8 op_fbge_rr[] = { fbge_rr(r7, r8, -2) };
uint8 op_fbge_ri[] = { fbge_ri(r7, r8, 2, -2) };
uint8 op_fbge_ir[] = { fbge_ir(r7, 1, r8, -2) };
uint8 op_fbge_ii[] = { fbge_ii(r7, 1, r8, 2, -2) };
uint8 op_fbgt_rr[] = { fbgt_rr(r7, r8, -2) };
uint8 op_fbgt_ri[] = { fbgt_ri(r7, r8, 2, -2) };
uint8 op_fbgt_ir[] = { fbgt_ir(r7, 1, r8, -2) };
uint8 op_fbgt_ii[] = { fbgt_ii(r7, 1, r8, 2, -2) };
uint8 op_vbeq_ii[] = { vbeq_ii(r7, 1, r8, 2, -2) };
uint8 op_vbeq_ia[] = { vbeq_ia(r7, 1, -2) };
uint8 op_vbne_ii[] = { vbne_ii(r7, 1, r8, 2, -2) };
uint8 op_vbne_ia[] = { vbne_ia(r7, 1, -2) };
uint8 op_move_lr[] = { move_lr(3, r8) };
uint8 op_move_li[] = { move_li(3, r8, 2) };
uint8 op_move_rr[] = { move_rr(r7, r8) };
uint8 op_move_ri[] = { move_ri(r7, r8, 2) };
uint8 op_move_ir[] = { move_ir(r7, 1, r8) };
uint8 op_move_ii[] = { move_ii(r7, 1, r8, 2) };
uint8 op_move_mr[] = { move_mr(r8) };
uint8 op_move_mi[] = { move_mi(r8, 2) };
uint8 op_pushr[]   = { pushr(r7, r8) };
uint8 op_popr[]    = { popr(r7, r8) };
uint8 op_asf[]     = { asf(r8, 240) };
uint8 op_fsf[]     = { fsf(r8, 240) };
uint8 op_vspl_li[] = { vspl_li(3, r8, 2) };
uint8 op_vspl_ri[] = { vspl_ri(r7, r8, 2) };
uint8 op_vspl_ii[] = { vspl_ii(r7, 1, r8, 2) };
uint8 op_vspl_la[] = { vspl_la(3) };
uint8 op_vspl_ra[] = { vspl_ra(r7) };
uint8 op_vspl_ia[] = { vspl_ia(r7, 1) };
uint8 op_vmve_ii[] = { vmve_ii(r7, 1, r8, 2) };
uint8 op_vmve_ia[] = { vmve_ia(r7, 1) };
uint8 op_vmve_ai[] = { vmve_ai(r8, 2) };

uint8 op_neg_rr[]  = { neg_rr(r7, r8) };
uint8 op_neg_ri[]  = { neg_ri(r7, r8, 2) };
uint8 op_neg_ir[]  = { neg_ir(r7, 1, r8) };
uint8 op_neg_ii[]  = { neg_ii(r7, 1, r8, 2) };

uint8 op_add_lr[]   = { add_lr(3, r8)        };
uint8 op_add_li[]   = { add_li(3, r8, 2)     };
uint8 op_add_rr[]   = { add_rr(r7, r8)       };
uint8 op_add_ri[]   = { add_ri(r7, r8, 2)    };
uint8 op_add_ir[]   = { add_ir(r7, 1, r8)    };
uint8 op_add_ii[]   = { add_ii(r7, 1, r8,2)  };

uint8 op_sub_lr[]   = { sub_lr(3, r8)        };
uint8 op_sub_li[]   = { sub_li(3, r8, 2)     };
uint8 op_sub_rr[]   = { sub_rr(r7, r8)       };
uint8 op_sub_ri[]   = { sub_ri(r7, r8, 2)    };
uint8 op_sub_ir[]   = { sub_ir(r7, 1, r8)    };
uint8 op_sub_ii[]   = { sub_ii(r7, 1, r8, 2) };

uint8 op_mul_lr[]   = { mul_lr(3, r8)       };
uint8 op_mul_li[]   = { mul_li(3, r8, 2)    };
uint8 op_mul_rr[]   = { mul_rr(r7, r8)       };
uint8 op_mul_ri[]   = { mul_ri(r7, r8, 2)    };
uint8 op_mul_ir[]   = { mul_ir(r7, 1, r8)    };
uint8 op_mul_ii[]   = { mul_ii(r7, 1, r8, 2) };

uint8 op_div_lr[]   = { div_lr(3, r8)        };
uint8 op_div_li[]   = { div_li(3, r8, 2)     };
uint8 op_div_rr[]   = { div_rr(r7, r8)       };
uint8 op_div_ri[]   = { div_ri(r7, r8, 2)    };
uint8 op_div_ir[]   = { div_ir(r7, 1, r8)    };
uint8 op_div_ii[]   = { div_ii(r7, 1, r8, 2) };

uint8 op_mod_lr[]   = { mod_lr(3, r8)        };
uint8 op_mod_li[]   = { mod_li(3, r8, 2)     };
uint8 op_mod_rr[]   = { mod_rr(r7, r8)       };
uint8 op_mod_ri[]   = { mod_ri(r7, r8, 2)    };
uint8 op_mod_ir[]   = { mod_ir(r7, 1, r8)    };
uint8 op_mod_ii[]   = { mod_ii(r7, 1, r8, 2) };

uint8 op_fneg_rr[]  = { fneg_rr(r7, r8)       };
uint8 op_fneg_ri[]  = { fneg_ri(r7, r8, 2)    };
uint8 op_fneg_ir[]  = { fneg_ir(r7, 1, r8)    };
uint8 op_fneg_ii[]  = { fneg_ii(r7, 1, r8, 2) };

uint8 op_fadd_rr[]  = { fadd_rr(r7, r8)        };
uint8 op_fadd_ri[]  = { fadd_ri(r7, r8, 2)     };
uint8 op_fadd_ir[]  = { fadd_ir(r7, 1, r8)     };
uint8 op_fadd_ii[]  = { fadd_ii(r7, 1, r8, 2)  };

uint8 op_fsub_rr[]  = { fsub_rr(r7, r8)        };
uint8 op_fsub_ri[]  = { fsub_ri(r7, r8, 2)     };
uint8 op_fsub_ir[]  = { fsub_ir(r7, 1, r8)     };
uint8 op_fsub_ii[]  = { fsub_ii(r7, 1, r8, 2)  };

uint8 op_fmul_rr[]  = { fmul_rr(r7, r8)        };
uint8 op_fmul_ri[]  = { fmul_ri(r7, r8, 2)     };
uint8 op_fmul_ir[]  = { fmul_ir(r7, 1, r8)     };
uint8 op_fmul_ii[]  = { fmul_ii(r7, 1, r8, 2)  };

uint8 op_fdiv_rr[]  = { fdiv_rr(r7, r8)        };
uint8 op_fdiv_ri[]  = { fdiv_ri(r7, r8, 2)     };
uint8 op_fdiv_ir[]  = { fdiv_ir(r7, 1, r8)     };
uint8 op_fdiv_ii[]  = { fdiv_ii(r7, 1, r8, 2)  };

uint8 op_fmod_rr[]  = { fmod_rr(r7, r8)        };
uint8 op_fmod_ri[]  = { fmod_ri(r7, r8, 2)     };
uint8 op_fmod_ir[]  = { fmod_ir(r7, 1, r8)     };
uint8 op_fmod_ii[]  = { fmod_ii(r7, 1, r8, 2)  };

uint8 op_fsqrt_rr[]  = { fsqrt_rr(r7, r8)        };
uint8 op_fsqrt_ri[]  = { fsqrt_ri(r7, r8, 2)     };
uint8 op_fsqrt_ir[]  = { fsqrt_ir(r7, 1, r8)     };
uint8 op_fsqrt_ii[]  = { fsqrt_ii(r7, 1, r8, 2)  };

uint8 op_fsin_rr[]  = { fsin_rr(r7, r8)        };
uint8 op_fsin_ri[]  = { fsin_ri(r7, r8, 2)     };
uint8 op_fsin_ir[]  = { fsin_ir(r7, 1, r8)     };
uint8 op_fsin_ii[]  = { fsin_ii(r7, 1, r8, 2)  };

uint8 op_fcos_rr[]  = { fcos_rr(r7, r8)        };
uint8 op_fcos_ri[]  = { fcos_ri(r7, r8, 2)     };
uint8 op_fcos_ir[]  = { fcos_ir(r7, 1, r8)     };
uint8 op_fcos_ii[]  = { fcos_ii(r7, 1, r8, 2)  };

uint8 op_ftan_rr[]  = { ftan_rr(r7, r8)        };
uint8 op_ftan_ri[]  = { ftan_ri(r7, r8, 2)     };
uint8 op_ftan_ir[]  = { ftan_ir(r7, 1, r8)     };
uint8 op_ftan_ii[]  = { ftan_ii(r7, 1, r8, 2)  };

uint8 op_vscl_ri[]  = { vscl_ri(r7, r8, 2)     };
uint8 op_vscl_ii[]  = { vscl_ii(r7, 1, r8, 2)  };
uint8 op_vscl_mi[]  = { vscl_mi(r8, 2)         };
uint8 op_vscl_ra[]  = { vscl_ra(r7)            };
uint8 op_vscl_ia[]  = { vscl_ia(r7, 1)         };
uint8 op_vscl_ma[]  = { vscl_ma                };

uint8 op_vadd_ii[]  = { vadd_ii(r7, 1, r8, 2)  };
uint8 op_vadd_ia[]  = { vadd_ia(r7, 1)         };
uint8 op_vadd_ai[]  = { vadd_ai(r8, 2)         };
uint8 op_vadd_iia[] = { vadd_iia(r7, 1, r8, 2) };
uint8 op_vadd_iai[] = { vadd_iai(r7, 1, r8, 2) };

uint8 op_vsub_ii[] =  { vsub_ii(r7, 1, r8, 2)  };
uint8 op_vsub_ia[] =  { vsub_ia(r7, 1)         };
uint8 op_vsub_ai[] =  { vsub_ai(r8, 2)         };
uint8 op_vsub_iia[] = { vsub_iia(r7, 1, r8, 2) };
uint8 op_vsub_iai[] = { vsub_iai(r7, 1, r8, 2) };
uint8 op_vsub_aii[] = { vsub_aii(r7, 1, r8, 2) };

uint8 op_vmul_iia[] = { vmul_iia(r7, 1,r8, 2) };
uint8 op_vmul_aii[] = { vmul_aii(r7, 1,r8, 2) };
uint8 op_vmul_iai[] = { vmul_iai(r7, 1,r8, 2) };

uint8 op_vdot_iim[] = { vdot_iim(r7, 1, r8, 2) };
uint8 op_vdot_air[] = { vdot_air(r7, 1, r8)    };
uint8 op_vdot_aii[] = { vdot_aii(r7, 1, r8, 2) };

uint8 op_vmag_ir[]  = { vmag_ir(r7,1,r8)     };
uint8 op_vmag_ii[]  = { vmag_ii(r7,1,r8,2)   };
uint8 op_vmag_ar[]  = { vmag_ar(r8)          };
uint8 op_vmag_ai[]  = { vmag_ai(r8,2)        };
uint8 op_vmag_m[]   = { vmag_m               };

uint8 op_vnrm_i []  = { vnrm_i(r7, 1)         };
uint8 op_vnrm_ii[]  = { vnrm_ii(r7, 1, r8, 2) };
uint8 op_vnrm_ia[]  = { vnrm_ia(r7, 1)        };
uint8 op_vnrm_ai[]  = { vnrm_ai(r8, 2)        };
uint8 op_vnrm_a[]   = { vnrm_a                };
