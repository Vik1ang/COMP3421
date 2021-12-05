#include <tute09/scene.hpp>
#include <tute09/cubemap.hpp>
#include <tute09/model.hpp>

const char *EXTERIOR_PATH = "res/obj/exterior/exterior.obj";
const char *EXTERIOR_PORTAL_PATH = "res/obj/exterior/exterior_portal.obj";
const char *INTERIOR_PATH = "res/obj/interior/interior.obj";
const char *INTERIOR_PORTAL_PATH = "res/obj/interior/interior_portal.obj";
const char* SKYBOX_BASE_PATH = "res/skybox/sky";

node_t make_scene_interior(GLuint portal_texture) {
    node_t scene;

    node_t interior;
    interior.kind = node_t::STATIC_MESH;
    interior.obj = load_obj(INTERIOR_PATH);

    node_t interior_portal;
    interior_portal.kind = node_t::PORTAL;
    interior_portal.obj = load_obj(INTERIOR_PORTAL_PATH);
    interior_portal.texture = portal_texture;

    scene.children.push_back(interior);
    scene.children.push_back(interior_portal);

    return scene;
}

node_t make_scene_exterior(GLuint portal_texture) {
    node_t scene;

    node_t exterior;
    exterior.kind = node_t::STATIC_MESH;
    exterior.obj = load_obj(EXTERIOR_PATH);

    node_t exterior_portal;
    exterior_portal.kind = node_t::PORTAL;
    exterior_portal.obj = load_obj(EXTERIOR_PORTAL_PATH);
    exterior_portal.texture = portal_texture;

    node_t sphere;
    sphere.kind = node_t::REFLECTIVE;
    sphere.obj = generate_sphere();
    sphere.transform =
            glm::translate(glm::mat4(1), glm::vec3(0, 5, -15));
    sphere.texture = make_cubemap(SKYBOX_BASE_PATH);

    scene.children.push_back(exterior_portal);
    scene.children.push_back(exterior);
    scene.children.push_back(sphere);

    return scene;
}