"""
The GHC toolchain used by the cabal_simple rules.

Cabal's configure step asks the compiler what it is and what it comes with
(`ghc --numeric-version`, `ghc-pkg dump`). We do the same, and since the answer
is only known after running those commands, it is exposed as a dynamic value.
"""

GhcPackage = record(
    id = str,
    name = str,
    version = str,
    depends = list[str],
    include_dirs = list[str],
    # As in the registration: `A B` or `A, B from unit-id:C`
    exposed_modules = str,
)

GhcDynamicInfo = provider(
    doc = "What we learn about a GHC installation by running it.",
    fields = {
        # The unit-id of each package in the global package db, by name.
        "by_name": provider_field(dict[str, str]),
        # The global package db, by unit-id.
        "packages": provider_field(dict[str, GhcPackage]),
        # E.g. "9.12.2"
        "version": provider_field(str),
    },
)

GhcToolchainInfo = provider(
    # @unsorted-dict-items
    fields = {
        "ghc": provider_field(RunInfo),
        "ghc_pkg": provider_field(RunInfo),
        "hsc2hs": provider_field(RunInfo),
        "ar": provider_field(RunInfo),
        # Resolves to GhcDynamicInfo
        "dynamic": provider_field(DynamicValue),
    },
)

def parse_installed_package_infos(text: str) -> list[dict[str, str]]:
    """Parse the output of `ghc-pkg dump`.

    Args:
      text: a sequence of InstalledPackageInfo separated by `---`
    Returns:
      one dictionary of fields for each package. The lines of a multi-line
      field are joined with spaces.
    """
    pkgs = []
    fields = {}
    key = None
    for line in text.splitlines():
        if line == "---":
            pkgs.append(fields)
            fields = {}
            key = None
        elif line[:1] in (" ", "\t"):
            if key:
                fields[key] = (fields[key] + " " + line.strip()).strip()
        elif ":" in line:
            key, _, value = line.partition(":")
            fields[key] = value.strip()
    if fields:
        pkgs.append(fields)
    return pkgs

def _ghc_dynamic_info_impl(
        actions: AnalysisActions,
        version: ArtifactValue,
        global_package_db: ArtifactValue) -> list[Provider]:
    _unused = actions  # buildifier: disable=unused-variable
    packages = {}
    by_name = {}
    for fields in parse_installed_package_infos(global_package_db.read_string()):
        pkg = GhcPackage(
            id = fields["id"],
            name = fields["name"],
            version = fields["version"],
            depends = fields.get("depends", "").split(),
            include_dirs = fields.get("include-dirs", "").split(),
            exposed_modules = fields.get("exposed-modules", ""),
        )
        packages[pkg.id] = pkg
        by_name[pkg.name] = pkg.id
    return [
        GhcDynamicInfo(
            version = version.read_string().strip(),
            packages = packages,
            by_name = by_name,
        ),
    ]

_ghc_dynamic_info = dynamic_actions(
    impl = _ghc_dynamic_info_impl,
    attrs = {
        "global_package_db": dynattrs.artifact_value(),
        "version": dynattrs.artifact_value(),
    },
)

def _capture(ctx: AnalysisContext, name: str, cmd: cmd_args) -> Artifact:
    out = ctx.actions.declare_output(name)
    ctx.actions.run(
        cmd_args("sh", "-c", cmd_args(cmd, ">", out.as_output(), delimiter = " ")),
        category = "ghc_info",
        identifier = name,
        # The answer depends on what is installed on this machine.
        local_only = True,
    )
    return out

def ghc_toolchain_providers(
        ctx: AnalysisContext,
        ghc: RunInfo,
        ghc_pkg: RunInfo,
        hsc2hs: RunInfo,
        ar: RunInfo) -> list[Provider]:
    version = _capture(ctx, "version", cmd_args(ghc, "--numeric-version"))
    global_package_db = _capture(
        ctx,
        "global-package-db",
        cmd_args(ghc_pkg, "dump", "--global", "--expand-pkgroot"),
    )
    return [
        DefaultInfo(sub_targets = {
            "global-package-db": [DefaultInfo(default_output = global_package_db)],
            "version": [DefaultInfo(default_output = version)],
        }),
        GhcToolchainInfo(
            ghc = ghc,
            ghc_pkg = ghc_pkg,
            hsc2hs = hsc2hs,
            ar = ar,
            dynamic = ctx.actions.dynamic_output_new(_ghc_dynamic_info(
                version = version,
                global_package_db = global_package_db,
            )),
        ),
    ]

def _system_ghc_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    return ghc_toolchain_providers(
        ctx,
        ghc = RunInfo(args = [ctx.attrs.ghc]),
        ghc_pkg = RunInfo(args = [ctx.attrs.ghc_pkg]),
        hsc2hs = RunInfo(args = [ctx.attrs.hsc2hs]),
        ar = RunInfo(args = [ctx.attrs.ar]),
    )

system_ghc_toolchain = rule(
    doc = "Use the GHC found in PATH. Not hermetic.",
    impl = _system_ghc_toolchain_impl,
    attrs = {
        "ar": attrs.string(default = "ar"),
        "ghc": attrs.string(default = "ghc"),
        "ghc_pkg": attrs.string(default = "ghc-pkg"),
        "hsc2hs": attrs.string(default = "hsc2hs"),
    },
    is_toolchain_rule = True,
)

def _bindist_ghc_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    bindist = ctx.attrs.distribution[DefaultInfo].default_outputs[0]
    return ghc_toolchain_providers(
        ctx,
        ghc = RunInfo(args = [bindist.project("bin/ghc")]),
        ghc_pkg = RunInfo(args = [bindist.project("bin/ghc-pkg")]),
        hsc2hs = RunInfo(args = [bindist.project("bin/hsc2hs")]),
        ar = RunInfo(args = [ctx.attrs.ar]),
    )

bindist_ghc_toolchain = rule(
    doc = "Use an unpacked GHC binary distribution, e.g. one from toolchains//ghcup.",
    impl = _bindist_ghc_toolchain_impl,
    attrs = {
        "ar": attrs.string(default = "ar"),
        "distribution": attrs.exec_dep(),
    },
    is_toolchain_rule = True,
)

# Which toolchain to use can be changed in .buckconfig or on the command line:
#
#   buck2 build --config cabal.ghc_toolchain=toolchains//:ghc-9.12.2-bindist ...
ghc_toolchain_attrs = {
    "_ghc": attrs.toolchain_dep(
        default = read_root_config("cabal", "ghc_toolchain", "toolchains//:ghc"),
        providers = [GhcToolchainInfo],
    ),
}
