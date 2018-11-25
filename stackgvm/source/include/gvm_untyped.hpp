
// Untyped Instructions ////////////////////////////////////////////////////////////////////////////////////////////////

IS(HCF) {
    // Halt and catch fire
    EXIT(EXEC_HALT_AND_CATCH_FIRE);
}

// Unconditional Branch (GOTO) /////////////////////////////////////////////////////////////////////////////////////////

IS(BRAS) {
    // Branch to a signed 8-bit offset
    STEP(J8(0));
    NEXT;
}

IS(BRA) {
    // Branch to a signed 16-bit offset
    STEP(J16(0));
    NEXT;
}

// Function Call ///////////////////////////////////////////////////////////////////////////////////////////////////////

IS(BCALL) {
    // Call an anonymous local function
    Result result = enterClosure(RTA(4), J16(1), U8(0));
    if (result != SUCCESS) {
        EXIT(result);
    }
    NEXT;
}

IS(CALL) {
    // Call a named function by ID
    Result result = enterFunction(RTA(3), SYM(0));
    if (result != SUCCESS) {
        EXIT(result);
    }
    NEXT;
}

IS(ICALL_L) {
    // Call a named function by ID stored in local refrence
    Result result = enterFunction(RTA(2), LOC(0).u);
    if (result != SUCCESS) {
        EXIT(result);
    }
    NEXT;
}

IS(ICALL_I) {
    // Call a named function by ID stored in an indirect reference
    Result result = enterFunction(RTA(3), IX(0, 1).u);
    if (result != SUCCESS) {
        EXIT(result);
    }
    NEXT;
}

IS(HCALL) {
    // Call a host function
    STEP(2);
    NEXT;
}

IS(RET) {
    // Return from the current function
    Result result = exitFunction();
    if (result != SUCCESS) {
        EXIT(result);
    }
    NEXT;
}

// Linked List Traversal ///////////////////////////////////////////////////////////////////////////////////////////////

IS(LLBNN) {
    // Load indirect to indirection register and branch if not null
    if (!(IR(0) = IX(0, 1).a)) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Scalar Instructions (Float Or Integer) //////////////////////////////////////////////////////////////////////////////

// Single Operand Branch If Zero ///////////////////////////////////////////////////////////////////////////////////////

IS(BEZ_L) {
    // Branch to a signed 16-bit offset if local is equal to zero
    if (0 == LOC(0).u) {
        STEP(J16(1));
        NEXT;
    }
    STEP(4);
    NEXT;
}

IS(BEZ_I) {
    // Branch to a signed 16-bit offset if indirect is equal to zero
    if (0 == IX(0, 1).u) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Single Operand Branch If Not Zero //////////////////////////////////////////////////////////////////////////////////

IS(BNZ_L) {
    // Branch to a signed 16-bit offset if local is not equal to zero
    if (0 != LOC(0).u) {
        STEP(J16(1));
        NEXT;
    }
    STEP(4);
    NEXT;
}

IS(BNZ_I) {
    // Branch to a signed 16-bit offset if indirect is not equal to zero
    if (0 != IX(0, 1).u) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Two Operand Branch If Equal /////////////////////////////////////////////////////////////////////////////////////////

IS(BEQ_LL) {
    // Branch to a signed 16-bit offset if two local values are equal
    if (LOC(1).u == LOC(0).u) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(BEQ_LI) {
    // Branch to a signed 16-bit offset if local and indirect values are equal
    if (IX0(1).u == LOC(0).u) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

IS(BEQ_II) {
    // Branch to a signed 16-bit offset if two indirect values are equal
    if (IX0(0).u == IX1(1).u) {
        STEP(J16(2));
        NEXT;
    }
    STEP(5);
    NEXT;
}

// Addressing Operations //////////////////////////////////////////////////////////////////////////////////////////////

IS(ADDR_LL) {
    // Get address of local variable into local variable
    LOC(1).a = &LOC(0);
    STEP(3);
    NEXT;
}

IS(ADDR_IL) {
    // Get address of indirect variable into local variable
    STEP(4);
    NEXT;
}

IS(ADDR_DL) {
    // Load the address of a global data symbol to a local variable
    STEP(4);
    NEXT;
}

IS(ADDR_DI) {
    // Load the address of a global data symbol to an indirect variable
    STEP(5);
    NEXT;
}

IS(ADDR_DX) {
    // Load the address of a global data symbol directly into an index register
    STEP(4);
    NEXT;
}

IS(ADDR_CL) {
    // Load code symbol to local variable
    STEP(4);
    NEXT;
}

IS(ADDR_CI) {
    // Load code symbol to indirect variable
    STEP(5);
    NEXT;
}

// Data Movement Operations ////////////////////////////////////////////////////////////////////////////////////////////

IS(LOAD_LX) {
    // Load local reference to index register
    IR(1) = &LOC(0);
    STEP(3);
    NEXT;
}

IS(SAVE_XL) {
    // Save indirection index to local
    LOC(1).a = IR(0);
    STEP(3);
    NEXT;
}

IS(LOAD_HL) {
    // Load host lookup to local
    STEP(3);
    NEXT;
}

IS(COPY_LL) {
    // Copy a local scalar to a local scalar
    LOC(1).u = LOC(0).u;
    STEP(3);
    NEXT;
}

IS(COPY_IL) {
    // Copy an indirect scalar to a local
    LOC(1).u = IX0(0).u;
    STEP(3);
    NEXT;
}

IS(COPY_LI) {
    // Copy a local scalar to an indirect
    IX0(1).u = LOC(0).u;
    STEP(3);
    NEXT;
}

IS(COPY_II) {
    // Copy an indirect scalar to another indirect
    IX1(1).u = IX0(0).u;
    STEP(3);
    NEXT;
}

// Type Conversion Operations //////////////////////////////////////////////////////////////////////////////////////////

IS(ITOF_LL) {
    // Cast float to integer
    LOC(1).i = (int32)LOC(0).f;
    STEP(3);
    NEXT;
}

IS(FTOI_LL) {
    // Cast integer to float
    LOC(1).f = (float32)LOC(0).i;
    STEP(3);
    NEXT;
}
