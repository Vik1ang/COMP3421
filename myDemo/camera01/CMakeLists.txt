# get base name of current directory to use as target name
get_filename_component(target ${CMAKE_CURRENT_LIST_DIR} NAME)

# set the output folder
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target})

add_executable(${target})

include_directories(${CMAKE_CURRENT_LIST_DIR} ./include)

target_sources(
        ${target}
        PRIVATE
        src/main.cpp

        src/imgui.cpp
        src/imgui.h
        src/imgui.cpp
        src/imgui_demo.cpp
        src/imgui_draw.cpp
        src/imgui_impl_glfw.cpp
        src/imgui_impl_glfw.h
        src/imgui_impl_opengl3.cpp
        src/imgui_impl_opengl3.h
        src/imgui_impl_opengl3_loader.h
        src/imgui_internal.h
        src/imgui_tables.cpp
        src/imgui_widgets.cpp
        src/imstb_rectpack.h
        src/imstb_textedit.h
        src/imstb_truetype.h

)

target_link_libraries(
        ${target}
        PUBLIC
        ${COMMON_LIBS}
)


copy_resources(${CMAKE_CURRENT_LIST_DIR}/res ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/res)