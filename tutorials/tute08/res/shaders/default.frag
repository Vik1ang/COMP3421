#version 330 core

// Inputs
in vec3 v_pos;
in vec3 v_normal;
in vec2 v_texco;

// Maps
uniform sampler2D u_diff_map;
uniform sampler2D u_spec_map;

// Lighting parameters
uniform vec3 u_light_pos;
uniform vec3 u_light_color;
uniform float u_light_attenuation;
uniform mat4 v;

// Material parameters
uniform vec3 u_diffuse;
uniform vec3 u_specular;
uniform vec3 u_emissive;
uniform float u_shininess;

// Outputs
out vec4 color;

// Convert an SRGB color to linear space
vec3 srgb_to_linear(vec3 color) {
    return pow(color, vec3(2.2));
}

// Convert a linear color to SRGB space
vec3 linear_to_srgb(vec3 color) {
    return pow(color, vec3(1.0 / 2.2));
}

void main() {
    vec3 normal = normalize(v_normal);
    vec3 view_light_pos = (v * vec4(u_light_pos, 1)).xyz;
    vec3 light_dir = normalize(view_light_pos - v_pos);
    float light_dist = length(view_light_pos - v_pos);
    vec3 view_dir = normalize(-v_pos);
    vec3 reflection = reflect(-light_dir, normal);
    vec3 halfway = normalize(light_dir + view_dir);

    vec3 diff_col = srgb_to_linear(u_diffuse * texture(u_diff_map, v_texco).rgb);
    vec3 spec_col = srgb_to_linear(u_specular * texture(u_spec_map, v_texco).rgb);
    vec3 emit_col = srgb_to_linear(u_emissive);
    vec3 light_col = srgb_to_linear(u_light_color);

    vec3 diffuse = diff_col * max(dot(normal, light_dir), 0) * light_col;

    vec3 specular;
    bool use_blinn = true;
    if (use_blinn) {
        specular = spec_col * pow(max(dot(normal, halfway), 0), u_shininess) * light_col;
    } else {
        specular = spec_col * pow(max(dot(view_dir, reflection), 0), u_shininess) * light_col;
    }

    vec3 color_linear = vec3(0, 0, 0);

    // calculate point light contribution
    float attenuation = 1.0 / (1.0 + u_light_attenuation * light_dist);
    color_linear += (diffuse + specular) * attenuation;

    // calculate emissive contribution
    color_linear += emit_col;

    // linear -> sRGB conversion
    color = vec4(linear_to_srgb(color_linear), 1.0);
}