# cpp_template

cmake-based c++ project template

### Feature

- Easy integration with 3rd-party projects using `ExternalProject_Add()`
  (See `Dependency.cmake`)
- Can be used in Windows/MSVC, macOS/clang, and linux/gcc
- Provide collections of good 3rd-party libraries
  - [spdlog](https://github.com/gabime/spdlog.git): logging
  - [clipp](https://github.com/muellan/clipp.git): argument parsing
  - [json](https://github.com/nlohmann/json.git): json parsing
  - [magic_enum](https://github.com/Neargye/magic_enum.git): enum utility
  - [filesystem](https://github.com/gulrak/filesystem.git): c++17 filesystem implementation
- Optimal setting for VSCode (includes `.vscode/settings.json`)

### How to use

- Clone this project
- Copy whole files in the projects
- Open your project on VSCode
- Edit project name in `CMakeLists.txt`
- Enjoy!
