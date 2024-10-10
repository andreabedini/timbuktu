load("@prelude//cxx:headers.bzl", "CHeader")
load(
    "@prelude//cxx:preprocessor.bzl",
    "CPreprocessor",
    "CPreprocessorArgs",
    "CPreprocessorInfo",
    "CPreprocessorTSet",
)
load("@prelude//haskell:library_info.bzl", "HaskellLibraryProvider")
load("@prelude//linking:link_info.bzl", "LinkStyle")

###
### NOTE: GHC already defines these macros!
###

Version = record(x = int, y = int, z = int)

def version_to_string(v: Version) -> str:
    return "{}.{}.{}".format(v.x, v.y, v.z)

def version_from_string(s: str) -> Version:
    nums = s.split(".")
    nums.extend([0, 0, 0])
    return Version(x = int(nums[0]), y = int(nums[1]), z = int(nums[2]))

PackageInfo = record(name = str, version = Version, mangledName = str)

def haskellLibraryProviderToPackageInfo(info: HaskellLibraryProvider) -> PackageInfo:
    name, version, _ = info.lib[LinkStyle("static")].name.split("-")
    return PackageInfo(
        name = name,
        version = version_from_string(version),
        mangledName = name,  # FIXME
    )

CabalMacroContext = record(
    package_version = str,
    package_key = str | None,
    component_id = str | None,
    deps = list[PackageInfo],
    exe_deps = list[PackageInfo],
)

def cabal_macros_gen(m: CabalMacroContext) -> str:
    s = ""
    for p in m.deps:
        s += "/* package {}-{} */".format(p.name, version_to_string(p.version))
        s += """
#ifndef VERSION_{name}
#define VERSION_{name} "{version}"
#endif /* VERSION_{name} */
""".format(name = p.mangledName, version = version_to_string(p.version))
        s += """
#ifndef MIN_VERSION_{name}
#define MIN_VERSION_{name}(x,y,z) ((x) < {x} || (x) == {x} && (y) < {y} || (x) == {x} && (y) == {y} && (z) <= {z})
#endif /* MIN_VERSION_{name} */
""".format(name = p.mangledName, x = p.version.x, y = p.version.y, z = p.version.z)
    for p in m.exe_deps:
        s += "/* tool {}-{} */".format(p.name, version_to_string(p.version))
        s += """
#ifndef TOOL_VERSION_{name}
#define TOOL_VERSION_{name} "{version}"
#endif /* TOOL_VERSION_{name} */
""".format(name = p.mangledName, version = version_to_string(p.version))
        s += """
#ifndef MIN_TOOL_VERSION_{name}
#define MIN_TOOL_VERSION_{name}(x,y,z) ((x) < {x} || (x) == {x} && (y) < {y} || (x) == {x} && (y) == {y} && (z) <= {z})
#endif /* MIN_TOOL_VERSION_{name} */
""".format(name = p.mangledName, x = p.version.x, y = p.version.y, z = p.version.z)
    if m.package_key:
        s += """
#ifndef CURRENT_PACKAGE_KEY
#define CURRENT_PACKAGE_KEY "{}"
#endif /* CURRENT_PACKAGE_KEY */
""".format(m.package_key)
    if m.component_id:
        s += """
#ifndef CURRENT_COMPONENT_ID
#define CURRENT_COMPONENT_ID "{}"
#endif /* CURRENT_COMPONENT_ID */
""".format(m.component_id)
    s += """
#ifndef CURRENT_PACKAGE_VERSION
#define CURRENT_PACKAGE_VERSION "{}"
#endif /* CURRENT_PACKAGE_VERSION */
""".format(m.package_version)

def _cabal_macros_impl(ctx: AnalysisContext) -> list[Provider]:
    deps = [haskellLibraryProviderToPackageInfo(d[HaskellLibraryProvider]) for d in ctx.attrs.deps]
    exe_deps = [haskellLibraryProviderToPackageInfo(d[HaskellLibraryProvider]) for d in ctx.attrs.exe_deps]
    s = cabal_macros_gen(
        CabalMacroContext(
            package_version = ctx.attrs.package_version,
            package_key = ctx.attrs.package_key,
            component_id = ctx.attrs.component_id,
            deps = deps,
            exe_deps = exe_deps,
        ),
    )
    out = ctx.actions.write("cabal_macros.h", s)

    return [
        DefaultInfo(default_output = out),
        CPreprocessorInfo(
            set = ctx.actions.tset(
                CPreprocessorTSet,
                value = [
                    CPreprocessor(
                        args = CPreprocessorArgs(args = ["-include", out]),
                        headers = [CHeader(artifact = out, name = "cabal_macros.h", namespace = "alex", named = True)],
                    ),
                ],
            ),
        ),
    ]

cabal_macros = rule(
    impl = _cabal_macros_impl,
    attrs = {
        "package_name": attrs.string(),
        "package_version": attrs.string(),
        "package_key": attrs.option(attrs.string(), default = None),
        "component_id": attrs.option(attrs.string(), default = None),
        "deps": attrs.list(attrs.dep(providers = [HaskellLibraryProvider]), default = []),
        "exe_deps": attrs.list(attrs.dep(providers = [HaskellLibraryProvider]), default = []),
    },
)
