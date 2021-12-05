#include <thread>
#include <chrono>

#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/ext.hpp>

#include <chicken3421/chicken3421.hpp>

#include <tute10/memes.hpp>
#include <tute10/renderer.hpp>
#include <tute10/scene.hpp>
#include <tute10/framebuffer.hpp>

/**
 * Returns the difference in time between when this function was previously called and this call.
 * @return A float representing the difference between function calls in seconds.
 */
float time_delta();

/**
 * Returns the current time in seconds.
 * @return Returns the current time in seconds.
 */
float time_now();

std::pair<int, int> get_framebuffer_size(GLFWwindow *win);

/**
 * Flips a boolean.
 * Useful for turning filtering on and off...
 *
 * @param win The window this event is associated with
 * @param key What key was pressed
 * @param action Was it released, pressed, or held?
 */
void update_filter_on_off_cb(GLFWwindow *win, int key, int, int action, int) {
    bool *use_filter = (bool *) glfwGetWindowUserPointer(win);

    if (key == GLFW_KEY_SPACE && action == GLFW_PRESS) {
        *use_filter = !*use_filter;
    }
}

int main() {
    GLFWwindow *win = marcify(chicken3421::make_opengl_window(1280, 720, "Tutorial 10"));
    glfwSetInputMode(win, GLFW_CURSOR, GLFW_CURSOR_DISABLED);

    scene_t scene = make_scene();
    renderer_t renderer = make_renderer(glm::perspective(glm::pi<float>() / 3, 1280.f / 720.f, 0.1f, 100.f));

    const auto &[fbo_width, fbo_height] = get_framebuffer_size(win);
    framebuffer_t screen_buffer = make_framebuffer(fbo_width, fbo_height);
    model_t screen_quad = make_screen_quad(screen_buffer.texture);

    bool use_filter = false;
    glfwSetWindowUserPointer(win, &use_filter);
    glfwSetKeyCallback(win, update_filter_on_off_cb);

    while (!glfwWindowShouldClose(win)) {
        float dt = time_delta();

        chicken3421::update_camera(scene.cam, win, dt);

        if (use_filter) {
            render(renderer, scene, screen_buffer);
            post_process(renderer, screen_quad);
        } else {
            render(renderer, scene);
        }

        glfwSwapBuffers(win);
        glfwPollEvents();

        // not entirely correct as a frame limiter, but close enough
        // it would be more correct if we knew how much time this frame took to render
        // and calculated the distance to the next "ideal" time to render and only slept that long
        // the current way just always sleeps for 16.67ms, so in theory we'd drop frames
        std::this_thread::sleep_for(std::chrono::duration<float, std::milli>(1000.f / 60));
    }

    // deleting the whole window also removes the opengl context, freeing all our memory in one fell swoop.
    chicken3421::delete_opengl_window(win);

    return EXIT_SUCCESS;
}

std::pair<int, int> get_framebuffer_size(GLFWwindow *win) {
    int w, h;
    glfwGetFramebufferSize(win, &w, &h);
    return std::make_pair(w, h);
}

float time_delta() {
    static float then = time_now();
    float now = time_now();
    float dt = now - then;
    then = now;
    return dt;
}

float time_now() {
    return (float) glfwGetTime();
}
