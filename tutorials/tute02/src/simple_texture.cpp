#include <cstdlib>
#include <string>

#include <glad/glad.h>
#include <stb/stb_image.h>
#include <glm/glm.hpp>

#include <chicken3421/chicken3421.hpp>



struct image_t {
    int width;
    int height;
    int n_channels;
    void *data;
};

image_t load_image(const std::string &filename) {
    image_t img;

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

GLuint make_texture(const std::string &path) {
    image_t tex_img = load_image(path);

    GLint format = tex_img.n_channels == 3 ? GL_RGB : GL_RGBA; // assuming that if not 3 channels then 4

    GLuint tex;
    glGenTextures(1, &tex);

    glBindTexture(GL_TEXTURE_2D, tex);
    glTexImage2D(GL_TEXTURE_2D, 0, format, tex_img.width, tex_img.height, 0, format, GL_UNSIGNED_BYTE, tex_img.data);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glBindTexture(GL_TEXTURE_2D, 0);

    return tex;
}

struct vertex_t {
    glm::vec4 pos;
    glm::vec2 tc;
};

struct rect_t {
    GLuint vao;
    GLuint vbo;
    std::vector<vertex_t> vertices;
};


rect_t make_rect(float xmin, float ymin, float xmax, float ymax) {
    std::vector<vertex_t> verts = {
            {{ xmax, ymax, 0, 1 }, { 1, 1 }},      // top-right
            {{ xmax, ymin, 0, 1 }, { 1, 0 }},        // bottom-right
            {{ xmin, ymin, 0, 1 }, { 0, 0 }},             // bottom-left

            {{ xmax, ymax, 0, 1 }, {1, 1}},           // top-right
            {{ xmin, ymin, 0, 1 }, {0, 0}},           // bottom-left
            {{ xmin, ymax, 0, 1 }, {0, 1}},           // top-left
    };

    GLuint vao;
    glGenVertexArrays(1, &vao);

    GLuint vbo;
    glGenBuffers(1, &vbo);

    glBindVertexArray(vao);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);

    glBufferData(GL_ARRAY_BUFFER, (GLintptr)(sizeof(vertex_t) * verts.size()), verts.data(), GL_STATIC_DRAW);

    glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, sizeof(vertex_t), (void *)(0 + offsetof(vertex_t, pos)));
    glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, sizeof(vertex_t), (void *)(0 + offsetof(vertex_t, tc)));

    glEnableVertexAttribArray(0);
    glEnableVertexAttribArray(1);

    return rect_t{vao, vbo, verts};
}

int main() {
    GLFWwindow *win = chicken3421::make_opengl_window(1280, 720, "Simple Texture");

    rect_t mesh = make_rect(-0.75, -0.75, 0.75, 0.75);

    GLuint vs = chicken3421::make_shader("res/shaders/simple_texture/vert.glsl", GL_VERTEX_SHADER);
    GLuint fs = chicken3421::make_shader("res/shaders/simple_texture/frag.glsl", GL_FRAGMENT_SHADER);

    GLuint render_prog = chicken3421::make_program(vs, fs);

    chicken3421::delete_shader(vs); chicken3421::delete_shader(fs);

    GLuint tex1 = make_texture("res/img/arrows256.jpg");


    glUseProgram(render_prog);
    GLint loc_tex = glGetUniformLocation(render_prog, "tex");
    while(!glfwWindowShouldClose(win)) {
        glfwPollEvents();

        glClear(GL_COLOR_BUFFER_BIT);
        glClearColor(0, 0, 1, 1);
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, tex1);
        glUniform1i(loc_tex, 0);
        glDrawArrays(GL_TRIANGLES, 0, 6);

        glfwSwapBuffers(win);
    }

    return EXIT_SUCCESS;
}
