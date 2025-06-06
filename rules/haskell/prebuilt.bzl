load("@prelude//haskell/toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//paths.bzl", "paths")
load("@prelude//rules.bzl", "haskell_prebuilt_library")

def _prebuilt_impl(ctx: AnalysisContext):
    bindist = ctx.attrs._haskell_toolchain[DefaultInfo].default_outputs[0]

    anon_target = ctx.actions.anon_target(haskell_prebuilt_library, {
        # this does not work
        "name": "xhtml", 
        "version": "3000.2.2.1",
        "id": "xhtml-3000.2.2.1-e764",
        "db": bindist.project("lib/package.conf.d"),
        "deps": [],
        # "import_dirs": bindist.project("lib/x86_64-linux-ghc-9.10.1/xhtml-3000.2.2.1-e764"),
        "shared_libs": {
            "libHSxhtml-3000.2.2.1-e764-ghc9.10.1.so": bindist.project("lib/x86_64-linux-ghc-9.10.1/libHSxhtml-3000.2.2.1-e764-ghc9.10.1.so"),
        },
        "static_libs": [
            bindist.project("lib/x86_64-linux-ghc-9.10.1/xhtml-3000.2.2.1-e764/libHSxhtml-3000.2.2.1-e764.a")
        ],
        "profiled_static_libs": [
            bindist.project("lib/x86_64-linux-ghc-9.10.1/xhtml-3000.2.2.1-e764/libHSxhtml-3000.2.2.1-e764_p.a")
        ],
    })
    return anon_target.promise

prebuilt = rule(
    impl = _prebuilt_impl,
    attrs = {
        "_haskell_toolchain": attrs.toolchain_dep(default = "toolchains//:haskell", providers = [HaskellToolchainInfo, HaskellPlatformInfo]),
    },
)
