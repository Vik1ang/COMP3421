#include <tute10/model.hpp>

#include <stb/stb_image.h>

#include <chicken3421/chicken3421.hpp>

namespace {
    mesh_t upload_mesh(const std::vector<vertex_t> &vertices, const std::vector<index_t> &indices) {
        GLuint vao = chicken3421::make_vao();
        glBindVertexArray(vao);

        GLuint vbo = chicken3421::make_buffer();
        glBindBuffer(GL_ARRAY_BUFFER, vbo);
        glBufferData(GL_ARRAY_BUFFER, sizeof(vertex_t) * vertices.size(), vertices.data(), GL_STATIC_DRAW);

        GLuint ibo = chicken3421::make_buffer();
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(index_t) * indices.size(), indices.data(), GL_STATIC_DRAW);

        glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(vertex_t), (void *) offsetof(vertex_t, pos));
        glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, sizeof(vertex_t), (void *) offsetof(vertex_t, nrm));
        glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, sizeof(vertex_t), (void *) offsetof(vertex_t, tc));

        glEnableVertexAttribArray(0);
        glEnableVertexAttribArray(1);
        glEnableVertexAttribArray(2);

        glBindVertexArray(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

        return mesh_t{ vao, vbo, ibo, indices.size() };
    }

    mesh_t make_volume_mesh(const volume_param_t &params) {
        float w = params.width;
        float h = params.height;
        float d = params.depth;

        float hw, hh, hd;
        if (params.tex_cover) {
            hw = 1;
            hh = 1;
            hd = 1;
        } else {
            hw = w / 2;
            hh = h / 2;
            hd = d / 2;
        }

        std::vector<vertex_t> verts = {
                // assuming looking down the negative-z axis...

                // front face
                {{ -w, -h, d },  { 0,  0,  1 },  { 0,  0 }},
                {{ w,  -h, d },  { 0,  0,  1 },  { hw, 0 }},
                {{ w,  h,  d },  { 0,  0,  1 },  { hw, hh }},
                {{ -w, h,  d },  { 0,  0,  1 },  { 0,  hh }},

                // right face
                {{ w,  -h, d },  { 1,  0,  0 },  { 0,  0 }},
                {{ w,  -h, -d }, { 1,  0,  0 },  { hd, 0 }},
                {{ w,  h,  -d }, { 1,  0,  0 },  { hd, hh }},
                {{ w,  h,  d },  { 1,  0,  0 },  { 0,  hh }},

                // back face
                {{ w,  -h, -d }, { 0,  0,  -1 }, { 0,  0 }},
                {{ -w, -h, -d }, { 0,  0,  -1 }, { hw, 0 }},
                {{ -w, h,  -d }, { 0,  0,  -1 }, { hw, hh }},
                {{ w,  h,  -d }, { 0,  0,  -1 }, { 0,  hh }},

                // left face
                {{ -w, -h, -d }, { -1, 0,  0 },  { 0,  0 }},
                {{ -w, -h, d },  { -1, 0,  0 },  { hd, 0 }},
                {{ -w, h,  d },  { -1, 0,  0 },  { hd, hh }},
                {{ -w, h,  -d }, { -1, 0,  0 },  { 0,  hh }},

                // top face
                {{ -w, h,  d },  { 0,  1,  0 },  { 0,  0 }},
                {{ w,  h,  d },  { 0,  1,  0 },  { hw, 0 }},
                {{ w,  h,  -d }, { 0,  1,  0 },  { hw, hd }},
                {{ -w, h,  -d }, { 0,  1,  0 },  { 0,  hd }},

                // bottom face
                {{ -w, -h, -d }, { 0,  -1, 0 },  { 0,  0 }},
                {{ w,  -h, -d }, { 0,  -1, 0 },  { hw, 0 }},
                {{ w,  -h, d },  { 0,  -1, 0 },  { hw, hd }},
                {{ -w, -h, d },  { 0,  -1, 0 },  { 0,  hd }},
        };
        std::vector<index_t> indices = {
                0, 1, 2,
                0, 2, 3,

                4, 5, 6,
                4, 6, 7,

                8, 9, 10,
                8, 10, 11,

                12, 13, 14,
                12, 14, 15,

                16, 17, 18,
                16, 18, 19,

                20, 21, 22,
                20, 22, 23
        };

        return upload_mesh(verts, indices);
    }

    GLuint upload_texture(const std::string &path) {
        chicken3421::image_t teximg = chicken3421::load_image(path);
        GLint fmt = teximg.n_channels == 3 ? GL_RGB : teximg.n_channels == 4 ? GL_RGBA : GL_RED;

        GLuint tex = chicken3421::make_texture();
        glBindTexture(GL_TEXTURE_2D, tex);
        glTexImage2D(GL_TEXTURE_2D, 0, fmt, teximg.width, teximg.height, 0, fmt, GL_UNSIGNED_BYTE, teximg.data);
        glGenerateMipmap(GL_TEXTURE_2D);

        glBindTexture(GL_TEXTURE_2D, 0);

        chicken3421::delete_image(teximg);

        return tex;
    }

    GLuint upload_texture(const std::vector<unsigned char> &bytes) {
        chicken3421::image_t teximg{};
        teximg.data = stbi_load_from_memory(bytes.data(), (int)bytes.size(), &teximg.width, &teximg.height, &teximg.n_channels, 0);

        GLint fmt = teximg.n_channels == 3 ? GL_RGB : teximg.n_channels == 4 ? GL_RGBA : GL_RED;

        GLuint tex = chicken3421::make_texture();
        glBindTexture(GL_TEXTURE_2D, tex);
        glTexImage2D(GL_TEXTURE_2D, 0, fmt, teximg.width, teximg.height, 0, fmt, GL_UNSIGNED_BYTE, teximg.data);
        glGenerateMipmap(GL_TEXTURE_2D);

        glBindTexture(GL_TEXTURE_2D, 0);

        chicken3421::delete_image(teximg);

        return tex;
    }

    material_t make_mat(const material_param_t &params) {
        GLuint diff =  params.diff_map_path.empty() ? upload_texture(params.bytes) : upload_texture(params.diff_map_path);

        return material_t{ diff };
    }

    GLuint make_cubemap(const std::string &base_path, const std::string &extension) {
        static const char *suffixes[] = { "right", "left", "top", "bottom", "front", "back" };

        GLuint cubemap = chicken3421::make_texture();
        glBindTexture(GL_TEXTURE_CUBE_MAP, cubemap);

        for (int side = 0; side < 6; side++) {
            std::string path = base_path;
            path += suffixes[side];
            path += extension; // a very C++ sort of thing
            chicken3421::image_t image = chicken3421::load_image(path, false);
            GLenum fmt = image.n_channels == 3 ? GL_RGB : GL_RGBA;

            GLenum face = GL_TEXTURE_CUBE_MAP_POSITIVE_X + side;
            glTexImage2D(face, 0, fmt, image.width, image.height, 0, fmt, GL_UNSIGNED_BYTE, image.data);
            chicken3421::delete_image(image);
        }

        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);

        glBindTexture(GL_TEXTURE_CUBE_MAP, 0);

        return cubemap;
    }

}

model_t make_volume(const volume_param_t &geo_params, const material_param_t &mat_params) {
    return model_t{ make_volume_mesh(geo_params), make_mat(mat_params) };
}

model_t make_skybox(const std::string &base_path, const std::string &extension) {
    const static glm::vec4 verts[] = {
            { -1, -1, 1,  1 }, // LBF: 0
            { 1,  -1, 1,  1 }, // RBF: 1
            { 1,  1,  1,  1 }, // RTF: 2
            { -1, 1,  1,  1 }, // LTF: 3

            { 1,  -1, -1, 1 }, // RBB: 4
            { -1, -1, -1, 1 }, // LBB: 5
            { -1, 1,  -1, 1 }, // LTB: 6
            { 1,  1,  -1, 1 }, // RTB: 7
    };

    const static index_t indices[] = {
            0, 1, 2,
            0, 2, 3,

            1, 4, 7,
            1, 7, 2,

            4, 5, 6,
            4, 6, 7,

            5, 0, 3,
            5, 3, 6,

            3, 2, 7,
            3, 7, 6,

            5, 4, 1,
            5, 1, 0
    };

    GLuint vao = chicken3421::make_vao();
    glBindVertexArray(vao);

    GLuint vbo = chicken3421::make_buffer();
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(verts), verts, GL_STATIC_DRAW);

    GLuint ibo = chicken3421::make_buffer();
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

    glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, 0, nullptr);
    glEnableVertexAttribArray(0);

    glBindVertexArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

    mesh_t mesh = { vao, vbo, ibo, 36 };
    material_t mat = { make_cubemap(base_path, extension) };

    return { mesh, mat };
}

model_t make_screen_quad(GLuint scene_tex) {
    glm::vec4 positions[] = {
            {-1, -1, 0, 1},
            {1, -1, 0, 1},
            {1, 1, 0, 1},
            {-1, 1, 0, 1}
    };

    glm::vec2 texcoords[] = {
            {0, 0},
            {1, 0},
            {1, 1},
            {0, 1}
    };

    const auto n_verts = 6;
    index_t indices[] = {
            0, 1, 2,
            0, 2, 3
    };

    GLuint vao = chicken3421::make_vao();
    glBindVertexArray(vao);

    GLuint vbo = chicken3421::make_buffer();
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(positions) + sizeof(texcoords), nullptr, GL_STATIC_DRAW);
    glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(positions), positions);
    glBufferSubData(GL_ARRAY_BUFFER, sizeof(positions), sizeof(texcoords), texcoords);

    GLuint ibo = chicken3421::make_buffer();
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

    glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, 0, nullptr);
    glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 0, (void *)sizeof(positions));
    glEnableVertexAttribArray(0);
    glEnableVertexAttribArray(1);

    glBindVertexArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

    return { {vao, vbo, ibo, n_verts}, {scene_tex} };
}