# TOYTL StackGVM

A 32-bit pure VM intended for use within the TOYTL Engine. This provides support for 32-bit integer, floating point and vector operations where a vector is defined as a triplet of 3 floating point values.

The implementation does not use a register model, nor a traditional stack model. Instead, stack frames are used that are accessible by index positions relative to the current stack frame address.

