#version 330 core

uniform mat4 u_m;
uniform mat4 u_v;
uniform mat4 u_p;

layout (location = 0) in vec3 a_pos;
layout (location = 1) in vec3 a_nrm;
layout (location = 2) in vec2 a_tc;

out vec2 v_texcoord;


void main(void) {
    v_texcoord = a_tc;

    gl_Position = u_p * u_v * u_m * vec4(a_pos, 1);
}