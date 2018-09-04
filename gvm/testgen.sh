#!/bin/sh
g++ -Wall -W -O3 -m32 -I./ src/interpreter.cpp -S
mv interpreter.s interpreter_x86.s
ppc-amigaos-g++ -Wall -W -O3 -m32 -I./ src/interpreter.cpp -S
mv interpreter.s interpreter_ppc32.s

