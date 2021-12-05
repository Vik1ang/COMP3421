#version 330 core

uniform sampler2D tex;

in vec2 tc;

in vs_out_t {
    vec3 v_normal;
    vec3 v_light_dir;
} fs_in;

uniform vec3 u_light_ambient = vec3(0.25, 0.25, 0.25);
uniform vec3 u_light_diffuse = vec3(1, 1, 1);

out vec4 color;

void main() {
    vec3 n_normal = normalize(fs_in.v_normal);
    vec3 n_light_dir = normalize(fs_in.v_light_dir);

    vec4 tex_col = texture(tex, tc);
    float ndl = max(dot(n_normal, n_light_dir), 0);

    color = vec4(0, 0, 0, tex_col.a);

    color.rgb += u_light_ambient * tex_col.rgb;
    color.rgb += u_light_diffuse * tex_col.rgb * ndl;
}