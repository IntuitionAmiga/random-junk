/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include <cstdlib>
#include "include/gvm_core.hpp"
#include "include/gvm_debug.hpp"

using namespace GVM;

void*                  Interpreter::workingSet        = 0;
Interpreter::CallInfo* Interpreter::callStack         = 0;
Interpreter::CallInfo* Interpreter::callStackBase     = 0;
Interpreter::CallInfo* Interpreter::callStackTop      = 0;
Scalar*                Interpreter::frameStack        = 0;
Scalar*                Interpreter::frameStackBase    = 0;
Scalar*                Interpreter::frameStackTop     = 0;

const uint8*    Interpreter::programCounter    = 0;
const FuncInfo* Interpreter::functionTable     = 0;
uint32          Interpreter::functionTableSize = 0;

const HostCall* Interpreter::hostFunctionTable     = 0;
uint32          Interpreter::hostFunctionTableSize = 0;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Result Interpreter::init(size_t rSize, size_t fSize, const FuncInfo* table, const HostCall* hostFuncTable) {
    if (!table || !hostFuncTable) {
        gvmDebug("GVM::Interpreter::init()\n\tFunction tables cannot be empty\n");
        return MISC_ILLEGAL_VALUE;
    }

    if (rSize < MIN_CALL_DEPTH || rSize > MAX_CALL_DEPTH) {
        gvmDebug(
            "GVM::Interpreter::init()\n\tReturn Stack Size %d is not in range %d - %d\n",
            (int)rSize,
            MIN_CALL_DEPTH,
            MAX_CALL_DEPTH
        );
        return MISC_ILLEGAL_VALUE;
    }

    if (fSize == 0) {
        fSize = rSize * FuncInfo::MAX_FRAME_SIZE;
    }

    if (fSize < MIN_STACK_SIZE || fSize > MAX_STACK_SIZE) {
        gvmDebug(
            "GVM::Interpreter::init()\n\tFrame Stack Size %d is not in range %d - %d\n",
            (int)fSize,
            MIN_STACK_SIZE,
            MAX_STACK_SIZE
        );
        return MISC_ILLEGAL_VALUE;
    }

    size_t callStackSize   = (1 + rSize) * sizeof(CallInfo);
    size_t frameStackSize  = (fSize + REDZONE_BUFFER * 2) * sizeof(Scalar);
    size_t totalAllocation = callStackSize + frameStackSize;

    gvmDebug(
        "GVM::Interpreter::init()\n"
        "\tRequire %d bytes for working set:\n"
        "\t%d bytes for call stack  (%d [+1 redzone] of %d bytes each)\n"
        "\t%d bytes for frame stack (%d of %d bytes each, including start and end red zones of %d entries each)\n",
        (int)totalAllocation,
        (int)callStackSize, (int)rSize, (int)sizeof(CallInfo),
        (int)frameStackSize,(int)fSize, (int)sizeof(Scalar),
        (int)REDZONE_BUFFER
    );

    uint8* readySet = (uint8*)std::calloc(totalAllocation, sizeof(uint8));
    if (!readySet) {
        gvmDebug("GVM::Interpreter::init()\n\tCould not allocate working set\n");
        return INIT_OUT_OF_MEMORY;
    }

    Result result = validateFunctionTables(table, hostFuncTable);

    if (result != SUCCESS) {
        std::free(readySet);
        return result;
    }

    workingSet = readySet;

    // Bookend entry so that we don't have to edge case checks for the first entry point
    readySet += sizeof(CallInfo);

    callStackBase      = callStack = (Interpreter::CallInfo*)readySet;
    callStackTop       = &callStackBase[rSize-1];

    frameStackBase     = frameStack = (Scalar*)(readySet + callStackSize) + REDZONE_BUFFER;
    frameStackTop      = &frameStackBase[fSize-1];

    gvmDebug(
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
    return SUCCESS;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void Interpreter::done() {
    if (workingSet) {
        gvmDebug("GVM::Interpreter::done()\n\tReleased working set\n");
        std::free(workingSet);
        workingSet = 0;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Result Interpreter::validateFunctionTables(const FuncInfo* funcTable, const HostCall* hostFuncTable) {

    if (funcTable[0].entryPoint || hostFuncTable[0]) {
        gvmDebug("Illegal Zero Indexed function\n");
        return INIT_INVALID_FRAME_DEF;
    }

    int numHostFunctions = 1;
    while (hostFuncTable[numHostFunctions]) {
        if (numHostFunctions > FuncInfo::MAX_ID) {
            gvmDebug(
                "GVM::Interpreter::validateFunctionTables()\n\tFunction table too long, exceeded %d entries\n",
                FuncInfo::MAX_ID
            );
            return INIT_TABLE_TOO_BIG;
        }
        ++numHostFunctions;
    }

    const char* illegalSizeMessageTemplate =
        "GVM::Interpreter::validateFunctionTables()\n"
        "\tFunction funcTable entry %d has %s size %d\n";

    int numFunctions = 1;
    while (funcTable[numFunctions].entryPoint) {
        if (numFunctions > FuncInfo::MAX_ID) {
            gvmDebug(
                "GVM::Interpreter::validateFunctionTables()\n\tFunction funcTable too long, exceeded %d entries\n",
                FuncInfo::MAX_ID
            );
            return INIT_TABLE_TOO_BIG;
        }
        if (funcTable[numFunctions].frameSize > FuncInfo::MAX_LOCAL_SIZE) {
            gvmDebug(
                illegalSizeMessageTemplate,
                numFunctions,
                "illegal frame",
                (int)funcTable[numFunctions].frameSize
            );
            return INIT_INVALID_FRAME_DEF;
        }
        if (funcTable[numFunctions].returnSize > FuncInfo::MAX_RETURN_SIZE) {
            gvmDebug(
                illegalSizeMessageTemplate,
                numFunctions,
                "illegal return",
                (int)funcTable[numFunctions].returnSize
            );
            return INIT_INVALID_FRAME_DEF;
        }
        if (funcTable[numFunctions].paramSize > FuncInfo::MAX_PARAM_SIZE) {
            gvmDebug(
                illegalSizeMessageTemplate,
                numFunctions,
                "illegal param",
                (int)funcTable[numFunctions].paramSize
            );
            return INIT_INVALID_FRAME_DEF;
        }
        if (funcTable[numFunctions].localSize > FuncInfo::MAX_LOCAL_SIZE) {
            gvmDebug(
                illegalSizeMessageTemplate,
                numFunctions,
                "illegal local",
                (int)funcTable[numFunctions].localSize
            );
            return INIT_INVALID_FRAME_DEF;
        }
        if (
            funcTable[numFunctions].frameSize != (
                funcTable[numFunctions].returnSize +
                funcTable[numFunctions].paramSize +
                funcTable[numFunctions].localSize
            )
        ) {
            gvmDebug(
                illegalSizeMessageTemplate,
                numFunctions,
                "inconsistent frame",
                (int)funcTable[numFunctions].frameSize
            );
            return INIT_INVALID_FRAME_DEF;
        }
        ++numFunctions;
    }

    functionTable         = funcTable;
    functionTableSize     = numFunctions--;
    hostFunctionTable     = hostFuncTable;
    hostFunctionTableSize = numHostFunctions--;

    gvmDebug(
        "GVM::Interpreter::validateFunctionTables()\n\tFunction table has %d virtual and %d host native entries.\n",
        (int)numFunctions,
        (int)numHostFunctions
    );

    return SUCCESS;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Result Interpreter::invoke(uint16 functionId) {
    Result result = enterFunction(0, functionId);
    if (result == SUCCESS) {
        result = run();
    }
    return result;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Result Interpreter::enterFunction(const uint8* returnAddress, uint16 functionId) {
    if (functionId == 0 || functionId > functionTableSize) {
        gvmDebug(
            "GVM::Interpreter::enterFunction(%d)\n\tID is out of range 1-%d.\n",
            (int)functionId,
            (int)functionTableSize
        );
        return EXEC_ILLEGAL_CALL_ID;
    }
    if (callStack < callStackTop) {
        uint32 currentFrameSize = callStack->frameSize;
        if (frameStack + currentFrameSize > frameStackTop) {
            gvmDebug(
                "GVM::Interpreter::enterFunction(%d)\n\tFrame Stack Overflow.\n",
                (int)functionId
            );
            return EXEC_FRAME_STACK_OVERFLOW;
        }
        frameStack += currentFrameSize;
        ++callStack;
        callStack->returnAddress = returnAddress;
        callStack->functionId    = functionId;
        callStack->frameSize     = functionTable[functionId].frameSize;
        programCounter           = functionTable[functionId].entryPoint;

        gvmDebug(
            "GVM::Interpreter::enterFunction(%d) {\n\tAddress: %p\n\tSize: %d\n\tReturn Address: %p\n\tPC Entry: %p\n}\n",
            (int)functionId,
            frameStack,
            (int)callStack->frameSize,
            returnAddress,
            programCounter
        );

        return SUCCESS;
    }

    gvmDebug(
        "GVM::Interpreter::enterFunction(%d)\n\tCall Stack overflowed.\n",
        (int)functionId
    );
    return EXEC_CALL_STACK_OVERFLOW;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Result Interpreter::enterClosure(const uint8* returnAddress, int16 branch, uint8 frameSize) {
    if (callStack < callStackTop) {
        uint32 currentFrameSize = callStack->frameSize;
        if (frameStack + currentFrameSize > frameStackTop) {
            gvmDebug("GVM::Interpreter::enterClosure()\n\tFrame Stack Overflow.\n");
            return EXEC_FRAME_STACK_OVERFLOW;
        }
        frameStack += currentFrameSize;
        ++callStack;
        callStack->returnAddress = returnAddress;
        callStack->functionId    = 0;
        callStack->frameSize     = frameSize;
        programCounter           += branch;

        gvmDebug(
            "GVM::Interpreter::enterClosure() {\n\tAddress: %p\n\tSize: %d\n\tReturn Address: %p\n\tPC Entry: %p\n}\n",
            frameStack,
            (int)callStack->frameSize,
            returnAddress,
            programCounter
        );

        return SUCCESS;
    }

    gvmDebug("GVM::Interpreter::enterClosure()\n\tCall Stack overflowed.\n");
    return EXEC_CALL_STACK_OVERFLOW;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Result Interpreter::exitFunction() {

    if (callStack > callStackBase) {
        const uint8* returnTo = callStack->returnAddress;
        int currentId = callStack->functionId;
        --callStack;
        if (frameStack - callStack->frameSize < frameStackBase) {
            gvmDebug("GVM::Interpreter::exitFunction()\n\tFrame Stack Underflow.\n");
            return EXEC_FRAME_STACK_UNDERFLOW;
        }
        frameStack -= callStack->frameSize;
        programCounter = returnTo;
        gvmDebug(
            "GVM::Interpreter::exitFunction(%d) {\n\tReturn to function:%d\n\tPC Resume: %p\n}\n",
            currentId,
            (int)callStack->functionId,
            programCounter
        );
        return returnTo ? SUCCESS : EXEC_RETURN_TO_HOST;
    }
    return EXEC_CALL_STACK_UNDERFLOW;
}
