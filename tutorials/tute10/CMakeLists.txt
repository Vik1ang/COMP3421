cmake_minimum_required(VERSION 3.12)

project("COMP3421 Tutorial 10")

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

set(ACTIVITY tute10_bw)
add_executable(${ACTIVITY})
target_include_directories(${ACTIVITY} PUBLIC include)
target_sources(${ACTIVITY}
        ${target}
        PRIVATE
        include/tute10/memes.hpp
        include/tute10/model.hpp
        include/tute10/framebuffer.hpp
        include/tute10/renderer.hpp
        include/tute10/scene.hpp

        src/main.cpp
        src/memes.cpp
        src/model.cpp
        src/framebuffer.cpp
        src/renderer.cpp
        src/scene.cpp

        )
target_link_libraries(${ACTIVITY} PUBLIC ${COMMON_LIBS})
target_compile_options(
        ${ACTIVITY}
        PRIVATE
        -Wall -Wextra -pedantic -fvisibility=hidden -fdiagnostics-color=always -Wcast-align
        -Wconversion -Wdouble-promotion -Wshadow -Wsign-conversion -Wsign-promo -Wnull-dereference -Wodr
)