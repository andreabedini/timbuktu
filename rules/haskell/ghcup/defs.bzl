load("@prelude//paths.bzl", "paths")
load("@prelude//rules.bzl", "http_archive")
load("metadata.bzl", "metadata")

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

_metadata_arch_map = {
    "x86_64": "A_64",
    "i386": "A_32",
    "aarch64": "A_ARM64",
    "arm": "A_ARM",
}

_metadata_os_map = {
    "linux": "Linux",
    "windows": "Windows",
    "macos": "Darwin",
}

def _get_distribution(
        tool: str,
        version: str,
        arch: str,
        os: str,
        os_version: [str, None] = None) -> struct:
    if not tool in metadata:
        fail("Unknown tool '{}'. Available tools: {}".format(tool, ", ".join(metadata.keys())))
    t = metadata[tool]

    if not version in t:
        fail("Unknown version '{}'. Available versions: {}".format(version, ", ".join(t.keys())))
    v = t[version]

    archs = v["viArch"]

    arch_ = _metadata_arch_map[arch]
    if arch_ not in archs:
        fail("Unsupported arch '{}'. Supported architectures: {}".format(arch, ", ".join(archs.keys())))
    a = archs[arch_]

    os_ = _metadata_os_map[os]
    if os_ == "Linux":
        os_ += "_UnknownLinux"

    if not os_ in a:
        fail("Unsupported os '{}'. Supported operating systems: {}".format(os, ", ".join(a.keys())))
    o = a[os_]

    os_version = os_version or "unknown_versioning"

    if not os_version in o:
        fail("Unsupported os version '{}'. Supported version: {}".format(os_version, ", ".join(o.keys())))
    d = o[os_version]

    return struct(
        url = d["dlUri"],
        sha256 = d["dlHash"],
        subdir = d.get("dlSubdir"),
    )

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

# Older binary distributions (9.6, for one) cannot be used where they are
# unpacked: `lib/settings` and the package db cache are written by their
# `./configure && make install`. With `configure = True` the archive is
# copied, and those two are made in the copy, which is then used in place
# like a newer distribution. 9.12 has them already.
def download_ghc_distribution(
        name: str,
        version: str,
        arch: [None, str] = None,
        os: [None, str] = None,
        os_version: [None, str] = None,
        configure: bool = False):
    if not arch:
        arch = host_arch()

    if not os:
        os = host_os()

    archive_name = name + "-archive"
    bindist = _get_distribution("GHC", version, arch, os, os_version)

    http_archive(
        name = archive_name,
        urls = [bindist.url],
        sha256 = bindist.sha256,
        strip_prefix = bindist.subdir,
        # What haskell_ghci wants as targets of their own.
        sub_targets = GHC_DISTRIBUTION_SUB_TARGETS,
    )

    if configure:
        configure_ghc_distribution(
            name = name + "-configured",
            archive = ":" + archive_name,
        )
        archive_name = name + "-configured"

    ghc_distribution(
        name = name,
        archive = ":" + archive_name,
        version = version,
        arch = arch,
        os = os,
        os_version = os_version,
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
        "os_version": provider_field(typing.Any, default = None),
    },
)

def _ghc_distribution_impl(ctx: AnalysisContext) -> list[Provider]:
    return [
        ctx.attrs.archive[DefaultInfo],
        GhcDistributionInfo(
            version = ctx.attrs.version,
            arch = ctx.attrs.arch,
            os = ctx.attrs.os,
            os_version = ctx.attrs.os_version,
        ),
    ]

ghc_distribution = rule(
    impl = _ghc_distribution_impl,
    attrs = {
        "archive": attrs.dep(providers = [DefaultInfo]),
        "version": attrs.string(),
        "arch": attrs.option(attrs.string()),
        "os": attrs.option(attrs.string()),
        "os_version": attrs.option(attrs.string(), default = None),
    },
)

##
## Cabal
##

def download_cabal_distribution(
        name: str,
        version: str,
        arch: [None, str] = None,
        os: [None, str] = None,
        os_version: [None, str] = None):
    if not arch:
        arch = host_arch()

    if not os:
        os = host_os()

    archive_name = name + "-archive"
    bindist = _get_distribution("Cabal", version, arch, os, os_version)

    http_archive(
        name = archive_name,
        urls = [bindist.url],
        sha256 = bindist.sha256,
        strip_prefix = bindist.subdir,
    )

    cabal_distribution(
        name = name,
        archive = ":" + archive_name,
        version = version,
        arch = arch,
        os = os,
        os_version = os_version,
    )

CabalDistributionInfo = provider(
    fields = {
        "version": provider_field(str),
        "arch": provider_field(str),
        "os": provider_field(str),
        "os_version": provider_field(typing.Any, default = None),
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
            os_version = ctx.attrs.os_version,
        ),
    ]

cabal_distribution = rule(
    impl = _cabal_distribution_impl,
    attrs = {
        "archive": attrs.dep(providers = [DefaultInfo]),
        "version": attrs.string(),
        "arch": attrs.string(),
        "os": attrs.string(),
        "os_version": attrs.option(attrs.string(), default = None),
    },
)
