#include "scene.hpp"
#include "texture_2d.hpp"

namespace scene {
    // TODO: implement this function
    void draw(const node_t *node, const glm::mat4 &parent_mvp, GLint mvp_loc) {
        glm::mat4 mvp = parent_mvp;

        mvp *= glm::translate(glm::mat4(1.0), node->translation);
        mvp *= glm::rotate(glm::mat4(1.0), node->rotation.z, glm::vec3(0, 0, 1));
        mvp *= glm::rotate(glm::mat4(1.0), node->rotation.y, glm::vec3(0, 1, 0));
        mvp *= glm::rotate(glm::mat4(1.0), node->rotation.x, glm::vec3(1, 0, 0));
        mvp *= glm::scale(glm::mat4(1.0), node->scale);

        glUniformMatrix4fv(mvp_loc, 1, GL_FALSE, glm::value_ptr(mvp));

        texture_2d::bind(node->texture);
        if (node->mesh.vbo) static_mesh::draw(node->mesh);

        for (auto const &child: node->children) {
            scene::draw(child, mvp, mvp_loc);
        }
    }

    void destroy(const node_t &node) {
        static_mesh::destroy(node.mesh);
        texture_2d::destroy(node.texture);
    }

}
