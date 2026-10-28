module Factor (factor) where

-- The test suite does not name the C++ library: its headers come with
-- uses-cxx, as the include directories of a library from pkg-config come
-- with the package that names it.
#include "twice.h"

factor :: Int
factor = #{const TWICE_FACTOR}
