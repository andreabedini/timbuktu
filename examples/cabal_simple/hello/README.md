# hello

A local package with a bit of everything a component can have: a sublibrary,
C sources with a header and a `cpp-options` define, an `.hsc` module for
hsc2hs, a Template Haskell splice that reads a file, data files and the
generated `Paths_hello` module, an executable and a test suite.

```bash
$ buck2 run //examples/cabal_simple/hello:exe
$ buck2 test //examples/cabal_simple/hello:hello-test
```

[`BUCK`](BUCK) is a transcription of [`hello.cabal`](hello.cabal), which is
here so that `cabal build` can be run on the same sources and compared. Each
stanza becomes a target, each field an attribute:

```cabal
library
  exposed-modules:  Hello
                    Hello.Sizes
  other-modules:    Hello.Internal
                    Paths_hello
  autogen-modules:  Paths_hello
  hs-source-dirs:   src
  build-depends:    base, hello:internal
  c-sources:        cbits/hello.c
  include-dirs:     include
  cpp-options:      -DGREETING_SUFFIX="!"
  ghc-options:      -Wall
  default-language: Haskell2010
```

```python
cabal_simple_library(
    name = "lib",
    package = ":hello",
    exposed_modules = ["Hello", "Hello.Sizes"],
    other_modules = ["Hello.Internal", "Paths_hello"],
    autogen_modules = ["Paths_hello"],
    hs_source_dirs = ["src"],
    build_depends = [":base", ":internal"],
    c_sources = ["cbits/hello.c"],
    include_dirs = ["include"],
    cpp_options = ["-DGREETING_SUFFIX=\"!\""],
    ghc_options = ["-Wall"],
    default_language = "Haskell2010",
)
```

`package = ":hello"` points at the `cabal_package` target, which holds the
package fields and the source tree. In `build_depends`, `:internal` is the
sublibrary (`hello:internal` in the `.cabal` file) and `:base` a
`haskell_unit`: `base` comes with the compiler, and its version and unit-id
are read from the compiler's package db during the build.

The library is also what [`../../interop`](../../interop) builds on with the
prelude rules.
