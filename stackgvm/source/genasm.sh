#!/bin/sh
g++ -O3 -Wall -W -m32 -march=native -mfpmath=sse -fomit-frame-pointer -fno-exceptions -fexpensive-optimizations -D_GVM_HOST_OS=_GVM_HOST_LINUX_INTEL_32 -S gvm_run.cpp -o bin/gvm_run_x86.asm
