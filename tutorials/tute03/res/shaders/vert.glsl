#version 330 core

uniform mat4 mvp;

layout(location = 0) in vec4 pos;
layout(location = 1) in vec4 color_in;

out vec4 color;

void main() {
    color = color_in;

    gl_Position = mvp * pos;
}
