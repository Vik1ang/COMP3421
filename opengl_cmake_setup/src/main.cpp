#define _USE_MATH_DEFINES
#include <cmath>

#include <glad/glad.h>
#include <GLFW/glfw3.h>

#include <chicken3421/chicken3421.hpp>

int main() {
    GLFWwindow *win = chicken3421::make_opengl_window(1280, 720, "Assignment 1");

    while (!glfwWindowShouldClose(win)) {
        double now = glfwGetTime();

        glfwPollEvents();

        glClear(GL_COLOR_BUFFER_BIT);
        glClearColor(std::sin(now), std::cos(now), std::sin(now), 1);

        glfwSwapBuffers(win);
    }

    return EXIT_SUCCESS;
}
