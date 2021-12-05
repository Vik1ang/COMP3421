#ifndef COMP3421_TUTORIAL_09_RENDERER_HPP
#define COMP3421_TUTORIAL_09_RENDERER_HPP

#include <glad/glad.h>
#include <glm/ext.hpp>

#include <tute09/model.hpp>
#include <tute09/scene.hpp>

/**
 * A simple bag of all the OpenGL rendering bits we've used up until now.
 */
struct renderer_t {
    glm::mat4 projection;
    glm::mat4 view;

    GLuint prog_static_mesh;
    GLuint prog_reflective;
    GLuint prog_portal;

    glm::vec4 portal_clip_plane;
};

/**
 * Initialise our renderer.
 *
 * Inside of this we can load shaders, grab uniform locations, etc.
 * Of course, if we have different shaders, it is conceivable we would have different capabilities enabled/disabled too.
 * Whatever doesn't change can be initialised here, then.
 *
 * @param projection The projection matrix to use (almost always a perspective transform)
 * @return The renderer.
 */
renderer_t make_renderer(const glm::mat4 &projection);

/**
 * Draws a model "m".
 *
 * @param renderer The rendering context gotten from make_renderer()
 * @param mv The model-view matrix.
 * @param m The model to draw.
 */
void draw_model(const renderer_t &renderer, const glm::mat4 &mv, const model_t &m);

/**
 * Draws a model "m", but with the material replaced with a portal view.
 *
 * @param renderer The rendering context gotten from make_renderer()
 * @param mv The model-view matrix.
 * @param m The model to draw.
 * @param texture The portal framebuffer texture.
 */
void draw_portal(const renderer_t &renderer, const glm::mat4 &mv, const model_t &m, GLuint texture);

/**
 * Draws a model "m", but with the material replaced with a cubemap reflection.
 *
 * @param renderer The rendering context gotten from make_renderer()
 * @param mv The model-view matrix.
 * @param m The model to draw.
 * @param texture The cubemap reflection texture.
 */
void draw_reflective(const renderer_t &renderer, const glm::mat4 &mv, const model_t &m, GLuint texture);

/**
 * Renders the current scene specified by scene.
 *
 * Starting at the root of the scenegraph, this function will "recursively" descend the scenegraph and draw all nodes.
 * Nothing is modified except the OpenGL context.
 *
 * @param renderer the rendering context gotten from make_renderer()
 * @param scene the scene to draw.
 */
void render(renderer_t &renderer, const camera_t &cam, const node_t &scene);

#endif //COMP3421_TUTORIAL_09_RENDERER_HPP
