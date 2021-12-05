#version 330 core

uniform sampler2D u_diff_map;

in vec2 v_texcoord;

out vec4 f_color;

void main(void) {
    f_color = texture(u_diff_map, v_texcoord);
}