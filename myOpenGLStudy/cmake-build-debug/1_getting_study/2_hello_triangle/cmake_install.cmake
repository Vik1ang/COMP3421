# Install script for directory: /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/1_getting_study/2_hello_triangle

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/2_hello_triangle/2_1_hello_triangle/cmake_install.cmake")
  include("/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/2_hello_triangle/2_2_hello_triangle_indexed/cmake_install.cmake")
  include("/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/2_hello_triangle/2_3_hello_triangle_exercise1/cmake_install.cmake")
  include("/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/2_hello_triangle/2_4_hello_triangle_exercise2/cmake_install.cmake")
  include("/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/2_hello_triangle/2_5_hello_triangle_exercise3/cmake_install.cmake")

endif()

