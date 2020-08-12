include(ExternalProject)

if (MSVC)
    set(LINK_DIR_OPTION -LIBPATH:)
elseif()
    set(LINK_DIR_OPTION -L)
endif()

set(DEPENDENCY_INSTALL_DIR ${PROJECT_BINARY_DIR}/install)
set(DEPENDENCY_INCLUDE_DIR ${DEPENDENCY_INSTALL_DIR}/include)
set(DEPENDENCY_LIBS ${LINK_DIR_OPTION}${DEPENDENCY_INSTALL_DIR}/lib)

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
set(DEPENDENCY_LIBS ${DEPENDENCY_LIBS} spdlog$<$<CONFIG:Debug>:d>)

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
    GIT_TAG "v0.6.6"
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
