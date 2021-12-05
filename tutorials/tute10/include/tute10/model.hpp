#ifndef COMP3421_TUTORIAL_10_MODEL_HPP
#define COMP3421_TUTORIAL_10_MODEL_HPP

#include <glad/glad.h>

#include <glm/ext.hpp>

#include <string>
#include <vector>

using index_t = GLuint;
const GLenum INDEX_TYPE = GL_UNSIGNED_INT;


struct vertex_t {
    glm::vec3 pos;
    glm::vec3 nrm;
    glm::vec2 tc;
};

struct mesh_t {
    GLuint vao;
    GLuint vbo;
    GLuint ibo;
    std::size_t nverts;
};

struct material_t {
    GLuint diff_map;
};

struct model_t {
    mesh_t mesh;
    material_t material;
};

struct material_param_t {
    std::string diff_map_path;
    std::vector<unsigned char> bytes{};
};

struct volume_param_t {
    float width = 1;
    float height = 1;
    float depth = 1;
    bool tex_cover = false;
};


model_t make_volume(const volume_param_t &geo_params, const material_param_t &mat_params);

model_t make_skybox(const std::string &base_path, const std::string &extension = ".jpg");

/**
 * Creates a quad in NDC.
 *
 * A textured quad like this is good for applying post-processing effects, as we treat the scene as a simple texture
 *
 * @param scene_tex The texture of the scene that was rendered into.
 * @return A "model" representing the scene as a 2D quad.
 */
model_t make_screen_quad(GLuint scene_tex);

#endif //COMP3421_TUTORIAL_10_MODEL_HPP
