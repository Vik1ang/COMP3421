#ifndef COMP3421_TUTORIAL_10_SCENE_HPP
#define COMP3421_TUTORIAL_10_SCENE_HPP

#include <chicken3421/chicken3421.hpp>

#include <tute10/model.hpp>

struct node_t {
    enum {
        WALL,
        POSTER
    } kind;

    model_t model;
    std::vector<node_t> children;
    glm::mat4 transform;
};

struct scene_t {
    chicken3421::camera_t cam;
    model_t skybox;
    node_t wall;
};

scene_t make_scene();

#endif //COMP3421_TUTORIAL_10_SCENE_HPP
