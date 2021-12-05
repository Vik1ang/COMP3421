# get base name of current directory to use as target name
get_filename_component(target ${CMAKE_CURRENT_LIST_DIR} NAME)

# set the output folder to be bin/playground/${target}
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target})

# add the exectuable file to bin/playground/${target}/ folder
add_executable(${target})

# add cpp and hpp files here
target_sources(
        ${target}
        PRIVATE
        src/main.cpp
)

# add any extra libraries here
target_link_libraries(
        ${target}
        PUBLIC
        ${COMMON_LIBS}
)

# copy and resources found in the res/ folder into the corresonding folder inside the bin/ folder
copy_resources(${CMAKE_CURRENT_LIST_DIR}/res ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/res)
