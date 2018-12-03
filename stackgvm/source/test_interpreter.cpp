/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include "include/gvm_core.hpp"

using namespace GVM;

uint8 _gvm_test1[] = {
    Opcode::_ADD_LLL, 1, 2, 3, // fs[3] = fs[1] + fs[2]
    Opcode::_CALL,    0, 2,
    Opcode::_COPY_LL, 3, 0,    // fs[0] = fs[3]
    Opcode::_RET
};

uint8 _gvm_test2[] = {
    Opcode::_LSL_LLL, 0, 0, 0, // fs[0] = fs[1] << fs[1]
    Opcode::_RET
};


FuncInfo functionTable[] = {
    { 0, 0, 0, 0, 0 },           // index 0 must be null
    { _gvm_test1, 3, 1, 2, 0 },
    { _gvm_test2, 1, 1, 0, 0 },
    { 0, 0, 0, 0, 0 }            // Null termimated set
};

HostCall hostFunctionTable[] = {
    0,
    0
};

int main() {
    std::printf("Max Opcode %d\n", Opcode::_MAX);
    Interpreter::init(100, 0, functionTable, hostFunctionTable);
    Scalar* stack = Interpreter::stack();
    stack[0].i = 0;
    stack[1].i = 1;
    stack[2].i = 2;

    std::printf(
        "\nBefore\n\tstack[0] = %d\n\tstack[1] = %d\n\tstack[2] = %d\n",
        stack[0].i,
        stack[1].i,
        stack[2].i
    );

    Result result = Interpreter::invoke(1);

    std::printf(
        "\nAfter\n\tResult = %d\n\tstack[0] = %d\n\tstack[1] = %d\n\tstack[2] = %d\n",
        result,
        stack[0].i,
        stack[1].i,
        stack[2].i
    );

    Interpreter::done();

    return 0;
}
