set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/1.getting_study)

add_executable(hello_window 1.1_hello_window/hello_window.cpp)
target_link_libraries(hello_window PUBLIC glad glfw)