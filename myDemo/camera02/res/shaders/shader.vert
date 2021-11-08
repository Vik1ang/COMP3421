#version 330 core

layout (location = 0) in vec4 aPos;
layout (location = 1) in vec2 aTexCoord;

out vec2 vTexCoord;

uniform mat4 uMVP;

void main() {
    vTexCoord = aTexCoord;
    gl_Position = uMVP * aPos;
}
