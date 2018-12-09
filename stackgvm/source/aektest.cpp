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
    4,       // 512 gi_image_size
    64,      // gi_max_rays
    99.0f,   // gf_dof_scale
    3.5f,    // gf_rgb_scale
    0.002f,  // gf_camera_scale
    1e9f,    // gf_distamce_max
    0.01f,   // gf_distance_min
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

typedef enum {
    //
    i_render_one               = 0,
    f_render_camera_scale      = 1,
    v_render_camera_forward    = 2,
    v_render_camera_right      = 5,
    v_render_camera_up         = 8,
    v_render_eye_offset        = 11,
    i_render_pixel_y_pos       = 14,
    i_render_pixel_x_pos       = 15,
    m_render_temp              = 16,
    i_render_image_size        = 17
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
    vcross_ill  (gv_normal_up,          v_render_camera_forward,    v_render_camera_up)
    vnorm_ll    (v_render_camera_up,    v_render_camera_up)
    vfmul_lil   (v_render_camera_up,    gf_camera_scale,            v_render_camera_up)

/*
    vec3 camera_right = vec3_scale( // Unit right
        vec3_normalize(
            vec3_cross(
                camera_forward,
                camera_up
            )
        ),
        0.002
    ),
*/
    vcross_lll  (v_render_camera_forward,   v_render_camera_up,     v_render_camera_right)
    vnorm_ll    (v_render_camera_right,     v_render_camera_right)
    vfmul_lil   (v_render_camera_right,     gf_camera_scale,        v_render_camera_right)

/*
    vec3 eye_offset = vec3_add( // Offset frm eye to coner of focal plane
        vec3_scale(
            vec3_add(
                camera_up,
                camera_right
            ),
            -(image_size >> 1)
        ),
        camera_forward
    )
 */
    load_sl     (1, i_render_one)
    lsl_lll     (i_render_image_size,   i_render_one,               m_render_temp)
    neg_ll      (m_render_temp,         m_render_temp)
    itof_ll     (m_render_temp,         m_render_temp)
    vadd_lll    (v_render_camera_up,    v_render_camera_right,      v_render_eye_offset)
    vfmul_lil   (v_render_eye_offset,   m_render_temp,              v_render_eye_offset)
    vadd_lll    (v_render_eye_offset,   v_render_camera_forward,    v_render_eye_offset)

/*
    for (int32 y = image_size; y--;) {
*/
    sub_lll     (i_render_image_size, i_render_one, i_render_pixel_y_pos)

/*
        for (int32 x = image_size; x--;) {
*/
    sub_lll     (i_render_image_size, i_render_one, i_render_pixel_x_pos)

/*
        } // x loop
*/
    dbnz_l      (i_render_pixel_x_pos, 0)

/*
    } // y loop
*/
    dbnz_l      (i_render_pixel_y_pos, -8)
    ret
};

GFUNC(trace) {
    ret
};

GFUNC(sample) {
    ret
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

BEGIN_GDATA_TABLE(globalData)
    globals
END_GDATA_TABLE

BEGIN_GHOST_TABLE(hostFunctionTable)
    hostPrintHeader,
    hostPrintRGB
END_GHOST_TABLE

BEGIN_GFUNC_TABLE(functionTable)
    { _gvm_render, 17,  0,  0, 17 },
    { _gvm_trace,  0,   0,  0,  0 },
    { _gvm_sample, 0,   0,  0,  0 }
END_GFUNC_TABLE


int main() {
    Interpreter::init(100, 0, functionTable, hostFunctionTable, globalData);
    //Result result =
    Interpreter::invoke(render);
    Interpreter::done();
    return 0;
}
