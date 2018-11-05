/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include <cstdlib>
#include "include/gvm_core.hpp"

using namespace GVM;

void*              Interpreter::workingSet         = 0;
const uint8**      Interpreter::returnStack        = 0;
const uint8**      Interpreter::returnStackBase    = 0;
const uint8**      Interpreter::returnStackTop     = 0;
Interpreter::word* Interpreter::frameStack         = 0;
Interpreter::word* Interpreter::frameStackBase     = 0;
Interpreter::word* Interpreter::frameStackTop      = 0;
uint8*             Interpreter::frameSizeStack     = 0;
uint8*             Interpreter::frameSizeStackBase = 0;
const uint8*       Interpreter::programCounter     = 0;
Interpreter::word* Interpreter::indirect[3]        = { 0, 0, 0 };
const Function*    Interpreter::functionTable      = 0;
uint32             Interpreter::functionTableSize  = 0;

bool Interpreter::init(size_t rSize, size_t fSize, const Function* table) {
  if (!table) {
    std::fprintf(stderr, "GVM::Interpreter::init()\n\tFunction table cannot be null\n");
    return false;
  }
  if (rSize < MIN_CALL_DEPTH || rSize > MAX_CALL_DEPTH) {
    std::fprintf(stderr, "GVM::Interpreter::init()\n\tReturn Stack Size %d is not in range %d - %d\n", (int)rSize, MIN_CALL_DEPTH, MAX_CALL_DEPTH);
    return false;
  }

  if (fSize == 0) {
    fSize = rSize * Function::MAX_FRAME_SIZE;
  }

  if (fSize < MIN_STACK_SIZE || fSize > MAX_STACK_SIZE) {
    std::fprintf(stderr, "GVM::Interpreter::init()\n\tFrame Stack Size %d is not in range %d - %d\n", (int)fSize, MIN_STACK_SIZE, MAX_STACK_SIZE);
    return false;
  }

  size_t returnStackSize = rSize * sizeof(const uint8*);
  size_t frameStackSize  = (fSize + REDZONE_BUFFER*2) * sizeof(sizeof(Interpreter::word));
  size_t sizeStackSize   = rSize * sizeof(uint8);

  size_t totalAllocation = returnStackSize + frameStackSize + sizeStackSize;

  std::fprintf(
    stderr,
    "GVM::Interpreter::init()\n"
    "\tRequire %d bytes for working set\n"
    "\t%d bytes for return stack\n"
    "\t%d bytes for frame stack (includes start and end red zones of %d entries each)\n"
    "\t%d bytes for frame size stack\n",
    (int)totalAllocation,
    (int)returnStackSize,
    (int)frameStackSize,
    (int)REDZONE_BUFFER,
    (int)sizeStackSize
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

  returnStackBase    = returnStack = (const uint8**)readySet;
  returnStackTop     = &returnStackBase[rSize-1];

  frameStackBase     = frameStack = ((Interpreter::word*)(readySet + returnStackSize)) + REDZONE_BUFFER;
  frameStackTop      = &frameStackBase[fSize-1];
  frameSizeStackBase = frameSizeStack = readySet + returnStackSize + frameStackSize;

  std::fprintf(
    stderr,
    "GVM::Interpreter::init()\n"
    "\tReturn Stack   [%p - %p]\n"
    "\tFrame Stack    [%p - %p]\n"
    "\tSize Stack     [%p - %p]\n"
    "\tFunction Table [%p]\n",
    returnStackBase,
    returnStackTop,
    frameStackBase,
    frameStackTop,
    frameSizeStackBase,
    frameSizeStackBase + rSize - 1,
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

bool Interpreter::validateFunctionTable(const Function* table) {

  if (table[0].entryPoint) {
    std::fprintf(stderr, "Function table entry zero must be empty\n");
    return false;
  }

  int id = 1;
  while (table[id].entryPoint) {
    if (id > Function::MAX_ID) {
      std::fprintf(stderr, "GVM::Interpreter::validateFunctionTable()\n\tFunction table too long, exceeded %d entries\n", Function::MAX_ID);
      return false;
    }
    if (table[id].frameSize > Function::MAX_LOCAL_SIZE) {
      std::fprintf(stderr, "GVM::Interpreter::validateFunctionTable()\n\tFunction table entry %d has illegal frame size %d\n", id, (int)table[id].frameSize);
      return false;
    }
    if (table[id].returnSize > Function::MAX_RETURN_SIZE) {
      std::fprintf(stderr, "GVM::Interpreter::validateFunctionTable()\n\tFunction table entry %d has illegal return size %d\n", id, (int)table[id].returnSize);
      return false;
    }
    if (table[id].paramSize > Function::MAX_PARAM_SIZE) {
      std::fprintf(stderr, "GVM::Interpreter::validateFunctionTable()\n\tFunction table entry %d has illegal param size %d\n", id, (int)table[id].paramSize);
      return false;
    }
    if (table[id].localSize > Function::MAX_LOCAL_SIZE) {
      std::fprintf(stderr, "GVM::Interpreter::validateFunctionTable()\n\tFunction table entry %d has illegal local size %d\n", id, (int)table[id].localSize);
      return false;
    }
    if (table[id].frameSize != (table[id].returnSize + table[id].paramSize + table[id].localSize)) {
      std::fprintf(stderr, "GVM::Interpreter::validateFunctionTable()\n\tFunction table entry %d has inconsistent total size %d\n", id, (int)table[id].frameSize);
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
