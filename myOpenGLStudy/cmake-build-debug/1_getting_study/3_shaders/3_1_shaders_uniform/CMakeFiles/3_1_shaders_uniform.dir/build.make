# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/Users/weiqiangzhuang/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/212.5457.51/CLion.app/Contents/bin/cmake/mac/bin/cmake"

# The command to remove a file.
RM = "/Users/weiqiangzhuang/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/212.5457.51/CLion.app/Contents/bin/cmake/mac/bin/cmake" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug

# Include any dependencies generated for this target.
include 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/depend.make
# Include the progress variables for this target.
include 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/progress.make

# Include the compile flags for this target's objects.
include 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/flags.make

1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.o: 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/flags.make
1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.o: ../1_getting_study/3_shaders/3_1_shaders_uniform/src/shaders_uniform.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/3_shaders/3_1_shaders_uniform && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/1_getting_study/3_shaders/3_1_shaders_uniform/src/shaders_uniform.cpp

1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/3_shaders/3_1_shaders_uniform && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/1_getting_study/3_shaders/3_1_shaders_uniform/src/shaders_uniform.cpp > CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.i

1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/3_shaders/3_1_shaders_uniform && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/1_getting_study/3_shaders/3_1_shaders_uniform/src/shaders_uniform.cpp -o CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.s

# Object files for target 3_1_shaders_uniform
3_1_shaders_uniform_OBJECTS = \
"CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.o"

# External object files for target 3_1_shaders_uniform
3_1_shaders_uniform_EXTERNAL_OBJECTS =

../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/src/shaders_uniform.cpp.o
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/build.make
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: ../lib/lib/libglad.a
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: ../lib/lib/libglfw3.a
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: ../lib/lib/libstb.a
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: ../lib/lib/libchicken3421.a
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: ../lib/lib/libglad.a
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: ../lib/lib/libglfw3.a
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: ../lib/lib/libstb.a
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: ../lib/lib/libtinyobjloader.a
../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform: 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/3_shaders/3_1_shaders_uniform && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/3_1_shaders_uniform.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/build: ../bin/1_getting_study/3_shaders/3_1_shaders_uniform/3_1_shaders_uniform
.PHONY : 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/build

1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/clean:
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/3_shaders/3_1_shaders_uniform && $(CMAKE_COMMAND) -P CMakeFiles/3_1_shaders_uniform.dir/cmake_clean.cmake
.PHONY : 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/clean

1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/depend:
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/1_getting_study/3_shaders/3_1_shaders_uniform /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/3_shaders/3_1_shaders_uniform /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : 1_getting_study/3_shaders/3_1_shaders_uniform/CMakeFiles/3_1_shaders_uniform.dir/depend

