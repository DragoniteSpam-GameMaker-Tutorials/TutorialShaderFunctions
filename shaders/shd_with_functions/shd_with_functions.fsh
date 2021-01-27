//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec4 invert_color(vec4 original_color);
void invert_color_by_myself(inout vec4 original_color);

void main()
{
    vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    invert_color_by_myself(color);
    
    
    gl_FragColor = color;
}

vec4 invert_color(vec4 original_color) {
    return vec4(1.0 - original_color.r, 1.0 - original_color.g, 1.0 - original_color.b, original_color.a);
}

void invert_color_by_myself(inout vec4 original_color) {
    original_color.r = 1.0 - original_color.r;
    original_color.g = 1.0 - original_color.g;
    original_color.b = 1.0 - original_color.b;
}