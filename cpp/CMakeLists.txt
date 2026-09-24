cmake_minimum_required(VERSION 3.16)
project(starter_cpp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(starter src/starter.cpp)
target_include_directories(starter PUBLIC include)
if(MSVC)
  target_compile_options(starter PRIVATE /W4)
else()
  target_compile_options(starter PRIVATE -Wall -Wextra -Werror)
endif()

add_executable(starter_cli src/main.cpp)
target_link_libraries(starter_cli PRIVATE starter)

add_executable(starter_tests tests/test_starter.cpp)
target_link_libraries(starter_tests PRIVATE starter)
enable_testing()
add_test(NAME starter_tests COMMAND starter_tests)
