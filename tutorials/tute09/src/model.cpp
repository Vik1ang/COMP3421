#include <tute09/model.hpp>

#include <tiny_obj_loader.h>

#include <chicken3421/chicken3421.hpp>

mesh_t make_mesh(
        const std::vector<glm::vec4> &positions,
        const std::vector<glm::vec2> &texcoords,
        const std::vector<glm::vec3> &normals,
        int material_id
) {
    GLuint vao = chicken3421::make_vao();
    glBindVertexArray(vao);

    GLuint vbo = chicken3421::make_buffer();
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    GLsizeiptr pos_sz = positions.size() * sizeof(glm::vec4);
    GLsizeiptr tc_sz = texcoords.size() * sizeof(glm::vec2);
    GLsizeiptr nrm_sz = normals.size() * sizeof(glm::vec3);
    glBufferData(
            GL_ARRAY_BUFFER,
            pos_sz + tc_sz + nrm_sz,
            nullptr,
            GL_STATIC_DRAW
    );
    glBufferSubData(GL_ARRAY_BUFFER, 0, pos_sz, positions.data());
    glBufferSubData(GL_ARRAY_BUFFER, pos_sz, tc_sz, texcoords.data());
    glBufferSubData(GL_ARRAY_BUFFER, pos_sz + tc_sz, nrm_sz, normals.data());

    glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, 0, (void *) nullptr);
    glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 0, (void *) pos_sz);
    if (nrm_sz != 0) {
        glVertexAttribPointer(2, 3, GL_FLOAT, GL_FALSE, 0, (void *) (pos_sz + tc_sz));
    }

    glEnableVertexAttribArray(0);
    glEnableVertexAttribArray(1);
    if (nrm_sz != 0) glEnableVertexAttribArray(2);

    glBindVertexArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);

    return mesh_t{ vao, vbo, (GLuint)positions.size(), material_id };
}

GLuint load_texture(const std::string &path) {
    chicken3421::image_t teximg = chicken3421::load_image(path);
    GLint fmt = teximg.n_channels == 3 ? GL_RGB : GL_RGBA;

    GLuint tex = chicken3421::make_texture();
    glBindTexture(GL_TEXTURE_2D, tex);
    glTexImage2D(GL_TEXTURE_2D, 0, fmt, teximg.width, teximg.height, 0, fmt, GL_UNSIGNED_BYTE, teximg.data);
    glGenerateMipmap(GL_TEXTURE_2D);

    glBindTexture(GL_TEXTURE_2D, 0);

    chicken3421::delete_image(teximg);

    return tex;
}

model_t load_obj(const std::string &path) {
    tinyobj::attrib_t attrib;
    std::vector<tinyobj::shape_t> shapes;
    std::vector<tinyobj::material_t> materials;

    std::string str_warn, str_err;
    std::string mtl_base = path.substr(0, path.find_last_of('/') + 1);

    bool did_load = tinyobj::LoadObj(&attrib, &shapes, &materials, &str_warn, &str_err, path.c_str(), mtl_base.c_str());
    chicken3421::expect(did_load && str_warn.empty() && str_err.empty(), str_warn + str_err);

    // load the meshes
    std::vector<mesh_t> meshes;
    for (const tinyobj::shape_t &shape: shapes) {
        // every 3 indices makes a face, quads etc.
        // In .obj files, the vertices are triangulated by default
        std::vector<glm::vec4> positions;
        std::vector<glm::vec2> texcoords;
        for (const tinyobj::index_t &index: shape.mesh.indices) {
            float *pos = &attrib.vertices[3 * index.vertex_index];
            float *tc = &attrib.texcoords[2 * index.texcoord_index];

            positions.emplace_back(pos[0], pos[1], pos[2], 1);
            texcoords.emplace_back(tc[0], tc[1]);
        }

        int material = shape.mesh.material_ids.empty() ? -1 : shape.mesh.material_ids[0];

        meshes.emplace_back(make_mesh(positions, texcoords, std::vector<glm::vec3>(), material));
    }

    // load the materials
    std::vector<material_t> mats;
    for (const tinyobj::material_t &mat: materials) {
        GLuint tex = mat.diffuse_texname.empty() ? 0 : load_texture(mtl_base + mat.diffuse_texname);
        glm::vec4 col = { mat.diffuse[0], mat.diffuse[1], mat.diffuse[2], 1 };

        mats.emplace_back(material_t{ tex, col });
    }

    return model_t{ meshes, mats };
}

model_t generate_sphere() {
    int stacks = 16;
    int slices = 32;

    struct sphere_vertex_t {
        glm::vec3 pos;
        glm::vec3 normal;
        glm::vec2 texco;
    };

    std::vector<sphere_vertex_t> sverts;
    for (int i = 0; i <= stacks; ++i) {
        double phi = glm::pi<double>() * i / (double) stacks;

        for (int j = 0; j <= slices; ++j) {
            double theta = 2 * glm::pi<double>() * j / (double) slices;

            glm::vec3 p = { std::cos(theta) * std::sin(phi), std::cos(phi), std::sin(theta) * std::sin(phi) };
            glm::vec3 normal = glm::normalize(p);
            glm::vec2 tc = { (float) -j / (float) slices, (float) i / (float) stacks };

            sverts.push_back(sphere_vertex_t { p, normal, tc });
        }
    }

    std::vector<glm::vec4> positions;
    std::vector<glm::vec2> texcoords;
    std::vector<glm::vec3> normals;

    // sorry
    auto push_vert = [&](int i) {
        const auto& v = sverts[i];
        positions.push_back(glm::vec4(v.pos,1));
        texcoords.push_back(v.texco);
        normals.push_back(v.normal);
    };
    for (int i = 0; i < slices * stacks + stacks; ++i) {
        push_vert(i);
        push_vert(i + slices + 1);
        push_vert(i + slices);

        push_vert(i + slices + 1);
        push_vert(i);
        push_vert(i + 1);
    }

    std::vector<mesh_t> meshes;
    meshes.push_back(make_mesh(positions, texcoords, normals, 0));

    std::vector<material_t> materials;
    materials.push_back(material_t { 0, glm::vec4(1, 1, 1, 1) });

    return { meshes, materials };
}

void destroy_obj(model_t &m) {
    for (mesh_t &mesh: m.meshes) {
        chicken3421::delete_vao(mesh.vao);
        chicken3421::delete_buffer(mesh.vbo);

        mesh.vbo = mesh.vao = 0;
        mesh.nverts = 0;
    }

    for (material_t &mat: m.materials) {
        chicken3421::delete_texture(mat.texture);
        mat.texture = 0;
    }
}
