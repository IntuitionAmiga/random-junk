// Vector specific instructions ////////////////////////////////////////////////////////////////////////////

// Vector branch if equal
IS(VBEQ_LL) {
    STEP(5);
    NEXT;
}

IS(VBEQ_IL) {
    STEP(5);
    NEXT;
}

IS(VBEQ_II) {
    STEP(5);
    NEXT;
}

// Vector branch if not equal
IS(VBNE_LL) {
    STEP(5);
    NEXT;
}

IS(VBNE_IL) {
    STEP(5);
    NEXT;
}

IS(VBNE_II) {
    STEP(5);
    NEXT;
}

// Two operand Vector instructions
IS(VCOPY_LL) {
    float32* vs = VLOC(0);
    float32* vd = VLOC(1);
    vd[0] = vs[0];
    vd[1] = vs[1];
    vd[2] = vs[2];
    STEP(3);
    NEXT;
}

IS(VCOPY_IL) {
    float32* vs = VIX0(0);
    float32* vd = VLOC(1);
    vd[0] = vs[0];
    vd[1] = vs[1];
    vd[2] = vs[2];
    STEP(3);
    NEXT;
}

IS(VCOPY_LI) {
    float32* vs = VLOC(0);
    float32* vd = VIX0(1);
    vd[0] = vs[0];
    vd[1] = vs[1];
    vd[2] = vs[2];
    STEP(3);
    NEXT;
}

IS(VCOPY_II) {
    float32* vs = VIX0(0);
    float32* vd = VIX1(1);
    vd[0] = vs[0];
    vd[1] = vs[1];
    vd[2] = vs[2];
    STEP(3);
    NEXT;
}

// Vector negate
IS(VNEG_LL) {
    STEP(3);
    NEXT;
}

IS(VNEG_IL) {
    STEP(3);
    NEXT;
}

IS(VNEG_LI) {
    STEP(3);
    NEXT;
}

IS(VNEG_II) {
    STEP(3);
    NEXT;
}

// Vector normalize
IS(VNORM_LL) {
    STEP(3);
    NEXT;
}

IS(VNORM_IL) {
    STEP(3);
    NEXT;
}

IS(VNORM_LI) {
    STEP(3);
    NEXT;
}

IS(VNORM_II) {
    STEP(3);
    NEXT;
}

// Vector magnitude (scalar result)
IS(VMAG_LL) {
    STEP(3);
    NEXT;
}

IS(VMAG_IL) {
    STEP(3);
    NEXT;
}

IS(VMAG_LI) {
    STEP(3);
    NEXT;
}

IS(VMAG_II) {
    STEP(3);
    NEXT;
}

// Three operand vector instructions

// Vector addition) Commutative) 4 unique variants
IS(VADD_LLL) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VLOC(2);
    vd[0] = vs1[0] + vs2[0];
    vd[1] = vs1[1] + vs2[1];
    vd[2] = vs1[2] + vs2[2];
    STEP(4);
    NEXT;
}

IS(VADD_ILL) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VLOC(2);
    vd[0] = vs1[0] + vs2[0];
    vd[1] = vs1[1] + vs2[1];
    vd[2] = vs1[2] + vs2[2];
    STEP(4);
    NEXT;
}

IS(VADD_LLI) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VIX0(2);
    vd[0] = vs1[0] + vs2[0];
    vd[1] = vs1[1] + vs2[1];
    vd[2] = vs1[2] + vs2[2];
    STEP(4);
    NEXT;
}

IS(VADD_ILI) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VIX1(2);
    vd[0] = vs1[0] + vs2[0];
    vd[1] = vs1[1] + vs2[1];
    vd[2] = vs1[2] + vs2[2];
    STEP(4);
    NEXT;
}

// Vector subtraction) Noncommutative) 7 unique variants
IS(VSUB_LLL) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VLOC(2);
    vd[0] = vs1[0] - vs2[0];
    vd[1] = vs1[1] - vs2[1];
    vd[2] = vs1[2] - vs2[2];
    STEP(4);
    NEXT;
}

IS(VSUB_ILL) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VLOC(2);
    vd[0] = vs1[0] - vs2[0];
    vd[1] = vs1[1] - vs2[1];
    vd[2] = vs1[2] - vs2[2];
    STEP(4);
    NEXT;
}

IS(VSUB_LLI) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VIX0(2);
    vd[0] = vs1[0] - vs2[0];
    vd[1] = vs1[1] - vs2[1];
    vd[2] = vs1[2] - vs2[2];
    STEP(4);
    NEXT;
}

IS(VSUB_ILI) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VIX1(2);
    vd[0] = vs1[0] - vs2[0];
    vd[1] = vs1[1] - vs2[1];
    vd[2] = vs1[2] - vs2[2];
    STEP(4);
    NEXT;
}

IS(VSUB_LIL) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VIX0(1);
    float32* vd  = VLOC(2);
    vd[0] = vs1[0] - vs2[0];
    vd[1] = vs1[1] - vs2[1];
    vd[2] = vs1[2] - vs2[2];
    STEP(4);
    NEXT;
}

IS(VSUB_IIL) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VIX1(1);
    float32* vd  = VLOC(2);
    vd[0] = vs1[0] - vs2[0];
    vd[1] = vs1[1] - vs2[1];
    vd[2] = vs1[2] - vs2[2];
    STEP(4);
    NEXT;
}

IS(VSUB_LII) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VIX0(1);
    float32* vd  = VIX1(2);
    vd[0] = vs1[0] - vs2[0];
    vd[1] = vs1[1] - vs2[1];
    vd[2] = vs1[2] - vs2[2];
    STEP(4);
    NEXT;
}


// Dot product (scalar result)) Commutative) 4 unique variants
IS(VDOT_LLL) {
    STEP(4);
    NEXT;
}

IS(VDOT_ILL) {
    STEP(4);
    NEXT;
}

IS(VDOT_LLI) {
    STEP(4);
    NEXT;
}

IS(VDOT_ILI) {
    STEP(4);
    NEXT;
}


// Cross product (vector result)) Noncommutative) 7 unique variants
IS(VCROSS_LLL) {
    STEP(4);
    NEXT;
}

IS(VCROSS_ILL) {
    STEP(4);
    NEXT;
}

IS(VCROSS_LLI) {
    STEP(4);
    NEXT;
}

IS(VCROSS_ILI) {
    STEP(4);
    NEXT;
}

IS(VCROSS_LIL) {
    STEP(4);
    NEXT;
}

IS(VCROSS_IIL) {
    STEP(4);
    NEXT;
}

IS(VCROSS_LII) {
    STEP(4);
    NEXT;
}


// Vector multiply by float) Commutative) 7 variants due to different input operand types
IS(VFMUL_LLL) {
    STEP(4);
    NEXT;
}

IS(VFMUL_ILL) {
    STEP(4);
    NEXT;
}

IS(VFMUL_LLI) {
    STEP(4);
    NEXT;
}

IS(VFMUL_ILI) {
    STEP(4);
    NEXT;
}

IS(VFMUL_LIL) {
    STEP(4);
    NEXT;
}

IS(VFMUL_IIL) {
    STEP(4);
    NEXT;
}

IS(VFMUL_LII) {
    STEP(4);
    NEXT;
}
