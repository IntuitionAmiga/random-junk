#!/bin/sh
g++ -Wall -W -O3 -m32 -march=native -mfpmath=sse -ftree-vectorize -I./ src/interpreter.cpp -S
cp interpreter_x86.s interpreter_x86.bak.s
mv interpreter.s interpreter_x86.s
ppc-amigaos-g++ -Wall -W -O3 -m32 -I./ src/interpreter.cpp -S
cp interpreter_ppc32.s interpreter_ppc32.bak.s
mv interpreter.s interpreter_ppc32.s
g++ -Wall -W -O3 -m32 -march=native test.cpp -o test

g++ -Wall -W -O3 -m32 -march=native -mfpmath=sse -ftree-vectorize -I./ src/test_code.cpp -S
