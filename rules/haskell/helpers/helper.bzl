"""
The helpers the rules run, built with the GHC of the tools.

toolchains//:haskell selects the GHC of the tools on the constraint
timbuktu//rules/haskell/helpers:yes, and every other target gets the GHC of
the packages, exec deps too: the build tools of a plan (happy, alex, hsc2hs)
are packages of the plan, for its GHC. A helper is a haskell_binary behind a
target whose rule puts that constraint in the configuration.
"""

load("//rules/haskell:defs.bzl", "haskell_binary")

def _helper_transition_impl(platform: PlatformInfo, refs: struct) -> PlatformInfo:
    value = refs.helper[ConstraintValueInfo]
    constraints = dict(platform.configuration.constraints)
    constraints[value.setting.label] = value
    return PlatformInfo(
        label = platform.label if platform.label.endswith("-helper") else platform.label + "-helper",
        configuration = ConfigurationInfo(
            constraints = constraints,
            values = platform.configuration.values,
        ),
    )

_helper_transition = transition(
    impl = _helper_transition_impl,
    refs = {"helper": "timbuktu//rules/haskell/helpers:yes"},
)

_helper = rule(
    impl = lambda ctx: ctx.attrs.actual.providers,
    attrs = {"actual": attrs.dep()},
    cfg = _helper_transition,
)

def haskell_helper(name: str, visibility: list[str] = [], **kwargs):
    """A haskell_binary, `name` + "-bin", built with the GHC of the tools,
    as `name`.

    Args:
        name: the helper
        visibility: of the helper
        **kwargs: of the haskell_binary
    """
    haskell_binary(name = name + "-bin", **kwargs)
    _helper(name = name, actual = ":" + name + "-bin", visibility = visibility)
