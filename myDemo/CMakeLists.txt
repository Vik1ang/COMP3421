cmake_minimum_required(VERSION 3.12)

project("My Demo")

set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

# If I was better at CMake I would make this nicer
if (NOT (EXISTS ${PROJECT_SOURCE_DIR}/lib))
    message(STATUS "Dependencies not found. Please run fetch_deps.sh [-G Ninja] from the project root and reconfigure")
endif ()

find_package(glad REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(glfw3 REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(glm REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(stb REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(tinyobjloader REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)
find_package(chicken3421 REQUIRED HINTS ${PROJECT_SOURCE_DIR}/lib)

set(COMMON_LIBS glad::glad glm::glm glfw stb chicken3421)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)

include(copy_resources)
copy_resources(${CMAKE_CURRENT_LIST_DIR}/res ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/res)

include_directories(${CMAKE_BINARY_DIR}/configuration)

add_subdirectory(camera01)
