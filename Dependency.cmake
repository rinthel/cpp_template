include(ExternalProject)

if (MSVC)
    set(LINK_DIR_OPTION -LIBPATH:)
elseif()
    set(LINK_DIR_OPTION -L)
endif()

set(DEPENDENCY_INSTALL_DIR ${PROJECT_BINARY_DIR}/install)
set(DEPENDENCY_INCLUDE_DIR ${DEPENDENCY_INSTALL_DIR}/include)
set(DEPENDENCY_LIB_DIR ${DEPENDENCY_INSTALL_DIR}/lib)
# set(DEPENDENCY_LIBS ${LINK_DIR_OPTION}${DEPENDENCY_LIB_DIR})

# spdlog: fast logger library
ExternalProject_Add(
    dep-spdlog
    GIT_REPOSITORY "https://github.com/gabime/spdlog.git"
    GIT_TAG "v1.x"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${DEPENDENCY_INSTALL_DIR}
    TEST_COMMAND ""
)
set(DEPENDENCY_LIST ${DEPENDENCY_LIST} dep-spdlog)
# if (GENERATOR_IS_MULTI_CONFIG)
if (WIN32)
    set(DEPENDENCY_LIBS ${DEPENDENCY_LIBS} spdlog$<$<CONFIG:Debug>:d>)
else()
    set(DEPENDENCY_LIBS ${DEPENDENCY_LIBS} spdlog)
endif()

# clipp: header-only good c++ argument parser
ExternalProject_Add(
    dep-clipp
    GIT_REPOSITORY "https://github.com/muellan/clipp.git"
    GIT_TAG "v1.2.2"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND
        ${CMAKE_COMMAND} -E make_directory ${DEPENDENCY_INSTALL_DIR}/include &&
        ${CMAKE_COMMAND} -E copy
            ${CMAKE_CURRENT_BINARY_DIR}/dep-clipp-prefix/src/dep-clipp/include/clipp.h
            ${DEPENDENCY_INSTALL_DIR}/include
    TEST_COMMAND ""
    )
set(DEPENDENCY_LIST ${DEPENDENCY_LIST} dep-clipp)

# json: header-only json parser using modern c++
ExternalProject_Add(
    dep-json
    GIT_REPOSITORY "https://github.com/nlohmann/json.git"
    GIT_TAG "v3.9.0"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${DEPENDENCY_INSTALL_DIR}
        -DJSON_BuildTests=OFF
    TEST_COMMAND ""
    )
set(DEPENDENCY_LIST ${DEPENDENCY_LIST} dep-json)

# magic_enum: header-only enum class utility
ExternalProject_Add(
    dep_magic_enum
    GIT_REPOSITORY "https://github.com/Neargye/magic_enum.git"
    GIT_TAG "v0.7.3"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${DEPENDENCY_INSTALL_DIR}
        -DMAGIC_ENUM_OPT_BUILD_EXAMPLES=OFF
        -DMAGIC_ENUM_OPT_BUILD_TESTS=OFF
    TEST_COMMAND ""
    )
set(DEPENDENCY_LIST ${DEPENDENCY_LIST} dep_magic_enum)

# filesystem: c++14-based filesystem that implements c++17 filesystem
ExternalProject_Add(
    dep_filesystem
    GIT_REPOSITORY "https://github.com/gulrak/filesystem.git"
    GIT_TAG "v1.3.2"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${DEPENDENCY_INSTALL_DIR}
        -DGHC_FILESYSTEM_BUILD_TESTING=OFF
        -DGHC_FILESYSTEM_BUILD_EXAMPLES=OFF
    TEST_COMMAND ""
    )
set(DEPENDENCY_LIST ${DEPENDENCY_LIST} dep_filesystem)

# glfw
ExternalProject_Add(
    dep_glfw
    GIT_REPOSITORY "https://github.com/glfw/glfw.git"
    GIT_TAG "3.3-stable"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${DEPENDENCY_INSTALL_DIR}
        -DGLFW_BUILD_EXAMPLES=OFF
        -DGLFW_BUILD_TESTS=OFF
        -DGLFW_BUILD_DOCS=OFF
    TEST_COMMAND ""
    )
set(DEPENDENCY_LIST ${DEPENDENCY_LIST} dep_glfw)
set(DEPENDENCY_LIBS ${DEPENDENCY_LIBS} glfw3)

## additional dependencies, for graphics programming

# # stb: the king of header-only libraries
# ExternalProject_Add(
#     dep-stb
#     GIT_REPOSITORY "https://github.com/nothings/stb.git"
#     GIT_SHALLOW 1
#     UPDATE_COMMAND ""
#     PATCH_COMMAND ""
#     CONFIGURE_COMMAND ""
#     BUILD_COMMAND ""
#     INSTALL_COMMAND
#         ${CMAKE_COMMAND} -E make_directory ${DEPENDENCY_INSTALL_DIR}/include &&
#         ${CMAKE_COMMAND} -E copy
#             ${CMAKE_CURRENT_BINARY_DIR}/dep-stb-prefix/src/dep-stb/stb_image.h ${DEPENDENCY_INSTALL_DIR}/include
#             ${CMAKE_CURRENT_BINARY_DIR}/dep-stb-prefix/src/dep-stb/stb_truetype.h ${DEPENDENCY_INSTALL_DIR}/include
#     TEST_COMMAND ""
#     )
# set(DEPENDENCY_LIST ${DEPENDENCY_LIST} dep-stb)

# # linalg.h: single header, public domain, short vector math library for c++
# ExternalProject_Add(
#     dep-linalg
#     GIT_REPOSITORY "https://github.com/sgorsten/linalg.git"
#     GIT_TAG main
#     GIT_SHALLOW 1
#     UPDATE_COMMAND ""
#     PATCH_COMMAND ""
#     CONFIGURE_COMMAND ""
#     BUILD_COMMAND ""
#     INSTALL_COMMAND
#         ${CMAKE_COMMAND} -E make_directory ${DEPENDENCY_INSTALL_DIR}/include &&
#         ${CMAKE_COMMAND} -E copy
#             ${CMAKE_CURRENT_BINARY_DIR}/dep-linalg-prefix/src/dep-linalg/linalg.h ${DEPENDENCY_INSTALL_DIR}/include
#     TEST_COMMAND ""
#     )
# set(DEPENDENCY_LIST ${DEPENDENCY_LIST} dep-linalg)

# # imgui: best immediate-mode gui library for all graphics applications
# ExternalProject_Add(
#     dep-imgui
#     GIT_REPOSITORY "https://github.com/ocornut/imgui.git"
#     GIT_TAG v1.85
#     GIT_SHALLOW 1
#     UPDATE_COMMAND ""
#     PATCH_COMMAND
#         ${CMAKE_COMMAND} -E copy
#             ${CMAKE_CURRENT_SOURCE_DIR}/cmake/imgui.cmake
#             ${CMAKE_CURRENT_BINARY_DIR}/dep-imgui-prefix/src/dep-imgui/CMakeLists.txt
#     CMAKE_ARGS
#         -DCMAKE_INSTALL_PREFIX=${DEPENDENCY_INSTALL_DIR}
#         -DIMGUI_GLFW_INCLUDE_DIR=${DEPENDENCY_INCLUDE_DIR}
#         -DIMGUI_VULKAN_INCLUDE_DIR=${Vulkan_INCLUDE_DIR}
#     TEST_COMMAND ""
#     )
# add_dependencies(dep-imgui dep-glfw)
# set(DEPENDENCY_LIST ${DEPENDENCY_LIST} dep-imgui)
# set(DEPENDENCY_LIBS ${DEPENDENCY_LIBS} imgui)