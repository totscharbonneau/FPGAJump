cmake_minimum_required(VERSION 3.14)
project(unit_tests_cpp)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)

# Fetch GTest
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

# Compile all cpp files as a lib
set(headers
  ../s4InfoAtelier4/project/src/tile/tile_sheet/tile_sheet.h
  ../s4InfoAtelier4/project/src/tile/tile_info.h
  ../s4InfoAtelier4/project/src/constants.h
  ../s4InfoAtelier4/project/src/structs.h
)
set(sources
  ../s4InfoAtelier4/project/src/tile/tile_sheet/tile_sheet.cpp
  ../s4InfoAtelier4/project/src/tile/tile_info.cpp
)
add_library(cpp_lib ${sources} ${headers})

# Compile all tests files as an executable
set(test_files
  test_tile_sheet.cpp
)
add_executable(all_unit_tests ${test_files})

# Link lib so we can use the include
target_link_libraries(all_unit_tests cpp_lib GTest::gtest_main)

include(GoogleTest)
gtest_discover_tests(all_unit_tests)