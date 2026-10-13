"""
Running describe_package (root//rules/haskell/helpers:describe_package) on a
.cabal file, for the GHC of a toolchain: the action both generators declare,
generate.bxl for a package and plan.bxl for the local packages of a plan.
"""

load("//rules/haskell:toolchain.bzl", "GhcToolchainInfo")

def describe_package(
        actions: AnalysisActions,
        helper: RunInfo,
        ghc: GhcToolchainInfo,
        cabal: Artifact,
        flags: str,
        name: str = "description.json") -> Artifact:
    """Declare the action that describes a package.

    Args:
      actions: where to declare it
      helper: describe_package
      ghc: the compiler whose version the conditionals are resolved for
      cabal: the .cabal file
      flags: the flags of the package, as `+a -b`
      name: the name of the output, when there are several
    Returns:
      what describe_package prints, in JSON
    """
    description = actions.declare_output(name)
    actions.run(
        cmd_args(
            "sh",
            "-c",
            'helper=$1; shift; out=$1; shift; version=$("$@" --numeric-version); exec $helper "$CABAL" --ghc-version "$version" --flags "$FLAGS" > "$out"',
            "--",
            cmd_args(helper, delimiter = " "),
            description.as_output(),
            ghc.ghc,
        ),
        env = {"CABAL": cabal, "FLAGS": flags},
        category = "describe_package",
        identifier = name,
        local_only = True,
    )
    return description
