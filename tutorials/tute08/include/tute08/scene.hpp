#ifndef COMP3421_TUTORIAL_08_SCENE_HPP
#define COMP3421_TUTORIAL_08_SCENE_HPP

#include <glad/glad.h>

#include <glm/ext.hpp>

#include <tute08/camera.hpp>
#include <tute08/light.hpp>
#include <tute08/primitives.hpp>


struct node_t {
    /**
     * The different types of models in our scene.
     */
    enum {
        CUBE,
        SPHERE,
        TORUS,
        GROUND,
        LIGHT_MESH
    } kind;
    model_t obj;
    glm::mat4 transform;
    std::vector<node_t> children;
};

/**
 * Our scene consists of a simple camera and the graph of all objects.
 *
 * Note that every node is the same size because all the models are the same size.
 * This isn't necessarily true in the real world.
 * How might one deal with different node sizes?
 */
struct scene_t {
    camera_t cam;

    point_light_t point_light;

    node_t root;
};

/**
 * Create our scene in whatever fashion we desire.
 *
 * It is important to note that this function takes the role of a level loader.
 * Thus, we'll almost always be changing this when we want different things in-scene.
 *
 * @return Our scene
 */
scene_t make_scene();



#endif //COMP3421_TUTORIAL_08_SCENE_HPP