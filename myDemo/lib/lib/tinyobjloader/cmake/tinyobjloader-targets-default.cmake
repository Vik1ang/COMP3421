#----------------------------------------------------------------
# Generated CMake target import file for configuration "Default".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "tinyobjloader::tinyobjloader" for configuration "Default"
set_property(TARGET tinyobjloader::tinyobjloader APPEND PROPERTY IMPORTED_CONFIGURATIONS DEFAULT)
set_target_properties(tinyobjloader::tinyobjloader PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEFAULT "CXX"
  IMPORTED_LOCATION_DEFAULT "${_IMPORT_PREFIX}/lib/libtinyobjloader.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS tinyobjloader::tinyobjloader )
list(APPEND _IMPORT_CHECK_FILES_FOR_tinyobjloader::tinyobjloader "${_IMPORT_PREFIX}/lib/libtinyobjloader.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
