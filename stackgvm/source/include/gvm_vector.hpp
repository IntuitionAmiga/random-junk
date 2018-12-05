
// Vector specific Instructions ////////////////////////////////////////////////////////////////////////////////////////

// Two Operand Branch If Vector Equal //////////////////////////////////////////////////////////////////////////////////

IS(VBEQ_LL) {
    uint32* vs = ULOC(0);
    uint32* vd = ULOC(1);
    if (
        vd[0] == vs[0] &&
        vd[1] == vs[1] &&
        vd[2] == vs[2]
    ) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(VBEQ_IL) {
    uint32* vs = UIX0(0);
    uint32* vd = ULOC(1);
    if (
        vd[0] == vs[0] &&
        vd[1] == vs[1] &&
        vd[2] == vs[2]
    ) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(VBEQ_II) {
    uint32* vs = UIX0(0);
    uint32* vd = UIX1(1);
    if (
        vd[0] == vs[0] &&
        vd[1] == vs[1] &&
        vd[2] == vs[2]
    ) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Two Operand Branch if Vector Not Equal //////////////////////////////////////////////////////////////////////////////

IS(VBNE_LL) {
    uint32* vs = ULOC(0);
    uint32* vd = ULOC(1);
    if (
        vd[0] != vs[0] &&
        vd[1] != vs[1] &&
        vd[2] != vs[2]
    ) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(VBNE_IL) {
    uint32* vs = UIX0(0);
    uint32* vd = ULOC(1);
    if (
        vd[0] != vs[0] &&
        vd[1] != vs[1] &&
        vd[2] != vs[2]
    ) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(VBNE_II) {
    uint32* vs = UIX0(0);
    uint32* vd = UIX1(1);
    if (
        vd[0] != vs[0] &&
        vd[1] != vs[1] &&
        vd[2] != vs[2]
    ) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Two Operand Vector Copy /////////////////////////////////////////////////////////////////////////////////////////////

IS(VCOPY_LL) {
    uint32* vs = ULOC(0);
    uint32* vd = ULOC(1);
    vd[0] = vs[0];
    vd[1] = vs[1];
    vd[2] = vs[2];
    STEP(3);
    NEXT;
}

IS(VCOPY_IL) {
    uint32* vs = UIX0(0);
    uint32* vd = ULOC(1);
    vd[0] = vs[0];
    vd[1] = vs[1];
    vd[2] = vs[2];
    STEP(3);
    NEXT;
}

IS(VCOPY_LI) {
    uint32* vs = ULOC(0);
    uint32* vd = UIX0(1);
    vd[0] = vs[0];
    vd[1] = vs[1];
    vd[2] = vs[2];
    STEP(3);
    NEXT;
}

IS(VCOPY_II) {
    uint32* vs = UIX0(0);
    uint32* vd = UIX1(1);
    vd[0] = vs[0];
    vd[1] = vs[1];
    vd[2] = vs[2];
    STEP(3);
    NEXT;
}

// Two Operand Vector Negate ///////////////////////////////////////////////////////////////////////////////////////////

IS(VNEG_LL) {
    float32* vs = VLOC(0);
    float32* vd = VLOC(1);
    vd[0] = -vs[0];
    vd[1] = -vs[1];
    vd[2] = -vs[2];
    STEP(3);
    NEXT;
}

IS(VNEG_IL) {
    float32* vs = VIX0(0);
    float32* vd = VLOC(1);
    vd[0] = -vs[0];
    vd[1] = -vs[1];
    vd[2] = -vs[2];
    STEP(3);
    NEXT;
}

IS(VNEG_LI) {
    float32* vs = VLOC(0);
    float32* vd = VIX0(1);
    vd[0] = -vs[0];
    vd[1] = -vs[1];
    vd[2] = -vs[2];
    STEP(3);
    NEXT;
}

IS(VNEG_II) {
    float32* vs = VIX0(0);
    float32* vd = VIX1(1);
    vd[0] = -vs[0];
    vd[1] = -vs[1];
    vd[2] = -vs[2];
    STEP(3);
    NEXT;
}

// Two Operand Vector Normalisation ////////////////////////////////////////////////////////////////////////////////////

IS(VNORM_LL) {
    float32* vs = VLOC(0);
    float32* vd = VLOC(1);
    float32 f = 1.0f / std::sqrt(
        (vs[0] * vs[0]) +
        (vs[1] * vs[1]) +
        (vs[2] * vs[2])
    );
    vd[0] = f * vs[0];
    vd[1] = f * vs[1];
    vd[2] = f * vs[2];
    STEP(3);
    NEXT;
}

IS(VNORM_IL) {
    float32* vs = VIX0(0);
    float32* vd = VLOC(1);
    float32 f = 1.0f / std::sqrt(
        (vs[0] * vs[0]) +
        (vs[1] * vs[1]) +
        (vs[2] * vs[2])
    );
    vd[0] = f * vs[0];
    vd[1] = f * vs[1];
    vd[2] = f * vs[2];
    STEP(3);
    NEXT;
}

IS(VNORM_LI) {
    float32* vs = VLOC(0);
    float32* vd = VIX0(1);
    float32 f = 1.0f / std::sqrt(
        (vs[0] * vs[0]) +
        (vs[1] * vs[1]) +
        (vs[2] * vs[2])
    );
    vd[0] = f * vs[0];
    vd[1] = f * vs[1];
    vd[2] = f * vs[2];
    STEP(3);
    NEXT;
}

IS(VNORM_II) {
    float32* vs = VIX0(0);
    float32* vd = VIX1(1);
    float32 f = 1.0f / std::sqrt(
        (vs[0] * vs[0]) +
        (vs[1] * vs[1]) +
        (vs[2] * vs[2])
    );
    vd[0] = f * vs[0];
    vd[1] = f * vs[1];
    vd[2] = f * vs[2];
    STEP(3);
    NEXT;
}

// Two Operand Vector Magnitude (Float Result) /////////////////////////////////////////////////////////////////////////

IS(VMAG_LL) {
    float32* v = VLOC(0);
    LOC(1).f = std::sqrt(
        (v[0] * v[0]) +
        (v[1] * v[1]) +
        (v[2] * v[2])
    );
    STEP(3);
    NEXT;
}

IS(VMAG_IL) {
    float32* v = VIX0(0);
    LOC(1).f = std::sqrt(
        (v[0] * v[0]) +
        (v[1] * v[1]) +
        (v[2] * v[2])
    );
    STEP(3);
    NEXT;
}

IS(VMAG_LI) {
    float32* v = VLOC(0);
    IX0(1).f = std::sqrt(
        (v[0] * v[0]) +
        (v[1] * v[1]) +
        (v[2] * v[2])
    );
    STEP(3);
    NEXT;
}

IS(VMAG_II) {
    float32* v = VIX0(0);
    IX1(1).f = std::sqrt(
        (v[0] * v[0]) +
        (v[1] * v[1]) +
        (v[2] * v[2])
    );
    STEP(3);
    NEXT;
}

// Three Operand Vector Instructions ///////////////////////////////////////////////////////////////////////////////////

// Three Operand Vector Addition (Commutative, 4 unique variants) //////////////////////////////////////////////////////
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

// Three Operand Vector Subtraction (Noncommutative, 7 unique variants) ////////////////////////////////////////////////

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


// Three Operand Dot Product (Scalar Float Result) /////////////////////////////////////////////////////////////////////

IS(VDOT_LLL) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VLOC(1);
    LOC(2).f = vs1[0] * vs2[0] + vs1[1] * vs2[1] + vs1[2] * vs2[2];
    STEP(4);
    NEXT;
}

IS(VDOT_ILL) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VLOC(1);
    LOC(2).f = vs1[0] * vs2[0] + vs1[1] * vs2[1] + vs1[2] * vs2[2];
    STEP(4);
    NEXT;
}

IS(VDOT_LLI) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VLOC(1);
    IX0(2).f = vs1[0] * vs2[0] + vs1[1] * vs2[1] + vs1[2] * vs2[2];
    STEP(4);
    NEXT;
}

IS(VDOT_ILI) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VLOC(1);
    IX1(2).f = vs1[0] * vs2[0] + vs1[1] * vs2[1] + vs1[2] * vs2[2];
    STEP(4);
    NEXT;
}


// Three Operand Cross Product (Noncommutative, 7 unique variants) /////////////////////////////////////////////////////
IS(VCROSS_LLL) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VLOC(2);

    // x =  v1.y * v2.z - v1.z * v2.y,
    // y =  v1.z * v2.x - v1.x * v2.z,
    // z =  v1.x * v2.y - v1.y * v2.x
    vd[0] = vs1[1] * vs2[2] - vs1[2] * vs2[1];
    vd[1] = vs1[2] * vs2[0] - vs1[0] * vs2[2];
    vd[2] = vs1[0] * vs2[1] - vs1[1] * vs2[0];
    STEP(4);
    NEXT;
}

IS(VCROSS_ILL) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VLOC(2);

    // x =  v1.y * v2.z - v1.z * v2.y,
    // y =  v1.z * v2.x - v1.x * v2.z,
    // z =  v1.x * v2.y - v1.y * v2.x
    vd[0] = vs1[1] * vs2[2] - vs1[2] * vs2[1];
    vd[1] = vs1[2] * vs2[0] - vs1[0] * vs2[2];
    vd[2] = vs1[0] * vs2[1] - vs1[1] * vs2[0];
    STEP(4);
    NEXT;
}

IS(VCROSS_LLI) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VIX0(2);

    // x =  v1.y * v2.z - v1.z * v2.y,
    // y =  v1.z * v2.x - v1.x * v2.z,
    // z =  v1.x * v2.y - v1.y * v2.x
    vd[0] = vs1[1] * vs2[2] - vs1[2] * vs2[1];
    vd[1] = vs1[2] * vs2[0] - vs1[0] * vs2[2];
    vd[2] = vs1[0] * vs2[1] - vs1[1] * vs2[0];
    STEP(4);
    NEXT;
}

IS(VCROSS_ILI) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VLOC(1);
    float32* vd  = VIX1(2);
    // x =  v1.y * v2.z - v1.z * v2.y,
    // y =  v1.z * v2.x - v1.x * v2.z,
    // z =  v1.x * v2.y - v1.y * v2.x
    vd[0] = vs1[1] * vs2[2] - vs1[2] * vs2[1];
    vd[1] = vs1[2] * vs2[0] - vs1[0] * vs2[2];
    vd[2] = vs1[0] * vs2[1] - vs1[1] * vs2[0];
    STEP(4);
    NEXT;
}

IS(VCROSS_LIL) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VIX0(1);
    float32* vd  = VLOC(2);
    // x =  v1.y * v2.z - v1.z * v2.y,
    // y =  v1.z * v2.x - v1.x * v2.z,
    // z =  v1.x * v2.y - v1.y * v2.x
    vd[0] = vs1[1] * vs2[2] - vs1[2] * vs2[1];
    vd[1] = vs1[2] * vs2[0] - vs1[0] * vs2[2];
    vd[2] = vs1[0] * vs2[1] - vs1[1] * vs2[0];
    STEP(4);
    NEXT;
}

IS(VCROSS_IIL) {
    float32* vs1 = VIX0(0);
    float32* vs2 = VIX1(1);
    float32* vd  = VLOC(2);
    // x =  v1.y * v2.z - v1.z * v2.y,
    // y =  v1.z * v2.x - v1.x * v2.z,
    // z =  v1.x * v2.y - v1.y * v2.x
    vd[0] = vs1[1] * vs2[2] - vs1[2] * vs2[1];
    vd[1] = vs1[2] * vs2[0] - vs1[0] * vs2[2];
    vd[2] = vs1[0] * vs2[1] - vs1[1] * vs2[0];
    STEP(4);
    NEXT;
}

IS(VCROSS_LII) {
    float32* vs1 = VLOC(0);
    float32* vs2 = VIX0(1);
    float32* vd  = VIX1(2);
    // x =  v1.y * v2.z - v1.z * v2.y,
    // y =  v1.z * v2.x - v1.x * v2.z,
    // z =  v1.x * v2.y - v1.y * v2.x
    vd[0] = vs1[1] * vs2[2] - vs1[2] * vs2[1];
    vd[1] = vs1[2] * vs2[0] - vs1[0] * vs2[2];
    vd[2] = vs1[0] * vs2[1] - vs1[1] * vs2[0];
    STEP(4);
    NEXT;
}


// Three Operand Vector Scale (Commutative, mixed args, 7 unique variants) /////////////////////////////////////////////
IS(VFMUL_LLL) {
    float32* vs = VLOC(0);
    float32  sf = LOC(1).f;
    float32* vd = VLOC(2);
    vd[0] = vs[0] * sf;
    vd[1] = vs[1] * sf;
    vd[2] = vs[2] * sf;
    STEP(4);
    NEXT;
}

IS(VFMUL_ILL) {
    float32* vs = VIX0(0);
    float32  sf = LOC(1).f;
    float32* vd = VLOC(2);
    vd[0] = vs[0] * sf;
    vd[1] = vs[1] * sf;
    vd[2] = vs[2] * sf;
    STEP(4);
    NEXT;
}

IS(VFMUL_LLI) {
    float32* vs = VLOC(0);
    float32  sf = LOC(1).f;
    float32* vd = VIX0(2);
    vd[0] = vs[0] * sf;
    vd[1] = vs[1] * sf;
    vd[2] = vs[2] * sf;
    STEP(4);
    NEXT;
}

IS(VFMUL_ILI) {
    float32* vs = VIX0(0);
    float32  sf = LOC(1).f;
    float32* vd = VIX1(2);
    vd[0] = vs[0] * sf;
    vd[1] = vs[1] * sf;
    vd[2] = vs[2] * sf;
    STEP(4);
    NEXT;
}

IS(VFMUL_LIL) {
    float32* vs = VLOC(0);
    float32  sf = IX0(1).f;
    float32* vd = VLOC(2);
    vd[0] = vs[0] * sf;
    vd[1] = vs[1] * sf;
    vd[2] = vs[2] * sf;
    STEP(4);
    NEXT;
}

IS(VFMUL_IIL) {
    float32* vs = VIX0(0);
    float32  sf = IX1(1).f;
    float32* vd = VLOC(2);
    vd[0] = vs[0] * sf;
    vd[1] = vs[1] * sf;
    vd[2] = vs[2] * sf;
    STEP(4);
    NEXT;
}

IS(VFMUL_LII) {
    float32* vs = VLOC(0);
    float32  sf = IX0(1).f;
    float32* vd = VIX1(2);
    vd[0] = vs[0] * sf;
    vd[1] = vs[1] * sf;
    vd[2] = vs[2] * sf;
    STEP(4);
    NEXT;
}
