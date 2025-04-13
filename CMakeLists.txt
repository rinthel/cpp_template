cmake_minimum_required(VERSION 3.10)

set(PROJECT_NAME cpp_template)
set(CMAKE_CXX_STANDARD 20)
## for debugging build script
# set(CMAKE_VERBOSE_MAKEFILE ON) 

project(${PROJECT_NAME})
include(Dependency.cmake)

message("dep includes: ${DEPENDENCY_INCLUDE_DIR}")
message("dep libs: ${DEPENDENCY_LIBS}")

add_executable(${PROJECT_NAME}
    src/main.cpp
    )

target_include_directories(${PROJECT_NAME} PUBLIC ${DEPENDENCY_INCLUDE_DIR})
target_link_directories(${PROJECT_NAME} PUBLIC ${DEPENDENCY_LIB_DIR})
target_link_libraries(${PROJECT_NAME} PUBLIC ${DEPENDENCY_LIBS})

add_dependencies(${PROJECT_NAME} ${DEPENDENCY_LIST})

if (MSVC)
    target_compile_options(${PROJECT_NAME} PUBLIC /wd4566 /wd4819 /wd4251 /wd4244 /wd4267)
endif(MSVC)
