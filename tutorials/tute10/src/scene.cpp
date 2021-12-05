#include <tute10/scene.hpp>

#include <fstream>
#include <iterator>

namespace {
    const char *SKY_PATH = "res/textures/sky/";
    const char *WALL_BRICK_PATH = "res/textures/wall/bricks.jpg";
    const char *POSTER_FRONT_PATH = "res/textures/wall/poster_front.jpg";
    const char *POSTER_BACK_PATH = "res/textures/wall/poster_back.dat";
}

std::vector<unsigned char> get_secret(const std::string &path) {
    std::ifstream is{ path, std::ios::binary | std::ios::ate};
    int sz = is.tellg();
    std::vector<char> data(sz, 0);
    is.seekg(0);
    is.read(data.data(), sz);

    return std::vector<unsigned char>(data.begin(), data.end());
}

scene_t make_scene() {
    chicken3421::camera_t cam = chicken3421::make_camera({ 0, 0, 30 }, { 0, 0, 0 });

    model_t skybox = make_skybox(SKY_PATH);

    node_t poster_front = {
            node_t::POSTER,
            make_volume({ 12, 12, 0, true }, { POSTER_FRONT_PATH }),
            { },
            glm::translate(glm::mat4(1), { 0, 0, 0.6 }),
    };

    node_t poster_back = {
            node_t::POSTER,
            make_volume({ 24, 12, 0, true }, { "", get_secret(POSTER_BACK_PATH) }),
            { },
            glm::translate(glm::mat4(1), { 0, 0, -0.6 }) * glm::rotate(glm::mat4(1), glm::pi<float>(), { 0, 1, 0 }),
    };

    node_t wall = {
            node_t::WALL,
            make_volume({ 28, 16, 0.5 }, { WALL_BRICK_PATH }),
            { poster_front, poster_back },
            glm::mat4(1),
    };

    return { cam, skybox, wall };
}