# CMAKE generated file: DO NOT EDIT!
# Generated by CMake Version 3.20
cmake_policy(SET CMP0009 NEW)

# res_list at cmake/copy_resources.cmake:2 (file)
file(GLOB_RECURSE NEW_GLOB LIST_DIRECTORIES false RELATIVE "/Users/weiqiangzhuang/Doc/UNSW/COMP3421/tutorials/tute09/res" "/Users/weiqiangzhuang/Doc/UNSW/COMP3421/tutorials/tute09/res/*")
set(OLD_GLOB
  "obj/exterior/GRASS.jpg"
  "obj/exterior/exterior.mtl"
  "obj/exterior/exterior.obj"
  "obj/exterior/exterior_portal.mtl"
  "obj/exterior/exterior_portal.obj"
  "obj/exterior/hilly_terrain_01.jpg"
  "obj/interior/ceiling.jpg"
  "obj/interior/display.png"
  "obj/interior/interior.mtl"
  "obj/interior/interior.obj"
  "obj/interior/interior_portal.mtl"
  "obj/interior/interior_portal.obj"
  "obj/interior/wall.jpg"
  "shaders/portal.frag"
  "shaders/portal.vert"
  "shaders/reflective.frag"
  "shaders/reflective.vert"
  "shaders/static_mesh.frag"
  "shaders/static_mesh.vert"
  "skybox/sky_back.jpg"
  "skybox/sky_bottom.jpg"
  "skybox/sky_front.jpg"
  "skybox/sky_left.jpg"
  "skybox/sky_right.jpg"
  "skybox/sky_top.jpg"
  "textures/marccoin.png"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "/Users/weiqiangzhuang/Doc/UNSW/COMP3421/tutorials/tute09/cmake-build-debug/CMakeFiles/cmake.verify_globs")
endif()