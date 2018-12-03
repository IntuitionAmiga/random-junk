/**
 * TOYTL - GVM
 *
 * Twenty Odd Years Too Late Game Virtual Machine
 */

#include <cstdio>
#include "include/gvm_core.hpp"
#include "include/gvm_codemacros.hpp"

using namespace GVM;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Data
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

enum {
    v_camera_dir  = 0,
    v_focal_point,
    v_normal_up,
    v_sky_rgb,
    v_floor_red_rgb,
    v_floor_white_rgb,
    v_const_ambient_rgb,
};

#define vec3(x, y, z) Scalar(x), Scalar(y), Scalar(z)
Scalar vectors[] = {
    vec3(-6.0f, -16.0f, 0.0f), // camera_dir
    vec3(17.0f, 16.0f, 8.0f),  // focal_point
    vec3(0.0f, 0.0f, 1.0f),    // normal_up
    vec3(0.7f, 0.6f, 1.0f),    // sky_rgb
    vec3(3.0f, 1.0f, 1.0f),    // floor_red_rgb,
    vec3(3.0f, 3.0f, 3.0f),    // floor_white_rgb
    vec3(13.0f, 13.0f, 13.0f), // const_ambient_rgb
};

Scalar bitmap[] = {
  247570, // 0111100011100010010
  280596, // 1000100100000010100
  280600, // 1000100100000011000
  249748, // 0111100111110010100
  18578,  // 0000100100010010010
  18577,  // 0000100100010010001
  231184, // 0111000011100010000
  16,     // 0000000000000010000
  16      // 0000000000000010000
};

enum {
    i_image_size = 0,
    i_max_rays,
    f_dof_scale,
    f_rgb_scale,
    f_camera_scale,
    f_distance_max,
    f_distance_min,
};

Scalar misc[] = {
    512,
    64,
    99.0f,
    3.5f,
    0.002f,
    1e9f,
    0.01f,
};

enum {
    g_vectors = 1,
    g_bitmap,
    g_misc
};

Scalar* globalData[] = {
    0,
    vectors,
    bitmap,
    misc,
    0
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Host Functions
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

enum {
    print_header = 1,
    print_rgb,
};

Result hostPrintHeader(Scalar* frame) {
    std::printf("P6 %d %d 255 ", frame[0].i, frame[0].i);
    return SUCCESS;
}

Result hostPrintRGB(Scalar* frame) {
    printf("%c%c%c", (int32)frame[0].f, (int32)frame[1].f, (int32)frame[2].f);
    return SUCCESS;
}

HostCall hostFunctionTable[] = {
    0,                           // Index 0 must be null
    hostPrintHeader,
    hostPrintRGB,
    0                            // Null terminated set
};


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Functions
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

enum {
    render = 1,
    trace,
    sample
};

GFUNC(render) {
    ret
};

GFUNC(trace) {
    ret
};

GFUNC(sample) {
    ret
};


FuncInfo functionTable[] = {
    { 0, 0, 0, 0, 0 },           // index 0 must be null
    { _gvm_render, 0, 0, 0, 0 },
    { _gvm_trace, 0, 0, 0, 0 },
    { _gvm_sample, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0 }            // Null termimated set
};


int main() {
    Interpreter::init(100, 0, functionTable, hostFunctionTable, globalData);
    Result result = Interpreter::invoke(render);
    Interpreter::done();
    return 0;
}
