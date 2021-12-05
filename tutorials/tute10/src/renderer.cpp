#include <tute10/renderer.hpp>

#include <stack>

#include <chicken3421/chicken3421.hpp>

namespace {
    const char *MODEL_VERT_PATH = "res/shaders/model.vert";
    const char *MODEL_FRAG_PATH = "res/shaders/model.frag";

    const char *SKYBOX_VERT_PATH = "res/shaders/skybox.vert";
    const char *SKYBOX_FRAG_PATH = "res/shaders/skybox.frag";

    const char *BW_VERT_PATH = "res/shaders/bw.vert";
    const char *BW_FRAG_PATH = "res/shaders/bw.frag";

    GLuint load_program(const std::string &vs_path, const std::string &fs_path) {
        using namespace chicken3421;
        GLuint vs = make_shader(vs_path, GL_VERTEX_SHADER), fs = make_shader(fs_path, GL_FRAGMENT_SHADER);
        GLuint prog = make_program(vs, fs);
        delete_shader(vs), delete_shader(fs);
        return prog;
    }
}


renderer_t make_renderer(const glm::mat4 &projection) {
    // set once, and never again because YOLO
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    GLuint prog_skybox = load_program(SKYBOX_VERT_PATH, SKYBOX_FRAG_PATH);
    GLuint prog_model = load_program(MODEL_VERT_PATH, MODEL_FRAG_PATH);
    GLuint prog_bw = load_program(BW_VERT_PATH, BW_FRAG_PATH);

    return { projection, prog_skybox, prog_model, prog_bw };
}

void draw_sky(const renderer_t &renderer, const glm::mat4 &p, const glm::mat4 &v, const model_t &skybox) {
    glUseProgram(renderer.prog_skybox);
    glFrontFace(GL_CW);
    glDepthMask(GL_FALSE);

    glBindTexture(GL_TEXTURE_CUBE_MAP, skybox.material.diff_map);

    glBindVertexArray(skybox.mesh.vao);
    glBindBuffer(GL_ARRAY_BUFFER, skybox.mesh.vbo);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, skybox.mesh.ibo);

    chicken3421::set_uniform(renderer.prog_skybox, "u_v", v);
    chicken3421::set_uniform(renderer.prog_skybox, "u_p", p);

    glDrawElements(GL_TRIANGLES, skybox.mesh.nverts, INDEX_TYPE, nullptr);

    glBindTexture(GL_TEXTURE_CUBE_MAP, 0);
    glBindVertexArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

    glDepthMask(GL_TRUE);
    glFrontFace(GL_CCW);
    glUseProgram(0);
}

void draw_model(const renderer_t &renderer,
                const glm::mat4 &p, const glm::mat4 &v, const glm::mat4 &m,
                const model_t &model) {
    glUseProgram(renderer.prog_model);

    chicken3421::set_uniform(renderer.prog_model, "u_m", m);
    chicken3421::set_uniform(renderer.prog_model, "u_v", v);
    chicken3421::set_uniform(renderer.prog_model, "u_p", p);

    glBindTexture(GL_TEXTURE_2D, model.material.diff_map);
    glBindVertexArray(model.mesh.vao);
    glBindBuffer(GL_ARRAY_BUFFER, model.mesh.vbo);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, model.mesh.ibo);

    glDrawElements(GL_TRIANGLES, model.mesh.nverts, INDEX_TYPE, nullptr);

    glBindTexture(GL_TEXTURE_2D, 0);
    glBindVertexArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindTexture(GL_TEXTURE_2D, 0);
}

void render(const renderer_t &renderer, const scene_t &scene) {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glClearColor(0.0f, 0.2f, 0.4f, 1.0f);

    glm::mat4 view = chicken3421::get_view(scene.cam);

    draw_sky(renderer, renderer.projection, view, scene.skybox);

    std::stack<std::pair<const node_t &, glm::mat4>> renderables{{{ scene.wall, glm::mat4(1) }}};
    while (!renderables.empty()) {
        const auto &[node, parent_tf] = renderables.top();  // this is called a structured binding
        renderables.pop();

        glm::mat4 xform = parent_tf * node.transform;

        switch (node.kind) {
            case node_t::WALL:
            case node_t::POSTER:
                draw_model(renderer, renderer.projection, view, xform, node.model);
                break;

        }

        for (const node_t &c: node.children) {
            renderables.push({ c, xform });
        }
    }
}

void render(const renderer_t &renderer, const scene_t &scene, const framebuffer_t &target) {
    glBindFramebuffer(GL_FRAMEBUFFER, target.fbo);
    render(renderer, scene);
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
}


void post_process(const renderer_t &renderer, const model_t &screen_quad) {
    const auto &[mesh, mat] = screen_quad;

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glClearColor(0, 0, 0, 1);

    // explicitly use the screen framebuffer
    glBindFramebuffer(GL_FRAMEBUFFER, 0);

    glUseProgram(renderer.prog_bw_filter);
    glBindTexture(GL_TEXTURE_2D, mat.diff_map);

    glBindVertexArray(mesh.vao);
    glBindBuffer(GL_ARRAY_BUFFER, mesh.vbo);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, mesh.ibo);

    glDrawElements(GL_TRIANGLES, mesh.nverts, INDEX_TYPE, nullptr);

    glBindTexture(GL_TEXTURE_2D, 0);
    glBindVertexArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
}
