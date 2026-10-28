#include "twice.h"

#include <numeric>
#include <vector>

// Uses the C++ standard library, so that linking it takes libstdc++.
extern "C" int twice(int x) {
  std::vector<int> xs{x, x};
  return std::accumulate(xs.begin(), xs.end(), 0);
}
