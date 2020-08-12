#if WIN32
#define NOMINMAX
#endif

#include <spdlog/spdlog.h>
#include <nlohmann/json.hpp>
#include <ghc/filesystem.hpp>
#include <magic_enum.hpp>
#include <clipp.h>

int main(int argc, const char** argv) {
    SPDLOG_INFO("Hello, world!");
    return 0;
}