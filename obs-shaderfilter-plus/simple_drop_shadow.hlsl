// Basically a stripped-down version of mrt-drop-shadow.hlsl by Alex Anderson
// Original at https://gist.github.com/Andersama/133d87cb1584d4b5d0ba4d367468dd2b

#pragma shaderfilter set shadow_color__description Shadow Color
#pragma shaderfilter set shadow_color__default 000000FF
uniform float4 shadow_color;

#pragma shaderfilter set shadow_opacity__description Shadow Opacity (1.0 = 100% opaque)
#pragma shaderfilter set shadow_opacity__default 0.5
#pragma shaderfilter set shadow_opacity__min 0.00
#pragma shaderfilter set shadow_opacity__max 1.0
#pragma shaderfilter set shadow_opacity__step 0.01
#pragma shaderfilter set shadow_opacity__slider true
uniform float shadow_opacity;

#pragma shaderfilter set shadow_offset_x__description Shadow offset X (1.0 = 100% image width)
#pragma shaderfilter set shadow_offset_x__default 0.01
#pragma shaderfilter set shadow_offset_x__min 0.00
#pragma shaderfilter set shadow_offset_x__max 0.1
#pragma shaderfilter set shadow_offset_x__step 0.001
#pragma shaderfilter set shadow_offset_x__slider true
uniform float shadow_offset_x;

#pragma shaderfilter set shadow_offset_y__description Shadow offset X (1.0 = 100% image height)
#pragma shaderfilter set shadow_offset_y__default 0.01
#pragma shaderfilter set shadow_offset_y__min 0.00
#pragma shaderfilter set shadow_offset_y__max 0.1
#pragma shaderfilter set shadow_offset_y__step 0.001
#pragma shaderfilter set shadow_offset_y__slider true
uniform float shadow_offset_y;

#pragma shaderfilter set is_alpha_premultiplied__description Is alpha premultiplied?
uniform bool is_alpha_premultiplied;

float4 render(float2 uv)
{
    // Base RGBA of pixel to be modified
    float4 target_pixel = image.Sample(builtin_texture_sampler, uv);
    // Position of the pixel to reference
    float2 reference_uv = float2(uv.x - shadow_offset_x, uv.y - shadow_offset_y);
    // Pixel that casts the shadow
    float4 reference_pixel = image.Sample(builtin_texture_sampler, reference_uv);
    // Reference pixel's alpha influences the alpha of the shadow
    float shadow_amount = reference_pixel.a * shadow_color.a;
    // Shadow's color + the resulting alpha
    float4 shadow_pixel_data = float4(shadow_color.rgb, shadow_amount * shadow_opacity);

    // More or less "Use base color/alpha and only fill in the shadow as needed"
    return shadow_pixel_data * (1-target_pixel.a) + target_pixel * (is_alpha_premultiplied * 1 + !is_alpha_premultiplied * target_pixel.a);
}