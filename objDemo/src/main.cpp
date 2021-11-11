#include <thread>
#include <chrono>

#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/ext.hpp>

#include <chicken3421/chicken3421.hpp>

#include <objDemo/animator.hpp>
#include <objDemo/camera.hpp>
#include <objDemo/memes.hpp>
#include <objDemo/renderer.hpp>
#include <objDemo/scene.hpp>

#include "ImGui/imgui.h"
#include "ImGui/imgui_impl_glfw.h"
#include "ImGui/imgui_impl_opengl3.h"

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

int main() {
    GLFWwindow *win = marcify(chicken3421::make_opengl_window(1280, 720, "Tutorial 05"));
    glfwSetInputMode(win, GLFW_CURSOR, GLFW_CURSOR_NORMAL);


    scene_t scene = make_scene();
    animator_t animator = make_animator();
    renderer_t renderer = make_renderer(glm::perspective(glm::pi<double>() / 3, 1280.0 / 720, 0.1, 1000.0));

    // IMGUI setup
    IMGUI_CHECKVERSION();

    ImGui::CreateContext();
    ImGuiIO &io = ImGui::GetIO();
    ImGui_ImplGlfw_InitForOpenGL(win, true);
    ImGui_ImplOpenGL3_Init("#version 330");
    ImGui::StyleColorsLight();

    while (!glfwWindowShouldClose(win)) {
        float dt = time_delta();

        glClearColor(0.0, 0.0, 0.0, 1.0);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        ImGui_ImplOpenGL3_NewFrame();
        ImGui_ImplGlfw_NewFrame();
        ImGui::NewFrame();

        ImGui::Begin("GROUND");

        ImGui::Text("transform");
        ImGui::SliderFloat3("position", glm::value_ptr(scene.root.transform), -10, 10.0);

        ImGui::Text("cam.yaw");
        ImGui::SliderFloat("rotation", &scene.cam.yaw, -5.0, 5.0);

        ImGui::Text("cam.pitch");
        ImGui::SliderFloat("scale", &scene.cam.pitch, -10.0, 10.0);

        ImGui::End();

        update_camera(scene.cam, win, dt);
        animate(animator, scene, time_now());
        render(renderer, scene);

        ImGui::Render();
        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());


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


float time_delta() {
    static float then = time_now();
    float now = time_now();
    float dt = now - then;
    then = now;
    return dt;
}

float time_now() {
    return (float)glfwGetTime();
}