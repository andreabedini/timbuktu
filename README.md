# Experiments building Haskell with Buck2

This repository contains some experiments with the Buck2 build system. I am
interested in how it can be used to build Haskell projects that use cabal.

In `Cabal/BUCK` I build a couple of packages (alex, Cabal-syntax) from their
 online tarballs using the Haskell rules from buck2's prelude.

In `projects/` I build few Haskell projects mapping a build plan generated by
cabal-install into a buck2 target graph. This relies on Setup.hs for  building
package just like cabal-install does.

Not everything works at the moment and I keep reworking the code significantly.

## Instructions for testing

This repo assumes you have one or more versions of GHC installed with  version
suffixes (i.e. ghc-x.y.z, ghc-pkg-x.y.z). I install GHC with GHCup and it works
well.

- Generate the toolchain file for the `ghc` in path with:
```bash
$ runhaskell -- rules/haskell/helpers/import_toolchain.hs
```
or if you want to pick a different version 
```bash
$ runhaskell -- rules/haskell/helpers/import_toolchain.hs -w ghc-9.8.2
```
This script will create a file in `toolchains/ghc-x.y.z/BUCK` with the
definitions for the toolchain and the boot packages.

For the definitions to be prefix-independent a link is also created in
`toolchains/ghc-x.y.z/lib` pointing to the GHC's lib directory (e.g.
`$HOME/ghc/x.y.z/lib/ghc-x.y.z/lib`).

You can customise the default Haskell toolchain by changing the alias
in `toolchains/BUCK`.

Now you can try to build things, e.g. `buck2 build projects/shake/...`.

# Notes and rants

## `-package` vs `-package-id`

I keep fighting with the haskell rules in the prelude. I believe they are too
opionated and do not support more general use cases. In particular BUCK should
not use `-package` to pass dependencies to GHC since this will leave GHC to
figure out which unit to pick for a give package name. The build-system should
be extremely precise in the instructions it gives to the compiler.
The dependencies in both the global packagedb and cabal-install build plans are
indeed expressed in terms of unit-id, so I had to customise the prelude build
rules to use `-package-id` in place of `-pacakge.`
