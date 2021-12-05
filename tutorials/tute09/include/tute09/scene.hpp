#ifndef COMP3421_TUTORIAL_09_SCENE_HPP
#define COMP3421_TUTORIAL_09_SCENE_HPP

#include <glad/glad.h>

#include <glm/ext.hpp>

#include <tute09/camera.hpp>
#include <tute09/model.hpp>


struct node_t {
    /**
     * The different types of models in our scene.
     */
    enum {
        EMPTY,
        STATIC_MESH,
        REFLECTIVE,
        PORTAL
    } kind = EMPTY;
    glm::mat4 transform = glm::mat4(1);
    std::vector<node_t> children {};

    // Only for STATIC_MESH, REFLECTIVE, PORTAL:
    model_t obj;

    // Only for REFLECTIVE, PORTAL:
    GLuint texture;

    // Only for PORTAL:
    bool is_interior;
};

/**
 * Create the interior scene
 */
node_t make_scene_interior(GLuint portal_texture);

/**
 * Create the exterior scene
 */
node_t make_scene_exterior(GLuint portal_texture);

#endif //COMP3421_TUTORIAL_09_SCENE_HPP
