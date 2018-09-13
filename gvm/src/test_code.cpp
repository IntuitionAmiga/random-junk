#include <cstdio>
#include <cmath>
#include <cfloat>
#include "include/stub_types.hpp"
#include "include/opcode.hpp"
#include "include/interpreter.hpp"
#include "include/opcode_macros.hpp"
using namespace GVM;

GVM_CODE(test) {
  nop
  bras    (-1)
  bra     (-2)
  bcall   (-3)
  call    (-4)
  call_r  (r0)
  call_i  (r1, -5)
  call_h  (-6)
  ret
  dbnz    (r15, -7)
  ldbnn   (r0, 2, r0, -8)
  bez_r   (r0, -9)
  bez_i   (r0, 1, -10)
  bnz_r   (r0, -11)
  bnz_i   (r0, 1, -12)
  beq_rr  (r0, r1, -13)
  beq_ri  (r0, r1, 1, -14)
  beq_ii (r0, r1, 1, 2, -15)
};
