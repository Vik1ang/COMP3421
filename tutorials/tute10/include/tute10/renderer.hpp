#ifndef COMP3421_TUTORIAL_10_RENDERER_HPP
#define COMP3421_TUTORIAL_10_RENDERER_HPP


#include <glad/glad.h>
#include <glm/ext.hpp>

#include <tute10/framebuffer.hpp>
#include <tute10/model.hpp>
#include <tute10/scene.hpp>

/**
 * A simple bag of all the OpenGL rendering bits we've used up until now.
 */
struct renderer_t {
    glm::mat4 projection;
    GLuint prog_skybox;
    GLuint prog_model;

    GLuint prog_bw_filter;
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

void draw_sky(const renderer_t &renderer, const glm::mat4 &p, const glm::mat4 &v, const model_t &skybox);

/**
 * Draws a model "m".
 *
 * @param renderer The rendering context gotten from make_renderer()
 * @param mv The model-view matrix.
 * @param m The model to draw.
 */
void draw_model(const renderer_t &renderer, const glm::mat4 &p, const glm::mat4 &v, const glm::mat4 &m,
                const model_t &model);

/**
 * Renders the current scene specified by scene.
 *
 * Starting at the root of the scenegraph, this function will "recursively" descend the scenegraph and draw all nodes.
 * Nothing is modified except the OpenGL context.
 *
 * @param renderer the rendering context gotten from make_renderer()
 * @param scene the scene to draw.
 */
void render(const renderer_t &renderer, const scene_t &scene);


/**
 * Renders the scene specifically to the framebuffer denoted by target.
 *
 * Probably smart to delegate the majority of the work to the base render() function though.
 *
 * @param renderer The state of our renderer.
 * @param scene The scene to render
 * @param target Output of the render. A simple framebuffer big enough to fit the current viewport
 */
void render(const renderer_t &renderer, const scene_t &scene, const framebuffer_t &target);

/**
 * Applies a black and white filter to the texture inside of screen_quad.
 *
 * The shaders that do this are in bw.vert, bw.frag.
 *
 * @param renderer The state of our renderer
 * @param screen_quad A textured quad that represents the screen as simple geometry and the scene as a texture
 */
void post_process(const renderer_t &renderer, const model_t &screen_quad);

#endif //COMP3421_TUTORIAL_10_RENDERER_HPP
