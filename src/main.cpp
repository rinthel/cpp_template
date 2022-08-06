#if WIN32
#define NOMINMAX
#endif

#include <spdlog/spdlog.h>
#include <nlohmann/json.hpp>
#include <ghc/filesystem.hpp>
#include <magic_enum.hpp>
#include <clipp.h>
#include <GLFW/glfw3.h>

int main(int argc, const char** argv) {
    SPDLOG_INFO("Initialize glfw");
    if (!glfwInit()) {
        const char* description = nullptr;
        glfwGetError(&description);
        SPDLOG_ERROR("failed to initialize glfw: {}", description);
        return -1;
    }

    auto window = glfwCreateWindow(640, 480, "First window", nullptr, nullptr);
    if (!window) {
        SPDLOG_ERROR("failed to create glfw window");
        glfwTerminate();
        return -1;
    }

    while (!glfwWindowShouldClose(window)) {
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}

