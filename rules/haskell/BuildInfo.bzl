"""
BuildInfo
"""

# https://hackage.haskell.org/package/Cabal-syntax-3.14.0.0/docs/Distribution-Types-BuildInfo.html
BuildInfo = record(
    buildable = bool,
    build_depends = typing.Any,
    build_tool_depends = typing.Any,
    pkgconfig_depends = typing.Any,
    cpp_options = list[str],
    asm_options = list[str],
    cmm_options = list[str],
    cc_options = list[str],
    cxx_options = list[str],
    ld_options = list[str],
    hsc2hs_options = list[str],
    frameworks = typing.Any,
    extra_framework_dirs = typing.Any,
    asm_sources = typing.Any,
    cmm_sources = typing.Any,
    c_sources = typing.Any,
    cxx_sources = typing.Any,
    js_sources = typing.Any,
    hs_source_dirs = typing.Any,
    includes = typing.Any,
    include_dirs = typing.Any,
    install_includes = typing.Any,
    autogen_includes = typing.Any,
    other_modules = typing.Any,
    autogen_modules = typing.Any,
    virtual_modules = typing.Any,
    default_language = typing.Any,
    other_languages = typing.Any,
    default_extensions = typing.Any,
    other_extensions = typing.Any,
    extra_libraries = typing.Any,
    extra_libraries_static = typing.Any,
    extra_ghci_libraries = typing.Any,
    extra_bundled_libraries = typing.Any,
    extra_library_flavours = typing.Any,
    extra_dynamic_library_flavours = typing.Any,
    extra_lib_dirs = typing.Any,
    extra_lib_dirs_static = typing.Any,

    # optionsFieldGrammar = typing.Any,
    # profOptionsFieldGrammar = typing.Any,
    # sharedOptionsFieldGrammar = typing.Any,
    # profSharedOptionsFieldGrammar = typing.Any,
    mixins = typing.Any,
)