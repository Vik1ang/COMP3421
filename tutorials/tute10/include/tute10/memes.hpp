#ifndef TUTE10_MEMES_HPP
#define TUTE10_MEMES_HPP

// including glad isn't technically necessary for this header
// but in the event that this header is included in another file
// as the first header glad will throw an error, so this is a precaution
#include <glad/glad.h>
#include <GLFW/glfw3.h>

/**
 * Adds a little something special to win
 *
 * @param win The window to make AWESOME
 * @return A GLORIOUS window
 */
GLFWwindow *marcify(GLFWwindow *win);


#endif //TUTE10_MEMES_HPP