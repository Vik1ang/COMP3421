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
include 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/depend.make
# Include the progress variables for this target.
include 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/progress.make

# Include the compile flags for this target's objects.
include 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/flags.make

2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.o: 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/flags.make
2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.o: ../2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/src/basic_lighting_diffuse.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/src/basic_lighting_diffuse.cpp

2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/src/basic_lighting_diffuse.cpp > CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.i

2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/src/basic_lighting_diffuse.cpp -o CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.s

# Object files for target 2_1_basic_lighting_diffuse
2_1_basic_lighting_diffuse_OBJECTS = \
"CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.o"

# External object files for target 2_1_basic_lighting_diffuse
2_1_basic_lighting_diffuse_EXTERNAL_OBJECTS =

../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/src/basic_lighting_diffuse.cpp.o
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/build.make
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: ../lib/lib/libglad.a
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: ../lib/lib/libglfw3.a
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: ../lib/lib/libstb.a
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: ../lib/lib/libchicken3421.a
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: ../lib/lib/libglad.a
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: ../lib/lib/libglfw3.a
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: ../lib/lib/libstb.a
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: ../lib/lib/libtinyobjloader.a
../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse: 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/2_1_basic_lighting_diffuse.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/build: ../bin/2_lighting/1_colors/2_1_basic_lighting_diffuse/2_1_basic_lighting_diffuse
.PHONY : 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/build

2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/clean:
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse && $(CMAKE_COMMAND) -P CMakeFiles/2_1_basic_lighting_diffuse.dir/cmake_clean.cmake
.PHONY : 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/clean

2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/depend:
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : 2_lighting/2_basic_lighting/2_1_basic_lighting_diffuse/CMakeFiles/2_1_basic_lighting_diffuse.dir/depend

