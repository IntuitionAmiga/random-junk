#ifndef _OS25D_TYPES_HPP_
  #define _OS25D_TYPES_HPP_

  #ifdef __LP64__
    #define X_PTRSIZE XA_PTRSIZE64
    typedef signed char int8;
    typedef signed short int int16;
    typedef signed int int32;
    typedef signed long int int64;
    typedef unsigned char uint8;
    typedef unsigned short int uint16;
    typedef unsigned int uint32;
    typedef unsigned long int uint64;
    typedef float float32;
    typedef double float64;

    // Formatting Templates
    #define FS16 "hd"
    #define FU16 "hu"
    #define FS32 "d"
    #define FU32 "u"
    #define FS64 "ld"
    #define FU64 "lu"
  #else
    #define X_PTRSIZE XA_PTRSIZE32
    typedef signed char int8;
    typedef signed short int int16;
    typedef signed long int int32;
    typedef signed long long int int64;
    typedef unsigned char uint8;
    typedef unsigned short int uint16;
    typedef unsigned long int uint32;
    typedef unsigned long long int uint64;
    typedef float float32;
    typedef double float64;

    // Formatting Templates
    #define FS16 "hd"
    #define FU16 "hu"
    #define FS32 "ld"
    #define FU32 "lu"
    #define FS64 "lld"
    #define FU64 "llu"
  #endif

  struct  vec3f { float32 x, y, z; };

#endif
