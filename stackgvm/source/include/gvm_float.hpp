
// Floating point specific instructions ////////////////////////////////////////////////////////////////////

// Two operand branch if greater or equal
IS(FBGE_LL) {
    if (LOC(0).f >= LOC(1).f) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(FBGE_IL) {
    if (IX0(0).f >= LOC(1).f) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(FBGE_LI) {
    if (LOC(0).f >= IX0(1).f) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(FBGE_II) {
    if (IX0(0).f >= IX1(1).f) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Two operand branch if greater than
IS(FBGT_LL) {
    if (LOC(0).f > LOC(1).f) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(FBGT_IL) {
    if (IX0(0).f > LOC(1).f) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(FBGT_LI) {
    if (LOC(0).f > IX0(1).f) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(FBGT_II) {
    if (IX0(0).f > IX1(1).f) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Two operand) local to local handy maths functions
IS(FINV_LL) {
    // Reciprocal
    LOC(1).f = 1.0f / LOC(0).f;
    STEP(3);
    NEXT;
}

IS(FSQRT_LL) {
    // Square root
    LOC(1).f = std::sqrt(LOC(0).f);
    STEP(3);
    NEXT;
}

IS(INVSQ_LL) {
    // Inverse square
    float32 sqr = LOC(0).f;
    sqr *= sqr;
    LOC(1).f = 1.0f / sqr;
    STEP(3);
    NEXT;
}

IS(FSIN_LL) {
    // Sine
    LOC(1).f = std::sin(LOC(0).f);
    STEP(3);
    NEXT;
}

IS(FCOS_LL) {
    // Cosine
    LOC(1).f = std::cos(LOC(0).f);
    STEP(3);
    NEXT;
}

IS(FACOS_LL) {
    // Arccosine
    LOC(1).f = std::acos(LOC(0).f);
    STEP(3);
    NEXT;
}

// Two operand float negate
IS(FNEG_LL) {
    LOC(1).f = -LOC(0).f;
    STEP(3);
    NEXT;
}

IS(FNEG_IL) {
    LOC(1).f = -IX0(0).f;
    STEP(3);
    NEXT;
}

IS(FNEG_LI) {
    IX0(1).f = -LOC(0).f;
    STEP(3);
    NEXT;
}

IS(FNEG_II) {
    IX1(1).f = -IX0(0).f;
    STEP(3);
    NEXT;
}

// Three operand float addition) Commutative) 4 unique variants
IS(FADD_LLL) {
    // Local + Local -> Local
    LOC(2).f = LOC(0).f + LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FADD_ILL) {
    // Indirect + Local -> Local
    LOC(2).f = IX0(0).f + LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FADD_LLI) {
    // Local + Local -> Indirect
    IX0(2).f = LOC(0).f + LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FADD_ILI) {
    // Indirect + Local -> Indirect
    IX1(2).f = IX0(0).f + LOC(1).f;
    STEP(4);
    NEXT;
}

// Three operand float subtraction) Noncommutative) 7 unique variants
IS(FSUB_LLL) {
    // Local - Local -> Local
    LOC(2).f = LOC(0).f - LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FSUB_ILL) {
    // Indirect - Local -> Local
    LOC(2).f = IX0(0).f - LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FSUB_LLI) {
    // Local - Local -> Indirect
    IX0(2).f = LOC(0).f - LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FSUB_ILI) {
    // Indirect - Local -> Indirect
    IX1(2).f = IX0(0).f - LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FSUB_LIL) {
    // Local - Indirect -> Local
    LOC(2).f = LOC(0).f - IX0(0).f;
    STEP(4);
    NEXT;
}

IS(FSUB_IIL) {
    // Indirect - Indirect -> Local
    LOC(2).f = IX0(0).f - IX1(1).f;
    STEP(4);
    NEXT;
}

IS(FSUB_LII) {
    // Local - Indirect -> Indirect
    IX1(2).f = LOC(0).f - IX0(1).f;
    STEP(4);
    NEXT;
}

// Three operand float multiplication) Commutative) 4 unique variants
IS(FMUL_LLL) {
    // Local * Local -> Local
    LOC(2).f = LOC(0).f * LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FMUL_ILL) {
    // Indirect * Local -> Local
    LOC(2).f = IX0(0).f * LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FMUL_LLI) {
    // Local * Local -> Indirect
    IX0(2).f = LOC(0).f * LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FMUL_ILI) {
    // Indirect * Local -> Indirect
    IX1(2).f = IX0(0).f * LOC(1).f;
    STEP(4);
    NEXT;
}

// Three operand float division) Noncommutative) 7 unique variants
IS(FDIV_LLL) {
    LOC(2).f = LOC(0).f / LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FDIV_ILL) {
    // Indirect / Local -> Local
    LOC(2).f = IX0(0).f / LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FDIV_LLI) {
    // Local / Local -> Indirect
    IX0(2).f = LOC(0).f / LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FDIV_ILI) {
    // Indirect / Local -> Indirect
    IX1(2).f = IX0(0).f / LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FDIV_LIL) {
    // Local / Indirect -> Local
    LOC(2).f = IX0(0).f / LOC(1).f;
    STEP(4);
    NEXT;
}

IS(FDIV_IIL) {
    // Indirect / Indirect -> Local
    LOC(2).f = IX0(0).f / IX1(1).f;
    STEP(4);
    NEXT;
}

IS(FDIV_LII) {
    // Local / Indirect -> Indirect
    IX1(2).f = LOC(0).f / IX0(1).f;
    STEP(4);
    NEXT;
}

// Three operand float modulo) Noncommutative) 7 unique variants
IS(FMOD_LLL) {
    LOC(2).f = std::fmod(LOC(0).f, LOC(1).f);
    STEP(4);
    NEXT;
}

IS(FMOD_ILL) {
    // Indirect % Local -> Local
    LOC(2).f = std::fmod(IX0(0).f, LOC(1).f);
    STEP(4);
    NEXT;
}

IS(FMOD_LLI) {
    // Local % Local -> Indirect
    IX0(2).f = std::fmod(LOC(0).f, LOC(1).f);
    STEP(4);
    NEXT;
}

IS(FMOD_ILI) {
    // Indirect % Local -> Indirect
    IX1(2).f = std::fmod(IX0(0).f, LOC(1).f);
    STEP(4);
    NEXT;
}

IS(FMOD_LIL) {
    // Local % Indirect -> Local
    LOC(2).f = std::fmod(IX0(0).f, LOC(1).f);
    STEP(4);
    NEXT;
}

IS(FMOD_IIL) {
    // Indirect % Indirect -> Local
    LOC(2).f = std::fmod(IX0(0).f, IX1(1).f);
    STEP(4);
    NEXT;
}

IS(FMOD_LII) {
    // Local % Indirect -> Indirect
    IX1(2).f = std::fmod(LOC(0).f, IX0(1).f);
    STEP(4);
    NEXT;
}

// Floating Point Maximum) Commutative) 4 unique variants
IS(FMAX_LLL) {
    STEP(4);
    NEXT;
}

IS(FMAX_ILL) {
    STEP(4);
    NEXT;
}

IS(FMAX_LLI) {
    STEP(4);
    NEXT;
}

IS(FMAX_ILI) {
    STEP(4);
    NEXT;
}

// Floating Point Minimum) Commutative) 4 unique variants
IS(FMIN_LLL) {
    STEP(4);
    NEXT;
}

IS(FMIN_ILL) {
    STEP(4);
    NEXT;
}

IS(FMIN_LLI) {
    STEP(4);
    NEXT;
}

IS(FMIN_ILI) {
    STEP(4);
    NEXT;
}
