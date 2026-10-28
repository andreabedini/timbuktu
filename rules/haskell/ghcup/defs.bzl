"""
Binary distributions of GHC and cabal-install, as GHCup has them.

The distributions are pinned in a package of their own, written by
ghcup.bxl (toolchains/ghcup/BUCK here): one `ghc_bindist` or
`cabal_bindist` for each version, with the URL, sha256 and top directory
of its archive for each platform in PLATFORMS. Toolchains are made from
those targets by hand (see toolchains/BUCK):

    ghc_toolchain(
        name = "ghc-9.6.7",
        distribution = "//ghcup:ghc-9.6.7",
    )
"""

load("@prelude//rules.bzl", "http_archive")

def host_arch() -> str:
    arch = host_info().arch
    if arch.is_x86_64:
        return "x86_64"
    elif host_info().arch.is_aarch64:
        return "aarch64"
    elif host_info().arch.is_arm:
        return "armv7a"
    elif host_info().arch.is_i386:
        return "i386"
    else:
        fail("Unsupported host architecture.")

def host_os() -> str:
    os = host_info().os
    if os.is_freebsd:
        return "freebsd"
    elif os.is_linux:
        return "linux"
    elif os.is_macos:
        return "macos"
    elif os.is_windows:
        return "windows"
    else:
        fail("Unsupported host os.")

# The platforms a distribution can be pinned for: the configuration of each
# (the config_settings of rules/haskell/ghcup/BUCK), and its arch and OS.
PLATFORMS = {
    "linux-aarch64": struct(setting = "root//rules/haskell/ghcup:linux-aarch64", arch = "aarch64", os = "linux"),
    "linux-x86_64": struct(setting = "root//rules/haskell/ghcup:linux-x86_64", arch = "x86_64", os = "linux"),
    "macos-aarch64": struct(setting = "root//rules/haskell/ghcup:macos-aarch64", arch = "aarch64", os = "macos"),
    "macos-x86_64": struct(setting = "root//rules/haskell/ghcup:macos-x86_64", arch = "x86_64", os = "macos"),
}

def _per_platform(bindists: dict, value):
    """A select() of `value(platform, bindist)` over the platforms of
    `bindists`. There is no default: on another platform it fails."""
    return select({PLATFORMS[p].setting: value(p, b) for p, b in bindists.items()})

def _archive(name: str, bindists: dict, **kwargs):
    http_archive(
        name = name,
        urls = _per_platform(bindists, lambda _p, b: [b["url"]]),
        sha256 = _per_platform(bindists, lambda _p, b: b["sha256"]),
        strip_prefix = _per_platform(bindists, lambda _p, b: b.get("strip_prefix")),
        **kwargs
    )

# What ghcup.bxl reads back from a distribution it wrote.
_PINNED_ATTRS = {
    "bindists": attrs.dict(
        attrs.string(),
        attrs.dict(attrs.string(), attrs.string()),
        default = {},
        doc = "Platform name to the url, sha256 and strip_prefix of its archive, as pinned by ghcup.bxl.",
    ),
}

##
## GHC
##

GHC_DISTRIBUTION_SUB_TARGETS = [
    "bin/ghc",
    "bin/ghc-iserv",
    "bin/ghc-iserv-prof",
    "bin/ghc-pkg",
    "lib",
]

def ghc_bindist(
        name: str,
        version: str,
        bindists: dict[str, dict[str, str]],
        configure: bool = False,
        visibility: list[str] = ["PUBLIC"]):
    """A GHC binary distribution, unpacked and usable where it is.

    Older distributions (9.6, for one) cannot be used where they are
    unpacked: `lib/settings` and the package db cache are written by their
    `./configure && make install`. With `configure = True` the archive is
    copied, and those two are made in the copy.

    Args:
        name: the target, a ghc_distribution.
        version: the version of GHC.
        bindists: platform name (in PLATFORMS) to the url, sha256 and
            strip_prefix of its archive.
        configure: whether the archive needs ./configure.
        visibility: of the ghc_distribution.
    """
    archive = name + "-archive"
    _archive(
        name = archive,
        bindists = bindists,
        # What haskell_ghci wants as targets of their own.
        sub_targets = GHC_DISTRIBUTION_SUB_TARGETS,
    )

    if configure:
        configure_ghc_distribution(
            name = name + "-configured",
            archive = ":" + archive,
        )
        archive = name + "-configured"

    ghc_distribution(
        name = name,
        archive = ":" + archive,
        version = version,
        arch = _per_platform(bindists, lambda p, _b: PLATFORMS[p].arch),
        os = _per_platform(bindists, lambda p, _b: PLATFORMS[p].os),
        bindists = bindists,
        configure = configure,
        visibility = visibility,
    )

def _configure_ghc_distribution_impl(ctx: AnalysisContext) -> list[Provider]:
    out = ctx.actions.declare_output("ghc", dir = True)
    script = ctx.actions.write(
        "configure.sh",
        [
            "set -eu",
            "cp -a --reflink=auto \"$1\" \"$2\"",
            "cd \"$2\"",
            "./configure >&2",
            "make lib/settings >&2",
            "bin/ghc-pkg recache --global >&2",
        ],
    )
    ctx.actions.run(
        cmd_args("/bin/sh", script, ctx.attrs.archive[DefaultInfo].default_outputs[0], out.as_output()),
        category = "ghc_configure",
        # It runs the C compiler and the tools configure finds in PATH.
        local_only = True,
    )
    return [DefaultInfo(
        default_output = out,
        sub_targets = {
            p: [DefaultInfo(default_output = out.project(p))]
            for p in GHC_DISTRIBUTION_SUB_TARGETS
        },
    )]

configure_ghc_distribution = rule(
    impl = _configure_ghc_distribution_impl,
    attrs = {
        "archive": attrs.dep(providers = [DefaultInfo]),
    },
)

GhcDistributionInfo = provider(
    # @unsorted-dict-items
    fields = {
        "version": provider_field(typing.Any, default = None),
        "arch": provider_field(typing.Any, default = None),
        "os": provider_field(typing.Any, default = None),
    },
)

def _ghc_distribution_impl(ctx: AnalysisContext) -> list[Provider]:
    return [
        ctx.attrs.archive[DefaultInfo],
        GhcDistributionInfo(
            version = ctx.attrs.version,
            arch = ctx.attrs.arch,
            os = ctx.attrs.os,
        ),
    ]

ghc_distribution = rule(
    impl = _ghc_distribution_impl,
    attrs = {
        "archive": attrs.dep(providers = [DefaultInfo]),
        "version": attrs.string(),
        "arch": attrs.option(attrs.string()),
        "os": attrs.option(attrs.string()),
        "configure": attrs.bool(default = False, doc = "Whether `archive` is the configured copy, see ghc_bindist."),
    } | _PINNED_ATTRS,
)

##
## Cabal
##

def cabal_bindist(
        name: str,
        version: str,
        bindists: dict[str, dict[str, str]],
        visibility: list[str] = ["PUBLIC"]):
    """A cabal-install binary distribution.

    Args:
        name: the target, a cabal_distribution.
        version: the version of cabal-install.
        bindists: platform name (in PLATFORMS) to the url, sha256 and
            strip_prefix of its archive.
        visibility: of the cabal_distribution.
    """
    archive = name + "-archive"
    _archive(
        name = archive,
        bindists = bindists,
    )

    cabal_distribution(
        name = name,
        archive = ":" + archive,
        version = version,
        arch = _per_platform(bindists, lambda p, _b: PLATFORMS[p].arch),
        os = _per_platform(bindists, lambda p, _b: PLATFORMS[p].os),
        bindists = bindists,
        visibility = visibility,
    )

CabalDistributionInfo = provider(
    fields = {
        "version": provider_field(str),
        "arch": provider_field(str),
        "os": provider_field(str),
    },
)

def _cabal_distribution_impl(ctx: AnalysisContext) -> list[Provider]:
    archive = ctx.attrs.archive[DefaultInfo].default_outputs[0]
    cabal = archive.project("cabal")
    return [
        ctx.attrs.archive[DefaultInfo],
        RunInfo(args = cmd_args(cabal)),
        CabalDistributionInfo(
            version = ctx.attrs.version,
            arch = ctx.attrs.arch,
            os = ctx.attrs.os,
        ),
    ]

cabal_distribution = rule(
    impl = _cabal_distribution_impl,
    attrs = {
        "archive": attrs.dep(providers = [DefaultInfo]),
        "version": attrs.string(),
        "arch": attrs.string(),
        "os": attrs.string(),
    } | _PINNED_ATTRS,
)
