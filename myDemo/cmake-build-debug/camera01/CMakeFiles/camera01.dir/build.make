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
CMAKE_COMMAND = "/Users/weiqiangzhuang/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/212.4746.93/CLion.app/Contents/bin/cmake/mac/bin/cmake"

# The command to remove a file.
RM = "/Users/weiqiangzhuang/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/212.4746.93/CLion.app/Contents/bin/cmake/mac/bin/cmake" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug

# Include any dependencies generated for this target.
include camera01/CMakeFiles/camera01.dir/depend.make
# Include the progress variables for this target.
include camera01/CMakeFiles/camera01.dir/progress.make

# Include the compile flags for this target's objects.
include camera01/CMakeFiles/camera01.dir/flags.make

camera01/CMakeFiles/camera01.dir/src/main.cpp.o: camera01/CMakeFiles/camera01.dir/flags.make
camera01/CMakeFiles/camera01.dir/src/main.cpp.o: ../camera01/src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object camera01/CMakeFiles/camera01.dir/src/main.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera01.dir/src/main.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/main.cpp

camera01/CMakeFiles/camera01.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera01.dir/src/main.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/main.cpp > CMakeFiles/camera01.dir/src/main.cpp.i

camera01/CMakeFiles/camera01.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera01.dir/src/main.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/main.cpp -o CMakeFiles/camera01.dir/src/main.cpp.s

camera01/CMakeFiles/camera01.dir/src/imgui.cpp.o: camera01/CMakeFiles/camera01.dir/flags.make
camera01/CMakeFiles/camera01.dir/src/imgui.cpp.o: ../camera01/src/imgui.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object camera01/CMakeFiles/camera01.dir/src/imgui.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera01.dir/src/imgui.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui.cpp

camera01/CMakeFiles/camera01.dir/src/imgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera01.dir/src/imgui.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui.cpp > CMakeFiles/camera01.dir/src/imgui.cpp.i

camera01/CMakeFiles/camera01.dir/src/imgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera01.dir/src/imgui.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui.cpp -o CMakeFiles/camera01.dir/src/imgui.cpp.s

camera01/CMakeFiles/camera01.dir/src/imgui_demo.cpp.o: camera01/CMakeFiles/camera01.dir/flags.make
camera01/CMakeFiles/camera01.dir/src/imgui_demo.cpp.o: ../camera01/src/imgui_demo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object camera01/CMakeFiles/camera01.dir/src/imgui_demo.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera01.dir/src/imgui_demo.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_demo.cpp

camera01/CMakeFiles/camera01.dir/src/imgui_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera01.dir/src/imgui_demo.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_demo.cpp > CMakeFiles/camera01.dir/src/imgui_demo.cpp.i

camera01/CMakeFiles/camera01.dir/src/imgui_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera01.dir/src/imgui_demo.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_demo.cpp -o CMakeFiles/camera01.dir/src/imgui_demo.cpp.s

camera01/CMakeFiles/camera01.dir/src/imgui_draw.cpp.o: camera01/CMakeFiles/camera01.dir/flags.make
camera01/CMakeFiles/camera01.dir/src/imgui_draw.cpp.o: ../camera01/src/imgui_draw.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object camera01/CMakeFiles/camera01.dir/src/imgui_draw.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera01.dir/src/imgui_draw.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_draw.cpp

camera01/CMakeFiles/camera01.dir/src/imgui_draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera01.dir/src/imgui_draw.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_draw.cpp > CMakeFiles/camera01.dir/src/imgui_draw.cpp.i

camera01/CMakeFiles/camera01.dir/src/imgui_draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera01.dir/src/imgui_draw.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_draw.cpp -o CMakeFiles/camera01.dir/src/imgui_draw.cpp.s

camera01/CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.o: camera01/CMakeFiles/camera01.dir/flags.make
camera01/CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.o: ../camera01/src/imgui_impl_glfw.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object camera01/CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_impl_glfw.cpp

camera01/CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_impl_glfw.cpp > CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.i

camera01/CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_impl_glfw.cpp -o CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.s

camera01/CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.o: camera01/CMakeFiles/camera01.dir/flags.make
camera01/CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.o: ../camera01/src/imgui_impl_opengl3.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object camera01/CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_impl_opengl3.cpp

camera01/CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_impl_opengl3.cpp > CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.i

camera01/CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_impl_opengl3.cpp -o CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.s

camera01/CMakeFiles/camera01.dir/src/imgui_tables.cpp.o: camera01/CMakeFiles/camera01.dir/flags.make
camera01/CMakeFiles/camera01.dir/src/imgui_tables.cpp.o: ../camera01/src/imgui_tables.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object camera01/CMakeFiles/camera01.dir/src/imgui_tables.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera01.dir/src/imgui_tables.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_tables.cpp

camera01/CMakeFiles/camera01.dir/src/imgui_tables.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera01.dir/src/imgui_tables.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_tables.cpp > CMakeFiles/camera01.dir/src/imgui_tables.cpp.i

camera01/CMakeFiles/camera01.dir/src/imgui_tables.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera01.dir/src/imgui_tables.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_tables.cpp -o CMakeFiles/camera01.dir/src/imgui_tables.cpp.s

camera01/CMakeFiles/camera01.dir/src/imgui_widgets.cpp.o: camera01/CMakeFiles/camera01.dir/flags.make
camera01/CMakeFiles/camera01.dir/src/imgui_widgets.cpp.o: ../camera01/src/imgui_widgets.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object camera01/CMakeFiles/camera01.dir/src/imgui_widgets.cpp.o"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera01.dir/src/imgui_widgets.cpp.o -c /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_widgets.cpp

camera01/CMakeFiles/camera01.dir/src/imgui_widgets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera01.dir/src/imgui_widgets.cpp.i"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_widgets.cpp > CMakeFiles/camera01.dir/src/imgui_widgets.cpp.i

camera01/CMakeFiles/camera01.dir/src/imgui_widgets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera01.dir/src/imgui_widgets.cpp.s"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01/src/imgui_widgets.cpp -o CMakeFiles/camera01.dir/src/imgui_widgets.cpp.s

# Object files for target camera01
camera01_OBJECTS = \
"CMakeFiles/camera01.dir/src/main.cpp.o" \
"CMakeFiles/camera01.dir/src/imgui.cpp.o" \
"CMakeFiles/camera01.dir/src/imgui_demo.cpp.o" \
"CMakeFiles/camera01.dir/src/imgui_draw.cpp.o" \
"CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.o" \
"CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.o" \
"CMakeFiles/camera01.dir/src/imgui_tables.cpp.o" \
"CMakeFiles/camera01.dir/src/imgui_widgets.cpp.o"

# External object files for target camera01
camera01_EXTERNAL_OBJECTS =

../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/src/main.cpp.o
../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/src/imgui.cpp.o
../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/src/imgui_demo.cpp.o
../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/src/imgui_draw.cpp.o
../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/src/imgui_impl_glfw.cpp.o
../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/src/imgui_impl_opengl3.cpp.o
../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/src/imgui_tables.cpp.o
../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/src/imgui_widgets.cpp.o
../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/build.make
../bin/camera01/camera01: ../lib/lib/libglad.a
../bin/camera01/camera01: ../lib/lib/libglfw3.a
../bin/camera01/camera01: ../lib/lib/libstb.a
../bin/camera01/camera01: ../lib/lib/libchicken3421.a
../bin/camera01/camera01: ../lib/lib/libglad.a
../bin/camera01/camera01: ../lib/lib/libglfw3.a
../bin/camera01/camera01: ../lib/lib/libstb.a
../bin/camera01/camera01: ../lib/lib/libtinyobjloader.a
../bin/camera01/camera01: camera01/CMakeFiles/camera01.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable ../../bin/camera01/camera01"
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/camera01.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
camera01/CMakeFiles/camera01.dir/build: ../bin/camera01/camera01
.PHONY : camera01/CMakeFiles/camera01.dir/build

camera01/CMakeFiles/camera01.dir/clean:
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 && $(CMAKE_COMMAND) -P CMakeFiles/camera01.dir/cmake_clean.cmake
.PHONY : camera01/CMakeFiles/camera01.dir/clean

camera01/CMakeFiles/camera01.dir/depend:
	cd /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/camera01 /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01 /Users/weiqiangzhuang/Doc/UNSW/COMP3421/myDemo/cmake-build-debug/camera01/CMakeFiles/camera01.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : camera01/CMakeFiles/camera01.dir/depend

