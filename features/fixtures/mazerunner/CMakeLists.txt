cmake_minimum_required(VERSION 3.4.1)

add_library(entrypoint SHARED
             src/main/cpp/entrypoint.cpp
             src/main/cpp/bugsnags.cpp)

add_library(lib_bugsnag SHARED IMPORTED)
set(BUGSNAG_LIB_DIR
    ${CMAKE_SOURCE_DIR}/build/intermediates/bugsnag-libs)
set(BUGSNAG_INCLUDE_DIR ${BUGSNAG_LIB_DIR}/assets/include)
set_target_properties(lib_bugsnag PROPERTIES IMPORTED_LOCATION
                      ${BUGSNAG_LIB_DIR}/jni/${ANDROID_ABI}/libbugsnag-ndk.so)
target_include_directories(entrypoint PRIVATE ${BUGSNAG_INCLUDE_DIR})
target_link_libraries(entrypoint lib_bugsnag)

add_library(lib_monochrome SHARED IMPORTED)
set_target_properties(lib_monochrome PROPERTIES IMPORTED_LOCATION
                      ${CMAKE_SOURCE_DIR}/libs/${ANDROID_ABI}/libmonochrome.so)
target_link_libraries(entrypoint lib_monochrome)

