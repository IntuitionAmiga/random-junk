/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include "include/gvm_core.hpp"

using namespace GVM;

uint8 _gvm_add[] = {
    Opcode::_ADD_LLL, 1, 2, 0, // fs[0] = fs[1] + fs[2]
    Opcode::_RET
};

FuncInfo functionTable[] = {
    { 0, 0, 0, 0, 0 },           // index 0 must be null
    { _gvm_add, 3, 1, 2, 0 },
    { 0, 0, 0, 0, 0 }            // Null termimated set
};

int main() {
    std::printf("Max Opcode %d\n", Opcode::_MAX);
    Interpreter::init(100, 0, functionTable);
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

    Interpreter::Result result = Interpreter::invoke(1);

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
