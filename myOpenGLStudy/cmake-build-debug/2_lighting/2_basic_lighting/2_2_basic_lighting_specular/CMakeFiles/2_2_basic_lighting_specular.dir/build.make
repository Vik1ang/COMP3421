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
include 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/depend.make
# Include the progress variables for this target.
include 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/progress.make

# Include the compile flags for this target's objects.
include 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/flags.make

2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.o: 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/flags.make
2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.o: ../2_lighting/2_basic_lighting/2_2_basic_lighting_specular/src/basic_lighting_specular.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_2_basic_lighting_specular && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/2_lighting/2_basic_lighting/2_2_basic_lighting_specular/src/basic_lighting_specular.cpp

2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_2_basic_lighting_specular && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/2_lighting/2_basic_lighting/2_2_basic_lighting_specular/src/basic_lighting_specular.cpp > CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.i

2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_2_basic_lighting_specular && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/2_lighting/2_basic_lighting/2_2_basic_lighting_specular/src/basic_lighting_specular.cpp -o CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.s

# Object files for target 2_2_basic_lighting_specular
2_2_basic_lighting_specular_OBJECTS = \
"CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.o"

# External object files for target 2_2_basic_lighting_specular
2_2_basic_lighting_specular_EXTERNAL_OBJECTS =

../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/src/basic_lighting_specular.cpp.o
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/build.make
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: ../lib/lib/libglad.a
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: ../lib/lib/libglfw3.a
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: ../lib/lib/libstb.a
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: ../lib/lib/libchicken3421.a
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: ../lib/lib/libglad.a
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: ../lib/lib/libglfw3.a
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: ../lib/lib/libstb.a
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: ../lib/lib/libtinyobjloader.a
../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular: 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_2_basic_lighting_specular && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/2_2_basic_lighting_specular.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/build: ../bin/2_lighting/1_colors/2_2_basic_lighting_specular/2_2_basic_lighting_specular
.PHONY : 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/build

2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/clean:
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_2_basic_lighting_specular && $(CMAKE_COMMAND) -P CMakeFiles/2_2_basic_lighting_specular.dir/cmake_clean.cmake
.PHONY : 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/clean

2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/depend:
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/2_lighting/2_basic_lighting/2_2_basic_lighting_specular /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_2_basic_lighting_specular /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myOpenGLStudy/cmake-build-debug/2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : 2_lighting/2_basic_lighting/2_2_basic_lighting_specular/CMakeFiles/2_2_basic_lighting_specular.dir/depend
