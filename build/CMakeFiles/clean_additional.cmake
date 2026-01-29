# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appSMAA_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appSMAA_autogen.dir\\ParseCache.txt"
  "appSMAA_autogen"
  )
endif()
