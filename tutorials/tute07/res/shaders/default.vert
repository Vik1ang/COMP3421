#version 330 core

uniform mat4 p;
uniform mat4 v;
uniform mat4 m;

uniform vec3 sun;

layout (location = 0) in vec3 pos;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 tc_in;

out vs_out_t {
    vec3 v_normal;
    vec3 v_light_dir;
} vs_out;

out vec2 tc;

void main(void) {
    mat4 mv = v * m;

    vs_out.v_normal = mat3(mv) * normal;
    vs_out.v_light_dir = mat3(v) * sun;

    tc = tc_in;

    gl_Position = p * mv * vec4(pos, 1);
}