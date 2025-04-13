#if WIN32
#define NOMINMAX
#endif

#include <spdlog/spdlog.h>

#define SDL_MAIN_HANDLED
#include <SDL3/SDL.h>

int main(int argc, const char** argv) {
    SPDLOG_INFO("Initialize SDL3");

    SDL_Init(SDL_INIT_VIDEO);
    auto window = SDL_CreateWindow("CPP template", 1280, 720, 0);

    SDL_Event e;
    bool bQuit = false;
    // main loop
    while (!bQuit) {
        // Handle events on queue
        while (SDL_PollEvent(&e) != 0) {
            // close the window when user alt-f4s or clicks the X button
            if (e.type == SDL_EVENT_QUIT)
                bQuit = true;
        }
    }

    SDL_DestroyWindow(window);
    return 0;
}

