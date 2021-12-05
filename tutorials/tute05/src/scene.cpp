#include <tute05/scene.hpp>

const char *TRACK_PATH = "res/obj/race_scene/race_scene.obj";
const char *GT3_PATH = "res/obj/SPECTER_GT3_obj/SPECTER_GT3_.obj";
const char *SARU_PATH = "res/obj/saru/saru.obj";

scene_t make_scene() {
    camera_t cam = make_camera({ 20, 20, -5 }, { 0, 0, 0 });

    node_t gt3 = {
            node_t::CAR,
            load_obj(GT3_PATH),
            glm::translate(glm::mat4(1), {0, 0.5f, 0}),
            { }
    };

    node_t saru = {
            node_t::SARU,
            load_obj(SARU_PATH),
            glm::translate(glm::mat4(1), {0, 10.f, 0}),
            { }
    };

    node_t track = {
            node_t::TRACK,
            load_obj(TRACK_PATH),
            glm::mat4(1),
            { gt3, saru }};

    return scene_t{ cam, track };
}