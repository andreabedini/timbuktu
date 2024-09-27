# Experiments with Buck2

This repository contains some experiments with the Buck2 build system. I am
interested in how it can be used to build Haskell projects that use cabal.

In `Cabal/BUCK` I build Cabal-syntax from source using the Haskell rules from buck2's prelude.

In `projects/` I build few Haskell projects using the plan computed by cabal-install.
