#----------------------------------------------------------------
# Generated CMake target import file for configuration "Default".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "glfw" for configuration "Default"
set_property(TARGET glfw APPEND PROPERTY IMPORTED_CONFIGURATIONS DEFAULT)
set_target_properties(glfw PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEFAULT "C"
  IMPORTED_LOCATION_DEFAULT "${_IMPORT_PREFIX}/lib/libglfw3.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS glfw )
list(APPEND _IMPORT_CHECK_FILES_FOR_glfw "${_IMPORT_PREFIX}/lib/libglfw3.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
