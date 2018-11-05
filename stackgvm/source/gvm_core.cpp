/**
 * TYTLGVM
 *
 * Twenty Years Too Late Game Virtual Machine
 */

#include "include/gvm_core.hpp"

using namespace GVM;

Interpreter::word* Interpreter::frameStack     = 0;
Interpreter::word* Interpreter::indirect[3]    = { 0, 0, 0 };
uint8**            Interpreter::returnStack    = 0;
uint8*             Interpreter::programCounter = 0;
