load("@prelude//haskell/toolchain.bzl", "HaskellToolchainInfo")
load("@prelude//paths.bzl", "paths")
load("@prelude//rules.bzl", "http_archive")
load("metadata.bzl", "metadata")

def _host_arch() -> str:
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

def _host_os() -> str:
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
        os: [str, None],
        os_version: [str, None] = None) -> struct:
    arch = arch or _host_arch()
    os = os or _host_os()

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

def download_ghc_distribution(
        name: str,
        version: str,
        arch: [None, str] = None,
        os: [None, str] = None,
        os_version: [None, str] = None):
    arch = arch or _host_arch()
    os = os or _host_os()

    distribution = _get_distribution("GHC", version, arch, os, os_version)

    archive_name = paths.basename(distribution.url)

    http_archive(
        name = archive_name,
        urls = [distribution.url],
        sha256 = distribution.sha256,
        strip_prefix = distribution.subdir,
    )

    ghc_distribution(
        name = name,
        archive = ":" + archive_name,
        version = version,
        arch = arch,
        os = os,
        os_version = os_version,
    )

GhcDistributionInfo = provider(
    fields = ["archive", "version", "arch", "os", "os_version"],
)

def _ghc_distribution_impl(ctx: AnalysisContext) -> list[Provider]:
    archive = ctx.attrs.archive[DefaultInfo].default_outputs[0]
    return [
        ctx.attrs.archive[DefaultInfo],
        GhcDistributionInfo(
            archive = archive,
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
        "arch": attrs.string(),
        "os": attrs.string(),
        "os_version": attrs.option(attrs.string(), default = None),
    },
)

def _haskell_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    bindist = ctx.attrs.distribution[GhcDistributionInfo]
    ghc = bindist.archive.project("bin/ghc")
    ghc_pkg = bindist.archive.project("bin/ghc-pkg")
    haddoc = bindist.archive.project("bin/haddock")
    return [
        ctx.attrs.distribution[DefaultInfo],
        HaskellToolchainInfo(
            compiler = ghc,
            packager = ghc_pkg,
            linker = ghc,
            haddock = haddoc,
            compiler_flags = ctx.attrs.compiler_flags,
            linker_flags = ctx.attrs.linker_flags,
        ),
    ]

haskell_toolchain = rule(
    impl = _haskell_toolchain_impl,
    attrs = {
        "distribution": attrs.exec_dep(providers = [GhcDistributionInfo]),
        "compiler_flags": attrs.list(attrs.arg(), default=[]),
        "linker_flags": attrs.list(attrs.arg(), default=[]),
    },
    is_toolchain_rule = True,
)

def download_cabal_distribution(
        name: str,
        version: str,
        arch: [None, str] = None,
        os: [None, str] = None,
        os_version: [None, str] = None):
    arch = arch or _host_arch()
    os = os or _host_os()

    distribution = _get_distribution("Cabal", version, arch, os, os_version)

    archive_name = paths.basename(distribution.url)

    http_archive(
        name = archive_name,
        urls = [distribution.url],
        sha256 = distribution.sha256,
        strip_prefix = distribution.subdir,
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
    fields = ["archive", "version", "arch", "os", "os_version"],
)

def _cabal_distribution_impl(ctx: AnalysisContext) -> list[Provider]:
    archive = ctx.attrs.archive[DefaultInfo].default_outputs[0]
    cabal = archive.project("cabal")
    return [
        ctx.attrs.archive[DefaultInfo],
        RunInfo(args = cmd_args(cabal)),
        CabalDistributionInfo(
            archive = archive,
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

def _cabal_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    return [
        ctx.attrs.distribution[DefaultInfo],
        ctx.attrs.distribution[RunInfo],
        ctx.attrs.distribution[CabalDistributionInfo],
    ]

cabal_toolchain = rule(
    impl = _cabal_toolchain_impl,
    attrs = {
        "distribution": attrs.exec_dep(providers = [RunInfo, CabalDistributionInfo]),
    },
    is_toolchain_rule = True,
)
