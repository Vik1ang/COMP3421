#----------------------------------------------------------------
# Generated CMake target import file for configuration "Default".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "glad::glad" for configuration "Default"
set_property(TARGET glad::glad APPEND PROPERTY IMPORTED_CONFIGURATIONS DEFAULT)
set_target_properties(glad::glad PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEFAULT "C"
  IMPORTED_LOCATION_DEFAULT "${_IMPORT_PREFIX}/lib/libglad.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS glad::glad )
list(APPEND _IMPORT_CHECK_FILES_FOR_glad::glad "${_IMPORT_PREFIX}/lib/libglad.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
