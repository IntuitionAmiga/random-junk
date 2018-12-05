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

typedef enum {
    g_globals              = 1, // Defines the actual symbol, the following are offsets into this set

    gv_camera_dir          = 0,
    gv_focal_point         = 3,
    gv_normal_up           = 6,
    gv_sky_rgb             = 9,
    gv_floor_red_rgb       = 12,
    gv_floor_white_rgb     = 15,
    gv_const_ambient_rgb   = 18,
    gi_bitmap              = 21,
    gi_image_size          = 30,
    gi_max_rays            = 31,
    gf_dof_scale           = 32,
    gf_rgb_scale           = 33,
    gf_camera_scale        = 34,
    gf_distance_max        = 35,
    gf_distance_min        = 36,
} GlobalEnum;

#define vec3(x, y, z) Scalar(x), Scalar(y), Scalar(z)
Scalar globals[] = {

    // Vectors
    vec3(-6.0f, -16.0f, 0.0f), // gv_camera_dir
    vec3(17.0f, 16.0f, 8.0f),  // gv_focal_point
    vec3(0.0f, 0.0f, 1.0f),    // gv_normal_up
    vec3(0.7f, 0.6f, 1.0f),    // gv_sky_rgb
    vec3(3.0f, 1.0f, 1.0f),    // gv_floor_red_rgb,
    vec3(3.0f, 3.0f, 3.0f),    // gv)floor_white_rgb
    vec3(13.0f, 13.0f, 13.0f), // gv_const_ambient_rgb

    // Bitmap
    247570, // 0111100011100010010 gv_bitmap[0]
    280596, // 1000100100000010100
    280600, // 1000100100000011000
    249748, // 0111100111110010100
    18578,  // 0000100100010010010
    18577,  // 0000100100010010001
    231184, // 0111000011100010000
    16,     // 0000000000000010000
    16,     // 0000000000000010000

    // Other Scalars
    512,    // gi_image_size
    64,     // gi_max_rays
    99.0f,  // gf_dof_scale
    3.5f,   // gf_rgb_scale
    0.002f, // gf_camera_scale
    1e9f,   // gf_distamce_max
    0.01f,  // gf_distance_min
};

Scalar* globalData[] = {
    0,
    globals,
    0
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Host Functions
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

typedef enum {
    print_header = 1,
    print_rgb,
} HostFunctionEnum;

Result hostPrintHeader(Scalar* frame) {
    std::printf("P6 %d %d 255 ", (int)frame[0].i, (int)frame[0].i);
    return SUCCESS;
}

Result hostPrintRGB(Scalar* frame) {
    printf("%c%c%c", (int)frame[0].f, (int)frame[1].f, (int)frame[2].f);
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

typedef enum {
    render = 1,
    trace,
    sample
} FunctionEnum;

/**
 * return -
 * params -
 * locals                        Size Offs
 *      float camera_scale       1       0
 *      vec3  camera_forward     3       1
 *      vec3  camera_right       3       4
 *      vec3  camera_up          3       7
 *      int   image_size         1      10
 */

typedef enum {
    //
    f_render_camera_scale      = 0,
    v_render_camera_forward    = 1,
    v_render_camera_right      = 4,
    v_render_camera_up         = 7,
    i_render_image_size        = 10
} RenderLocalsEnum;

GFUNC(render) {
    addr_d      (g_globals, 0)

/*
    int image_size = 512;
    printf("P6 %d %d 255 ", image_size, image_size);
*/
    copy_il     (0, gi_image_size, i_render_image_size)
    hcall       (print_header)
/*
    vec3 camera_forward = vec3_normalize( // Unit forwards
        camera_dir
    ),
*/

    vnorm_il    (gv_camera_dir, v_render_camera_forward)

/*
    vec3 camera_up = vec3_scale( // Unit up - Z is up in this system
        vec3_normalize(
            vec3_cross(
                normal_up,
                camera_forward
            )
        ),
        0.002
    ),
 */
    vcross_ill  (gv_normal_up, v_render_camera_forward, v_render_camera_up)
    vnorm_ll    (v_render_camera_up, v_render_camera_up)
    vfmul_lil   (v_render_camera_up, gf_camera_scale, v_render_camera_up)

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
    { _gvm_render, 10, 0, 0, 10 },
    { _gvm_trace, 0, 0, 0, 0 },
    { _gvm_sample, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0 }            // Null termimated set
};


int main() {
    Interpreter::init(100, 0, functionTable, hostFunctionTable, globalData);
    //Result result =
    Interpreter::invoke(render);
    Interpreter::done();
    return 0;
}
