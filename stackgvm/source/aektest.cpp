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
    gf_dof_bias            = 33,
    gf_rgb_scale           = 34,
    gf_camera_scale        = 35,
    gf_distance_max        = 36,
    gf_distance_min        = 37,
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
#ifdef _GVM_DEBUGGING_
    4,       // gi_image_size
    4,       // gi_max_rays
#else
    512,     // gi_image_size
    64,      // gi_max_rays
#endif
    99.0f,   // gf_dof_scale
    0.5f,    // gf_dof_bias
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
    //std::printf("P6 %d %d 255 ", (int)frame[0].i, (int)frame[0].i);
    std::printf("OUTPUT PPM HEADER {P6 %d %d 255}\n", (int)frame[0].i, (int)frame[0].i);
    return SUCCESS;
}

Result hostPrintRGB(Scalar* frame) {
    //std::printf("%c%c%c", (int)frame[0].f, (int)frame[1].f, (int)frame[2].f);
    std::printf("OUTPUT PPM PIXEL {%d, %d, %d}\n", (int)frame[0].f, (int)frame[1].f, (int)frame[2].f);
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
    i_render_image_size        = 0,
    f_render_camera_scale      = 1,
    v_render_camera_forward    = 2,
    v_render_camera_right      = 5,
    v_render_camera_up         = 8,
    v_render_eye_offset        = 11,
    i_render_pixel_y_pos       = 14,
    i_render_pixel_x_pos       = 15,
    i_render_ray_count         = 16,
    m_render_temp_0            = 17,
    m_render_temp_1            = 18,

    v_render_temp_0            = 19,
    v_render_temp_1            = 22,
    v_render_delta             = 25,

    m_next_func_param_space    = 32,
    v_pixel_accumulator        = 32, // Crafty, Maybe.
} RenderLocalsEnum;

GFUNC(render) {
//  Instruction (Arguments... )                                                                     Size [breakdown]

    addr_d      (g_globals, 0)                                                                      // 3 [1, 2]


//  int image_size = 512;
//  printf("P6 %d %d 255 ", image_size, image_size);

    copy_il     (0, gi_image_size,    i_render_image_size)                                          // 3 [1, 1, 1]
    copy_ll     (i_render_image_size, m_next_func_param_space)                                      // 3 [1, 1, 1]
    hcall       (print_header)                                                                      // 3 [1, 2]


//  vec3 camera_forward = vec3_normalize( // Unit forwards
//      camera_dir
//  ),

    vnorm_il    (gv_camera_dir, v_render_camera_forward)                                            // 3 [1, 1, 1]


//  vec3 camera_up = vec3_scale( // Unit up - Z is up in this system
//      vec3_normalize(
//          vec3_cross(
//              normal_up,
//              camera_forward
//          )
//      ),
//      0.002
//  ),

    vcross_ill  (gv_normal_up,          v_render_camera_forward,    v_render_camera_up)             // 4 [1, 1, 1, 1]
    vnorm_ll    (v_render_camera_up,    v_render_camera_up)                                         // 3 [1, 1, 1]
    vfmul_lil   (v_render_camera_up,    gf_camera_scale,            v_render_camera_up)             // 4 [1, 1, 1, 1]

//  vec3 camera_right = vec3_scale( // Unit right
//      vec3_normalize(
//          vec3_cross(
//              camera_forward,
//              camera_up
//          )
//      ),
//      0.002
//  ),

    vcross_lll  (v_render_camera_forward,   v_render_camera_up,     v_render_camera_right)          // 4 [1, 1, 1, 1]
    vnorm_ll    (v_render_camera_right,     v_render_camera_right)                                  // 3 [1, 1, 1]
    vfmul_lil   (v_render_camera_right,     gf_camera_scale,        v_render_camera_right)          // 4 [1, 1, 1, 1]


//  vec3 eye_offset = vec3_add( // Offset from eye to coner of focal plane
//      vec3_scale(
//          vec3_add(
//              camera_up,
//              camera_right
//          ),
//          -(image_size >> 1)
//      ),
//      camera_forward
//  )

    // (float) -(image_size >> 1)
    load_sl     (1, m_render_temp_1)                                                                // 3 [1, 1, 1]
    lsl_lll     (i_render_image_size,   m_render_temp_1,            m_render_temp_0)                // 4 [1, 1, 1, 1]
    neg_ll      (m_render_temp_0,       m_render_temp_0)                                            // 3 [1, 1, 1]
    itof_ll     (m_render_temp_0,       m_render_temp_0)                                            // 3 [1, 1, 1]

    vadd_lll    (v_render_camera_up,    v_render_camera_right,      v_render_eye_offset)            // 4 [1, 1, 1, 1]
    vfmul_lil   (v_render_eye_offset,   m_render_temp_0,            v_render_eye_offset)            // 4 [1, 1, 1, 1]
    vadd_lll    (v_render_eye_offset,   v_render_camera_forward,    v_render_eye_offset)            // 4 [1, 1, 1, 1]
    vsub_lll    (i_render_image_size,   m_render_temp_1,            i_render_image_size)            // 4 [1, 1, 1, 1]


//  for (int32 y = image_size; y--;) {
    copy_ll     (i_render_image_size,   i_render_pixel_y_pos)                                       // 3 [1, 1, 1]


//      for (int32 x = image_size; x--;) {

    copy_ll     (i_render_image_size,   i_render_pixel_x_pos)                                       // 3 [1, 1, 1]


//          vec3 pixel(13.0, 13.0, 13.0);

    vcopy_il    (gv_const_ambient_rgb,  v_pixel_accumulator)                                        // 3 [1, 1, 1]

//          for (int32 ray_count = 64; ray_count--;) {

    copy_il     (0, gi_max_rays, i_render_ray_count)                                                // 3 [1, 1, 1]

//          // Random delta to be added for depth of field effects
//              vec3 delta = vec3_add(
//                  vec3_scale(camera_up,    (frand() - 0.5) * 99.0),
//                  vec3_scale(camera_right, (frand() - 0.5) * 99.0)
//              );

    // vec3_scale(camera_up,    (frand() - 0.5) * 99.0)                                             // 14
    frnd_l      (m_render_temp_0)                                                                   // 2 [1, 1]
    fsub_lil    (m_render_temp_0,       gf_dof_bias,                m_render_temp_0)                // 4 [1, 1, 1, 1]
    fmul_ill    (gf_dof_scale,          m_render_temp_0,            m_render_temp_0)                // 4 [1, 1, 1, 1]
    vfmul_lll   (v_render_camera_up,    m_render_temp_0,            v_render_temp_0)                // 4 [1, 1, 1, 1]

    // vec3_scale(camera_right, (frand() - 0.5) * 99.0)                                             // 14
    frnd_l      (m_render_temp_0)                                                                   // 2 [1, 1]
    fsub_lil    (m_render_temp_0,       gf_dof_bias,                m_render_temp_0)                // 4 [1, 1, 1, 1]
    fmul_ill    (gf_dof_scale,          m_render_temp_0,            m_render_temp_0)                // 4 [1, 1, 1, 1]
    vfmul_lll   (v_render_camera_right, m_render_temp_0,            v_render_temp_1)                // 4 [1, 1, 1, 1]

    vadd_lll    (v_render_temp_0,       v_render_temp_1,            v_render_delta)                 // 4 [1, 1, 1, 1]

//          } // ray loop

    dbnz_l      (i_render_ray_count, -14-14-4)                                                        // 4 [1, 1, 2]

//          printf("%c%c%c", (int32)pixel.x, (int32)pixel.y, (int32)pixel.z);

    hcall       (print_rgb)                                                                         // 3 [1, 2]

//      } // x loop

    dbnn_l      (i_render_pixel_x_pos, -3-3-4-3-14-14-4)                                            // 4 [1, 1, 2]


//  } // y loop

    dbnn_l      (i_render_pixel_y_pos, -4-3-3-3-4-3-14-14-4)                                        // 4 [1, 1, 2]
    ret                                                                                             // 1
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
    { _gvm_render, 32,  0,  0, 32 },
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
