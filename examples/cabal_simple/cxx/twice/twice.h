#pragma once

// A C++ library with a C interface, built by a cxx_library target.

#define TWICE_FACTOR 2

#ifdef __cplusplus
extern "C" {
#endif

int twice(int x);

#ifdef __cplusplus
}
#endif
