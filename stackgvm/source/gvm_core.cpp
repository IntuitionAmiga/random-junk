/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include <cstdlib>
#include "include/gvm_core.hpp"

using namespace GVM;

void*           Interpreter::workingSet        = 0;

const CallInfo* Interpreter::callStack         = 0;
const CallInfo* Interpreter::callStackBase     = 0;
const CallInfo* Interpreter::callStackTop      = 0;
Scalar*         Interpreter::frameStack        = 0;
Scalar*         Interpreter::frameStackBase    = 0;
Scalar*         Interpreter::frameStackTop     = 0;
const uint8*    Interpreter::programCounter    = 0;
const FuncInfo* Interpreter::functionTable     = 0;
uint32          Interpreter::functionTableSize = 0;

bool Interpreter::init(size_t rSize, size_t fSize, const FuncInfo* table) {
    if (!table) {
        std::fprintf(stderr, "GVM::Interpreter::init()\n\tFuncInfo table cannot be null\n");
        return false;
    }

    if (rSize < MIN_CALL_DEPTH || rSize > MAX_CALL_DEPTH) {
        std::fprintf(stderr, "GVM::Interpreter::init()\n\tReturn Stack Size %d is not in range %d - %d\n", (int)rSize, MIN_CALL_DEPTH, MAX_CALL_DEPTH);
        return false;
    }

    if (fSize == 0) {
        fSize = rSize * FuncInfo::MAX_FRAME_SIZE;
    }

    if (fSize < MIN_STACK_SIZE || fSize > MAX_STACK_SIZE) {
        std::fprintf(stderr, "GVM::Interpreter::init()\n\tFrame Stack Size %d is not in range %d - %d\n", (int)fSize, MIN_STACK_SIZE, MAX_STACK_SIZE);
        return false;
    }

    size_t callStackSize   = rSize * sizeof(CallInfo);
    size_t frameStackSize  = (fSize + REDZONE_BUFFER * 2) * sizeof(Scalar);
    size_t totalAllocation = callStackSize + frameStackSize;

    std::fprintf(
        stderr,
        "GVM::Interpreter::init()\n"
        "\tRequire %d bytes for working set:\n"
        "\t%d bytes for call stack  (%d of %d bytes each)\n"
        "\t%d bytes for frame stack (%d of %d bytes each, including start and end red zones of %d entries each)\n",
        (int)totalAllocation,
        (int)callStackSize, (int)rSize, (int)sizeof(CallInfo),
        (int)frameStackSize,(int)fSize, (int)sizeof(Scalar),
        (int)REDZONE_BUFFER
    );

    uint8* readySet = (uint8*)std::calloc(totalAllocation, sizeof(uint8));
    if (!readySet) {
        std::fprintf(stderr, "GVM::Interpreter::init()\n\tCould not allocate working set\n");
        return false;
    }

    if (!validateFunctionTable(table)) {
        std::free(readySet);
        return false;
    }

    workingSet = readySet;

    callStackBase      = callStack = (const CallInfo*)readySet;
    callStackTop       = &callStackBase[rSize-1];

    frameStackBase     = frameStack = (Scalar*)(readySet + callStackSize) + REDZONE_BUFFER;
    frameStackTop      = &frameStackBase[fSize-1];

    std::fprintf(
        stderr,
        "GVM::Interpreter::init()\n"
        "\tCall Stack     [%p - %p]\n"
        "\tFrame Stack    [%p - %p]\n"
        "\tFunction Table [%p]\n",
        callStackBase,
        callStackTop,
        frameStackBase,
        frameStackTop,
        functionTable
    );
    return true;
}

void Interpreter::done() {
    if (workingSet) {
        std::fprintf(stderr, "GVM::Interpreter::done()\n\tReleased working set\n");
        std::free(workingSet);
        workingSet = 0;
    }
}

bool Interpreter::validateFunctionTable(const FuncInfo* table) {

    if (table[0].entryPoint) {
        std::fprintf(stderr, "Function table entry zero must be empty\n");
        return false;
    }

    const char* illegalSizeMessageTemplate =
        "GVM::Interpreter::validateFunctionTable()\n"
        "\tFunction table entry %d has %s size %d\n";

    int id = 1;
    while (table[id].entryPoint) {
        if (id > FuncInfo::MAX_ID) {
            std::fprintf(
                stderr,
                "GVM::Interpreter::validateFunctionTable()\n\tFunction table too long, exceeded %d entries\n",
                FuncInfo::MAX_ID
            );
            return false;
        }
        if (table[id].frameSize > FuncInfo::MAX_LOCAL_SIZE) {
            std::fprintf(stderr, illegalSizeMessageTemplate, id, "illegal frame", (int)table[id].frameSize);
            return false;
        }
        if (table[id].returnSize > FuncInfo::MAX_RETURN_SIZE) {
            std::fprintf(stderr, illegalSizeMessageTemplate, id, "illegal return", (int)table[id].returnSize);
            return false;
        }
        if (table[id].paramSize > FuncInfo::MAX_PARAM_SIZE) {
            std::fprintf(stderr, illegalSizeMessageTemplate, id, "illegal param", (int)table[id].paramSize);
            return false;
        }
        if (table[id].localSize > FuncInfo::MAX_LOCAL_SIZE) {
            std::fprintf(stderr, illegalSizeMessageTemplate, id, "illegal local", (int)table[id].localSize);
            return false;
        }
        if (table[id].frameSize != (table[id].returnSize + table[id].paramSize + table[id].localSize)) {
            std::fprintf(stderr, illegalSizeMessageTemplate, id, "inconsistent frame", (int)table[id].frameSize);
            return false;
        }
        ++id;
    }

    functionTable     = table;
    functionTableSize = id - 1;

    std::fprintf(stderr, "GVM::Interpreter::validateFunctionTable()\n\tFunction table has %d callable entries\n", (int)functionTableSize);

    return true;
}

bool Interpreter::execute(uint16 functionId) {
    return false;
}
