# A package that uses a C++ library

`uses-cxx.cabal` names its C++ library in `pkgconfig-depends`, as a package
using a library from pkg-config would. Here the library is a Buck2 target,
`:twice` (a `cxx_library`, written by hand), and the generator puts it in the
`cxx_deps` of the component that names it:

```bash
$ buck2 bxl //rules/haskell/cabal/generate.bxl:generate -- --cabal-file examples/cabal_simple/cxx/uses-cxx.cabal --pkgconfig twice=:twice
```

pkg-config is not run. With `cxx_deps`, the rules:

- compile `cxx-sources` (and `c-sources`, and run hsc2hs) with the headers
  of the libraries: `cbits/wrap.cpp` includes `twice.h`;
- put the libraries in the registration of the library, as
  `extra-libraries` found in a directory of their archives, so that GHC
  links them after the library, into whatever uses it: the executable
  `twice` here;
- link them into the shared object of the library, so that GHC can run the
  C++ code in Template Haskell: the test suite does, in a splice.

```bash
$ buck2 run //examples/cabal_simple/cxx:exe
42
$ buck2 test //examples/cabal_simple/cxx:uses-cxx-test
```
