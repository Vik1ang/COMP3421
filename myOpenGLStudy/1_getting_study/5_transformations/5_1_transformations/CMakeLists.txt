# get base name of current directory to use as target name
get_filename_component(target ${CMAKE_CURRENT_LIST_DIR} NAME)

# set the output folder
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target})

add_executable(${target})

target_sources(
        ${target}
        PRIVATE
        src/transformations.cpp
        src/filesystem.hpp
        src/shader_s.hpp
)

target_link_libraries(
        ${target}
        PUBLIC
        ${COMMON_LIBS}
)

copy_resources(${CMAKE_CURRENT_LIST_DIR}/res ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/res)