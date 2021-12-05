// C++20 has a standard `pi` value, but we're not using C++20...
#define _USE_MATH_DEFINES
#include <cmath>

#include <cstdlib>
#include <string>

#include <glad/glad.h>
#include <GLFW/glfw3.h>

#include <glm/glm.hpp>

#include <glm/ext/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include <stb/stb_image.h>

#include <chicken3421/chicken3421.hpp>


struct image_t {
    int width;
    int height;
    int n_channels;
    void *data;
};

image_t load_image(const std::string &filename) {
    image_t img; // NOLINT(cppcoreguidelines-pro-type-member-init)

    stbi_set_flip_vertically_on_load(true);
    img.data = stbi_load(filename.data(), &img.width, &img.height, &img.n_channels, 0);

    chicken3421::expect(img.data, "Could not read " + filename);

    return img;
}

void delete_image(image_t &img) {
    stbi_image_free(img.data);

    img.data = nullptr;
    img.width = 0;
    img.height = 0;
    img.n_channels = 0;
}

GLuint make_texture(const image_t &tex_img) {
    GLint format = tex_img.n_channels == 3 ? GL_RGB : GL_RGBA; // assuming that if not 3 channels then 4

    GLuint tex;
    glGenTextures(1, &tex);

    glBindTexture(GL_TEXTURE_2D, tex);
    glTexImage2D(GL_TEXTURE_2D, 0, format, tex_img.width, tex_img.height, 0, format, GL_UNSIGNED_BYTE, tex_img.data);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);

    glBindTexture(GL_TEXTURE_2D, 0);

    return tex;
}

void delete_texture(GLuint tex) {
    glDeleteTextures(1, &tex);
}


struct circle_t {
    GLuint vao = 0;
    GLuint vbo = 0;
    GLsizeiptr n_verts = 0;

    std::vector<glm::vec4> positions;
    std::vector<glm::vec2> tcs;


    glm::mat4 t;
    glm::mat4 r;
    glm::mat4 s;
};

circle_t make_circle(float cx, float cy, float r, int detail = 32) {
    circle_t c;

    c.positions.emplace_back(cx, cy, 0, 1);
    c.tcs.emplace_back(0.5f, 0.5f);
    c.n_verts++;

    float slice = 2 * M_PI/detail;
    for (int i = 0; i <= detail; ++i) {
        float theta = i * slice;
        float x = cx + r * std::cos(theta);
        float y = cy + r * std::sin(theta);

        float tx = (x/r + 1) * 0.5f;
        float ty = (y/r + 1) * 0.5f;

        c.positions.emplace_back(x, y, 0, 1);
        c.tcs.emplace_back(tx, ty);
        c.n_verts++;
    }


    c.t = glm::identity<glm::mat4>();
    c.r = glm::identity<glm::mat4>();
    c.s = glm::identity<glm::mat4>();

    glGenVertexArrays(1, &c.vao);
    glGenBuffers(1, &c.vbo);

    glBindVertexArray(c.vao);
    glBindBuffer(GL_ARRAY_BUFFER, c.vbo);

    glBufferData(GL_ARRAY_BUFFER, c.n_verts * (sizeof(glm::vec4) + sizeof(glm::vec2)), nullptr, GL_STATIC_DRAW);

    glBufferSubData(GL_ARRAY_BUFFER, 0, c.n_verts * sizeof(glm::vec4), c.positions.data());
    glBufferSubData(GL_ARRAY_BUFFER, c.n_verts * sizeof(glm::vec4), c.n_verts * sizeof(glm::vec2), c.tcs.data());

    glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, 0, nullptr);
    glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 0, (const GLvoid *)(c.n_verts * sizeof(glm::vec4)));

    glEnableVertexAttribArray(0);
    glEnableVertexAttribArray(1);

    glBindVertexArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);

    return c;
}

void delete_circle(circle_t &c) {
    c.positions.clear();
    c.tcs.clear();
    glDeleteBuffers(1, &c.vbo);
    glDeleteVertexArrays(1, &c.vao);
}

void on_resize(GLFWwindow *win, int new_w, int new_h) {
    glViewport(0, 0, new_w, new_h);
}

void on_key_press(GLFWwindow *win, int key, int scancode, int action, int mods) {
    circle_t *mesh = (circle_t *)glfwGetWindowUserPointer(win);

    switch(key) {
        case GLFW_KEY_W:
            mesh->t = glm::translate(mesh->t, glm::vec3(0, +0.05, 0));
            break;
        case GLFW_KEY_S:
            mesh->t = glm::translate(mesh->t, glm::vec3(0, -0.05, 0));
            break;
        case GLFW_KEY_A:
            mesh->t = glm::translate(mesh->t, glm::vec3(-0.05, 0, 0));
            break;
        case GLFW_KEY_D:
            mesh->t = glm::translate(mesh->t, glm::vec3(+0.05, 0, 0));
            break;
        case GLFW_KEY_Q:
            mesh->r = glm::rotate(mesh->r, (float)M_PI/6, glm::vec3(0, 0, 1));
            break;
        case GLFW_KEY_E:
            mesh->r = glm::rotate(mesh->r, (float)-M_PI/6, glm::vec3(0, 0, 1));
            break;
        default:
            break;
    }
}

void on_mouse_scroll(GLFWwindow *win, double dx, double dy) {
    circle_t *mesh = (circle_t *)glfwGetWindowUserPointer(win);

    double scale = dy < 0 ? 0.9 : 1.1;

    mesh->s = glm::scale(mesh->s, glm::vec3{scale, scale, 0});
}

void on_mouse_click(GLFWwindow *win, int button, int action, int mods) {
    circle_t *mesh = (circle_t *)glfwGetWindowUserPointer(win);

    mesh->t = glm::identity<glm::mat4>();
    mesh->r = glm::identity<glm::mat4>();
    mesh->s = glm::identity<glm::mat4>();
}

GLint get_uniform_location(GLuint program, const std::string &name) {
    GLint loc = glGetUniformLocation(program, name.data());
    chicken3421::expect(loc != -1, "No uniform variable named: " + name + "in program: " + std::to_string(loc));
    return loc;
}

int main() {
    // set-up
    GLFWwindow *win = chicken3421::make_opengl_window(800, 800, "Simple Transforms");

    circle_t mesh = make_circle(0, 0, 0.5);

    GLuint vs = chicken3421::make_shader("res/shaders/simple_transforms/vert.glsl", GL_VERTEX_SHADER);
    GLuint fs = chicken3421::make_shader("res/shaders/simple_transforms/frag.glsl", GL_FRAGMENT_SHADER);
    GLuint program = chicken3421::make_program(vs, fs);

    GLint m_transform = get_uniform_location(program, "m_transform");

    image_t emoji = load_image("res/img/emoji512.png");
    GLuint tex = make_texture(emoji);



    // very important input callback setup
    glfwSetFramebufferSizeCallback(win, on_resize);
    glfwSetKeyCallback(win, on_key_press);
    glfwSetScrollCallback(win, on_mouse_scroll);
    glfwSetMouseButtonCallback(win, on_mouse_click);
    glfwSetWindowUserPointer(win, &mesh);

    while(!glfwWindowShouldClose(win)) {
        glfwPollEvents();

        glUseProgram(program);
        glBindVertexArray(mesh.vao);
        glBindBuffer(GL_ARRAY_BUFFER, mesh.vbo);
        glBindTexture(GL_TEXTURE_2D, tex);

        glClear(GL_COLOR_BUFFER_BIT);
        glClearColor(0, 0, 1, 1);

        glUniformMatrix4fv(m_transform, 1, GL_FALSE, glm::value_ptr(mesh.t * mesh.r * mesh.s));
        glDrawArrays(GL_TRIANGLE_FAN, 0, mesh.n_verts);

        glBindVertexArray(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindTexture(GL_TEXTURE_2D, 0);
        glUseProgram(0);

        glfwSwapBuffers(win);
    }


    // Tear-down
    delete_circle(mesh);
    delete_texture(tex);
    delete_image(emoji);
    chicken3421::delete_program(program);
    chicken3421::delete_shader(fs);
    chicken3421::delete_shader(vs);
    glfwDestroyWindow(win);

    return EXIT_SUCCESS;
}
