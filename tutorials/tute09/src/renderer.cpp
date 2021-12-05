#include <tute09/renderer.hpp>

#include <stack>

#include <chicken3421/chicken3421.hpp>

const char *STATIC_MESH_VERT_PATH = "res/shaders/static_mesh.vert";
const char *STATIC_MESH_FRAG_PATH = "res/shaders/static_mesh.frag";
const char *REFLECTIVE_VERT_PATH = "res/shaders/reflective.vert";
const char *REFLECTIVE_FRAG_PATH = "res/shaders/reflective.frag";
const char *PORTAL_VERT_PATH = "res/shaders/portal.vert";
const char *PORTAL_FRAG_PATH = "res/shaders/portal.frag";

namespace {
    int locate(const std::string &name) {
        GLint program;
        glGetIntegerv(GL_CURRENT_PROGRAM, &program);
        int loc = glGetUniformLocation(program, name.c_str());
        chicken3421::expect(loc != -1, "uniform not found: " + name);
        return loc;
    }

    void set_uniform(const std::string &name, float value) {
        glUniform1f(locate(name), value);
    }

    void set_uniform(const std::string &name, int value) {
        glUniform1i(locate(name), value);
    }

    void set_uniform(const std::string &name, glm::vec4 value) {
        glUniform4fv(locate(name), 1, glm::value_ptr(value));
    }

    void set_uniform(const std::string &name, const glm::mat4 &value) {
        glUniformMatrix4fv(locate(name), 1, GL_FALSE, glm::value_ptr(value));
    }

    GLuint load_program(const std::string &vs_path, const std::string &fs_path) {
        GLuint vs = chicken3421::make_shader(vs_path, GL_VERTEX_SHADER);
        GLuint fs = chicken3421::make_shader(fs_path, GL_FRAGMENT_SHADER);
        GLuint handle = chicken3421::make_program(vs, fs);
        chicken3421::delete_shader(vs);
        chicken3421::delete_shader(fs);

        return handle;
    }
}

renderer_t make_renderer(const glm::mat4 &projection) {
    renderer_t renderer {};

    renderer.projection = projection;
    renderer.prog_static_mesh = load_program(
            STATIC_MESH_VERT_PATH, STATIC_MESH_FRAG_PATH);
    renderer.prog_reflective = load_program(
            REFLECTIVE_VERT_PATH, REFLECTIVE_FRAG_PATH);
    renderer.prog_portal = load_program(
            PORTAL_VERT_PATH, PORTAL_FRAG_PATH);

    return renderer;
}

void draw_model(const renderer_t &renderer, const glm::mat4 &mv, const model_t &m) {
    glUseProgram(renderer.prog_static_mesh);

    set_uniform("u_model_view", mv);
    set_uniform("u_projection", renderer.projection);
    set_uniform("u_clip_plane", renderer.portal_clip_plane);

    for (const mesh_t &mesh: m.meshes) {
        if (mesh.material_id != -1) {
            const material_t &mtl = m.materials[mesh.material_id];

            glBindTexture(GL_TEXTURE_2D, mtl.texture);
            set_uniform("u_tex_factor", mtl.texture == 0 ? 0.f : 1.f);
            set_uniform("u_color", mtl.color);
        } else {
            // default material
            set_uniform("u_tex_factor", 0.f);
            set_uniform("u_color", glm::vec4(1, 1, 1, 1));
        }

        glBindVertexArray(mesh.vao);
        glBindBuffer(GL_ARRAY_BUFFER, mesh.vbo);
        glDrawArrays(GL_TRIANGLES, 0, mesh.nverts);

        glBindVertexArray(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindTexture(GL_TEXTURE_2D, 0);
    }
}

void draw_portal(const renderer_t &renderer, const glm::mat4 &mv, const model_t &m, GLuint texture) {
    glUseProgram(renderer.prog_portal);

    glBindTexture(GL_TEXTURE_2D, texture);
    set_uniform("u_model_view", mv);
    set_uniform("u_projection", renderer.projection);

    for (const mesh_t &mesh: m.meshes) {
        glBindVertexArray(mesh.vao);
        glBindBuffer(GL_ARRAY_BUFFER, mesh.vbo);
        glDrawArrays(GL_TRIANGLES, 0, mesh.nverts);

        glBindVertexArray(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindTexture(GL_TEXTURE_2D, 0);
    }
}

void draw_reflective(const renderer_t &renderer, const glm::mat4 &mv, const model_t &m, GLuint texture) {
    glUseProgram(renderer.prog_reflective);

    glBindTexture(GL_TEXTURE_CUBE_MAP, texture);
    set_uniform("u_model_view", mv);
    set_uniform("u_view", renderer.view);
    set_uniform("u_projection", renderer.projection);

    for (const mesh_t &mesh: m.meshes) {
        glBindVertexArray(mesh.vao);
        glBindBuffer(GL_ARRAY_BUFFER, mesh.vbo);
        glDrawArrays(GL_TRIANGLES, 0, mesh.nverts);

        glBindVertexArray(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
    }

    glBindTexture(GL_TEXTURE_CUBE_MAP, 0);
}

void render(renderer_t &renderer, const camera_t &cam, const node_t &scene) {
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glClearColor(0.0f, 0.2f, 0.4f, 1.0f);

    renderer.view = get_view(cam);

    std::stack<std::pair<const node_t &, glm::mat4>> renderables{{{ scene, scene.transform }}};
    while (!renderables.empty()) {
        const auto &[node, parent_tf] = renderables.top();  // this is called a structured binding
        renderables.pop();

        glm::mat4 xform = parent_tf * node.transform;

        switch (node.kind) {
            case node_t::STATIC_MESH:
                draw_model(renderer, renderer.view * xform, node.obj);
                break;
            case node_t::REFLECTIVE:
                draw_reflective(renderer, renderer.view * xform, node.obj, node.texture);
                break;
            case node_t::PORTAL:
                draw_portal(renderer, renderer.view * xform, node.obj, node.texture);
                break;
        }

        for (const node_t &c: node.children) {
            renderables.push({ c, xform });
        }
    }
}