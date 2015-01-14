##  OpenCV
find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})
list(APPEND PTAM_EXTERNAL_LIBS ${OpenCV_LIBRARIES})
get_filename_component(OpenCV_BINARY_DIR "${OpenCV_LIB_DIR}/../bin" ABSOLUTE)
list(APPEND THE_DEPEDENCIES_BINARY_PATHS ${OpenCV_BINARY_DIR})
message("Found OpenCV libs:${OpenCV_LIBRARIES}")
message("OpenCV INC DIRS: ${OpenCV_INCLUDE_DIRS}")

# OpenGL
find_package(OpenGL REQUIRED)
message(STATUS "Found OpenGL ? ${OPENGL_FOUND}")
if(OPENGL_FOUND)
  message(STATUS "OpenGL INCLUDE: ${OPENGL_INCLUDE_DIR}")
  include_directories(${OPENGL_INCLUDE_DIR})
  list(APPEND PTAM_EXTERNAL_LIBS ${OPENGL_LIBRARIES})
  get_filename_component(OpenCV_BINARY_DIR "${OpenCV_LIB_DIR}/../bin" ABSOLUTE)
  list(APPEND THE_DEPEDENCIES_BINARY_PATHS ${OpenCV_BINARY_DIR})
endif()

# GLUT
find_package(GLUT REQUIRED)
if(GLUT_FOUND)
  include_directories(${GLUT_INCLUDE_DIR})
  list(APPEND PTAM_EXTERNAL_LIBS ${GLUT_LIBRARIES})
  if( CMAKE_SIZEOF_VOID_P EQUAL 8 )
    get_filename_component(GLUT_BINARY_DIR "${GLUT_INCLUDE_DIR}/../lib/x64" ABSOLUTE)
  else()
    get_filename_component(GLUT_BINARY_DIR "${GLUT_INCLUDE_DIR}/../lib/x86" ABSOLUTE)
  endif()
  list(APPEND THE_DEPEDENCIES_BINARY_PATHS ${GLUT_BINARY_DIR})
endif()

# GLEW
if(WIN32)
  # GLEW
  find_package(GLEW REQUIRED)
  if(GLEW_FOUND)
    include_directories(${GLEW_INCLUDE_DIR})
    list(APPEND PTAM_EXTERNAL_LIBS ${GLEW_LIBRARIES})
    if( CMAKE_SIZEOF_VOID_P EQUAL 8 )
      get_filename_component(GLUT_BINARY_DIR "${GLUT_INCLUDE_DIR}/../bin/Release/x64" ABSOLUTE)
    else()
      get_filename_component(GLEW_BINARY_DIR "${GLEW_INCLUDE_DIR}/../bin/Release/Win32" ABSOLUTE)
    endif()
    list(APPEND THE_DEPEDENCIES_BINARY_PATHS ${GLEW_BINARY_DIR})
  endif()
endif()