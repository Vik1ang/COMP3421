#version 330 core

in vec2 vTexCoord;

uniform sampler2D uTex;

out vec4 fFragColor;

void main() {
    fFragColor = texture(uTex, vTexCoord);
}
