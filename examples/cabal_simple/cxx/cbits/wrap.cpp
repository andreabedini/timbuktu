// A cxx-source of the Haskell library, compiled against the header of the
// C++ library.
#include "twice.h"

extern "C" int hs_twice(int x) { return twice(x); }
