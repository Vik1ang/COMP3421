cmake_minimum_required(VERSION 3.12)
project("obj demo")

set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

# If I was better at CMake I would make this nicer
if (NOT (EXISTS ${PROJECT_SOURCE_DIR}/lib))
    message(FATAL_ERROR "Dependencies not found. Please run fetch_deps.sh [-G Ninja] from the project root and reconfigure")
endif ()

find_package(glad REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(glfw3 REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(glm REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(stb REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(tinyobjloader REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(chicken3421 REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)

set(COMMON_LIBS glad::glad glm::glm glfw stb tinyobjloader::tinyobjloader chicken3421)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)

include(copy_resources)
copy_resources(${CMAKE_CURRENT_LIST_DIR}/res ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/res)

set(ACTIVITY obj_load)
add_executable(${ACTIVITY})
target_include_directories(${ACTIVITY} PUBLIC include)
target_sources(${ACTIVITY}
        ${target}
        PRIVATE

        include/objDemo/memes.hpp
        include/objDemo/camera.hpp
        include/objDemo/model.hpp
        include/objDemo/scene.hpp
        include/objDemo/animator.hpp
        include/objDemo/renderer.hpp

        src/memes.cpp
        src/camera.cpp
        src/model.cpp
        src/scene.cpp
        src/animator.cpp
        src/renderer.cpp

        src/main.cpp

        src/ImGui/imgui.cpp
        src/ImGui/imgui.h
        src/ImGui/imgui.cpp
        src/ImGui/imgui_demo.cpp
        src/ImGui/imgui_draw.cpp
        src/ImGui/imgui_impl_glfw.cpp
        src/ImGui/imgui_impl_glfw.h
        src/ImGui/imgui_impl_opengl3.cpp
        src/ImGui/imgui_impl_opengl3.h
        src/ImGui/imgui_impl_opengl3_loader.h
        src/ImGui/imgui_internal.h
        src/ImGui/imgui_tables.cpp
        src/ImGui/imgui_widgets.cpp
        src/ImGui/imstb_rectpack.h
        src/ImGui/imstb_textedit.h
        src/ImGui/imstb_truetype.h
        )
target_link_libraries(${ACTIVITY} PUBLIC ${COMMON_LIBS})
target_compile_options(
        ${ACTIVITY}
        PRIVATE
        -Wall -Wextra -pedantic -fvisibility=hidden -fdiagnostics-color=always -Wcast-align
        -Wconversion -Wdouble-promotion -Wshadow -Wsign-conversion -Wsign-promo -Wnull-dereference -Wodr
)