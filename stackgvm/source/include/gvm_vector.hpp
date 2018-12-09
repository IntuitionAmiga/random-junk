
// Vector specific Instructions ////////////////////////////////////////////////////////////////////////////////////////

// Single Operand Random Vector ////////////////////////////////////////////////////////////////////////////////////////

IS(VRND_L) {
    vd = VLOC(0);
    float32 x = (invRMax * std::rand()) - 1.0f;
    float32 y = (invRMax * std::rand()) - 1.0f;
    float32 z = (invRMax * std::rand()) - 1.0f;
    sf = 1.0f / std::sqrt((x * x) + (y * y) + (z * z));
    vd[0] = x*sf;
    vd[1] = y*sf;
    vd[2] = z*sf;
    STEP(2);
    NEXT;
}

// Two Operand Branch If Vector Equal //////////////////////////////////////////////////////////////////////////////////

IS(VBEQ_LL) {
    us = ULOC(0);
    ud = ULOC(1);
    goto vector_branch_equal;
}

IS(VBEQ_IL) {
    us = UIX0(0);
    ud = ULOC(1);
    goto vector_branch_equal;
}

IS(VBEQ_II) {
    us = UIX0(0);
    ud = UIX1(1);

vector_branch_equal:
    if (
        ud[0] == us[0] &&
        ud[1] == us[1] &&
        ud[2] == us[2]
    ) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Two Operand Branch if Vector Not Equal //////////////////////////////////////////////////////////////////////////////

IS(VBNE_LL) {
    us = ULOC(0);
    ud = ULOC(1);
    goto vector_branch_not_equal;
}

IS(VBNE_IL) {
    us = UIX0(0);
    ud = ULOC(1);
    goto vector_branch_not_equal;
}

IS(VBNE_II) {
    us = UIX0(0);
    ud = UIX1(1);

vector_branch_not_equal:
    if (
        ud[0] != us[0] ||
        ud[1] != us[1] ||
        ud[2] != us[2]
    ) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Two Operand Vector Copy /////////////////////////////////////////////////////////////////////////////////////////////

IS(VCOPY_LL) {
    us = ULOC(0);
    ud = ULOC(1);
    goto vector_copy;
}

IS(VCOPY_IL) {
    us = UIX0(0);
    ud = ULOC(1);
    goto vector_copy;
}

IS(VCOPY_LI) {
    us = ULOC(0);
    ud = UIX0(1);
    goto vector_copy;
}

IS(VCOPY_II) {
    us = UIX0(0);
    ud = UIX1(1);

vector_copy:
    ud[0] = us[0];
    ud[1] = us[1];
    ud[2] = us[2];
    STEP(3);
    NEXT;
}

// Two Operand Vector Negate ///////////////////////////////////////////////////////////////////////////////////////////

IS(VNEG_LL) {
    vs1 = VLOC(0);
    vd  = VLOC(1);
    goto vector_negate;
}

IS(VNEG_IL) {
    vs1 = VIX0(0);
    vd  = VLOC(1);
    goto vector_negate;
}

IS(VNEG_LI) {
    vs1 = VLOC(0);
    vd  = VIX0(1);
    goto vector_negate;
}

IS(VNEG_II) {
    vs1 = VIX0(0);
    vd  = VIX1(1);

vector_negate:
    vd[0] = -vs1[0];
    vd[1] = -vs1[1];
    vd[2] = -vs1[2];
    STEP(3);
    NEXT;
}

// Two Operand Vector Normalisation ////////////////////////////////////////////////////////////////////////////////////

IS(VNORM_LL) {
    vs1 = VLOC(0);
    vd  = VLOC(1);
    goto vector_normalise;
}

IS(VNORM_IL) {
    vs1 = VIX0(0);
    vd  = VLOC(1);
    goto vector_normalise;
}

IS(VNORM_LI) {
    vs1 = VLOC(0);
    vd  = VIX0(1);
    goto vector_normalise;
}

IS(VNORM_II) {
    vs1 = VIX0(0);
    vd  = VIX1(1);

vector_normalise:
    sf = 1.0f / std::sqrt(
        (vs1[0] * vs1[0]) +
        (vs1[1] * vs1[1]) +
        (vs1[2] * vs1[2])
    );
    vd[0] = sf * vs1[0];
    vd[1] = sf * vs1[1];
    vd[2] = sf * vs1[2];
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
    vs1 = VLOC(0);
    vs2 = VLOC(1);
    vd  = VLOC(2);
    goto vector_add;
}

IS(VADD_ILL) {
    vs1 = VIX0(0);
    vs2 = VLOC(1);
    vd  = VLOC(2);
    goto vector_add;
}

IS(VADD_LLI) {
    vs1 = VLOC(0);
    vs2 = VLOC(1);
    vd  = VIX0(2);
    goto vector_add;
}

IS(VADD_ILI) {
    vs1 = VIX0(0);
    vs2 = VLOC(1);
    vd  = VIX1(2);

vector_add:
    vd[0] = vs1[0] + vs2[0];
    vd[1] = vs1[1] + vs2[1];
    vd[2] = vs1[2] + vs2[2];
    STEP(4);
    NEXT;
}

// Three Operand Vector Subtraction (Noncommutative, 7 unique variants) ////////////////////////////////////////////////

IS(VSUB_LLL) {
    vs1 = VLOC(0);
    vs2 = VLOC(1);
    vd  = VLOC(2);
    goto vector_subtract;
}

IS(VSUB_ILL) {
    vs2 = VLOC(1);
    vd  = VLOC(2);
    vs1 = VIX0(0);
    goto vector_subtract;
}

IS(VSUB_LLI) {
    vs1 = VLOC(0);
    vs2 = VLOC(1);
    vd  = VIX0(2);
    goto vector_subtract;
}

IS(VSUB_ILI) {
    vs1 = VIX0(0);
    vs2 = VLOC(1);
    vd  = VIX1(2);
    goto vector_subtract;
}

IS(VSUB_LIL) {
    vs2 = VIX0(1);
    vs1 = VLOC(0);
    vd  = VLOC(2);
    goto vector_subtract;
}

IS(VSUB_IIL) {
    vs1 = VIX0(0);
    vs2 = VIX1(1);
    vd  = VLOC(2);
    goto vector_subtract;
}

IS(VSUB_LII) {
    vs1 = VLOC(0);
    vs2 = VIX0(1);
    vd  = VIX1(2);

vector_subtract:
    vd[0] = vs1[0] - vs2[0];
    vd[1] = vs1[1] - vs2[1];
    vd[2] = vs1[2] - vs2[2];
    STEP(4);
    NEXT;
}


// Three Operand Dot Product (Scalar Float Result) /////////////////////////////////////////////////////////////////////

IS(VDOT_LLL) {
    vs1 = VLOC(0);
    vs2 = VLOC(1);
    LOC(2).f = vs1[0] * vs2[0] + vs1[1] * vs2[1] + vs1[2] * vs2[2];
    STEP(4);
    NEXT;
}

IS(VDOT_ILL) {
    vs1 = VIX0(0);
    vs2 = VLOC(1);
    LOC(2).f = vs1[0] * vs2[0] + vs1[1] * vs2[1] + vs1[2] * vs2[2];
    STEP(4);
    NEXT;
}

IS(VDOT_LLI) {
    vs1 = VLOC(0);
    vs2 = VLOC(1);
    IX0(2).f = vs1[0] * vs2[0] + vs1[1] * vs2[1] + vs1[2] * vs2[2];
    STEP(4);
    NEXT;
}

IS(VDOT_ILI) {
    vs1 = VIX0(0);
    vs2 = VLOC(1);
    IX1(2).f = vs1[0] * vs2[0] + vs1[1] * vs2[1] + vs1[2] * vs2[2];
    STEP(4);
    NEXT;
}


// Three Operand Cross Product (Noncommutative, 7 unique variants) /////////////////////////////////////////////////////
IS(VCROSS_LLL) {
    vs1 = VLOC(0);
    vs2 = VLOC(1);
    vd  = VLOC(2);
    goto vector_cross_product;
}

IS(VCROSS_ILL) {
    vs1 = VIX0(0);
    vs2 = VLOC(1);
    vd  = VLOC(2);
    goto vector_cross_product;
}

IS(VCROSS_LLI) {
    vs1 = VLOC(0);
    vs2 = VLOC(1);
    vd  = VIX0(2);
    goto vector_cross_product;
}

IS(VCROSS_ILI) {
    vs1 = VIX0(0);
    vs2 = VLOC(1);
    vd  = VIX1(2);
    goto vector_cross_product;
}

IS(VCROSS_LIL) {
    vs1 = VLOC(0);
    vs2 = VIX0(1);
    vd  = VLOC(2);
    goto vector_cross_product;
}

IS(VCROSS_IIL) {
    vs1 = VIX0(0);
    vs2 = VIX1(1);
    vd  = VLOC(2);
    goto vector_cross_product;
}

IS(VCROSS_LII) {
    vs1 = VLOC(0);
    vs2 = VIX0(1);
    vd  = VIX1(2);

vector_cross_product:
    // x =  v1.y * v2.z - v1.z * v2.y,
    // y =  v1.z * v2.x - v1.x * v2.z,
    // z =  v1.x * v2.y - v1.y * v2.x#
    vd[0] = vs1[1] * vs2[2] - vs1[2] * vs2[1];
    vd[1] = vs1[2] * vs2[0] - vs1[0] * vs2[2];
    vd[2] = vs1[0] * vs2[1] - vs1[1] * vs2[0];
    STEP(4);
    NEXT;
}


// Three Operand Vector Scale (Commutative, mixed args, 7 unique variants) /////////////////////////////////////////////
IS(VFMUL_LLL) {
    vs1 = VLOC(0);
    sf = LOC(1).f;
    vd = VLOC(2);
    goto vector_scale_by_float;
}

IS(VFMUL_ILL) {
    vs1 = VIX0(0);
    sf = LOC(1).f;
    vd = VLOC(2);
    goto vector_scale_by_float;
}

IS(VFMUL_LLI) {
    vs1 = VLOC(0);
    sf = LOC(1).f;
    vd = VIX0(2);
    goto vector_scale_by_float;
}

IS(VFMUL_ILI) {
    vs1 = VIX0(0);
    sf = LOC(1).f;
    vd = VIX1(2);
    goto vector_scale_by_float;
}

IS(VFMUL_LIL) {
    vs1 = VLOC(0);
    sf = IX0(1).f;
    vd = VLOC(2);
    goto vector_scale_by_float;
}

IS(VFMUL_IIL) {
    vs1 = VIX0(0);
    sf = IX1(1).f;
    vd = VLOC(2);
    goto vector_scale_by_float;
}

IS(VFMUL_LII) {
    vs1 = VLOC(0);
    sf = IX0(1).f;
    vd = VIX1(2);

vector_scale_by_float:
    vd[0] = vs1[0] * sf;
    vd[1] = vs1[1] * sf;
    vd[2] = vs1[2] * sf;
    STEP(4);
    NEXT;
}
