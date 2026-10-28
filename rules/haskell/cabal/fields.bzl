"""
The fields of a package description, and what the cabal_simple rules make of
each of them.

This is the one list of them: the rules take their attributes from it
(package.bzl, simple.bzl) and the generator the fields it copies
(generate.bzl). A field is an attribute of the same name with underscores in
place of dashes, unless `attr_name` says otherwise. Each one is

- honoured: it means to the rules what it means to Cabal;
- refused: a target that gives it fails, rather than build something other
  than what Cabal would;
- ignored: it makes no difference to what the rules build (for instance it
  is only of use to `cabal install` or `cabal sdist`).

These are the fields of Cabal 3.14 (Distribution.PackageDescription.FieldGrammar),
as describe_package prints them. That program stops when the Cabal it is
built with knows a field it does not print, and generate.bzl when it prints
a field that is not here: that is when this list needs a look. A few fields
of a .cabal file are not here because describe_package prints them under
another name (`hs-source-dir`, `extensions`), or because they are for other
compilers (`ghcjs-options`, ...).

CABAL_SPEC_VERSION is the newest `cabal-version` the list has been checked
against: cabal_package refuses a package written to a newer one, since a
field can change its meaning from one version to the next.
"""

load("//rules/haskell:providers.bzl", "CabalLibraryInfo")

CABAL_SPEC_VERSION = "3.14"

HONOURED = "honoured"
REFUSED = "refused"
IGNORED = "ignored"

def _honoured(attr: Attr, attr_name: str | None = None) -> struct:
    return struct(attr = attr, use = HONOURED, attr_name = attr_name)

def _refused(attr: Attr) -> struct:
    return struct(attr = attr, use = REFUSED, attr_name = None)

def _ignored(attr: Attr) -> struct:
    return struct(attr = attr, use = IGNORED, attr_name = None)

def _string(default: str | None = None) -> Attr:
    if default != None:
        return attrs.string(default = default)
    return attrs.option(attrs.string(), default = None)

def _strings() -> Attr:
    return attrs.list(attrs.string(), default = [])

# The fields of a package, not of a component. `name` and `version` are not
# here: the name of a package is that of its cabal_package target unless
# `package_name` says otherwise, and the version is required.
#
# @unsorted-dict-items
PACKAGE_FIELDS = {
    "cabal-version": _honoured(_string()),
    # Only Simple, see package.bzl
    "build-type": _honoured(_string("Simple")),
    "data-dir": _honoured(_string(".")),
    "data-files": _honoured(_strings()),
    # In the registration of a library, as Cabal puts them there.
    "license": _honoured(_string()),
    "copyright": _honoured(_string()),
    "maintainer": _honoured(_string()),
    "author": _honoured(_string()),
    "stability": _honoured(_string()),
    "homepage": _honoured(_string()),
    "package-url": _honoured(_string()),
    "synopsis": _honoured(_string()),
    "description": _honoured(_string()),
    "category": _honoured(_string()),
    # For `cabal install`, `cabal sdist` and Hackage.
    "license-files": _ignored(_strings()),
    # describe_package prints it as license-files, as Cabal reads it.
    "license-file": _ignored(_string()),
    "bug-reports": _ignored(_string()),
    "tested-with": _ignored(_string()),
    "extra-source-files": _ignored(_strings()),
    "extra-doc-files": _ignored(_strings()),
    "extra-tmp-files": _ignored(_strings()),
    "extra-files": _ignored(_strings()),
}

# The fields every component has (BuildInfo).
#
# @unsorted-dict-items
BUILD_INFO_FIELDS = {
    # False is refused: the generator leaves out what is not buildable.
    "buildable": _honoured(attrs.bool(default = True)),
    "hs-source-dirs": _honoured(_strings()),
    "other-modules": _honoured(_strings()),
    "autogen-modules": _honoured(_strings()),
    "default-language": _honoured(_string()),
    "other-languages": _honoured(_strings()),
    "default-extensions": _honoured(_strings()),
    "other-extensions": _honoured(_strings()),
    "build-depends": _honoured(attrs.list(attrs.dep(providers = [CabalLibraryInfo]), default = [])),
    "build-tool-depends": _honoured(attrs.list(attrs.exec_dep(providers = [RunInfo]), default = [])),
    "ghc-options": _honoured(_strings()),
    "ghc-shared-options": _honoured(_strings()),
    "cpp-options": _honoured(_strings()),
    "cc-options": _honoured(_strings()),
    "cxx-options": _honoured(_strings()),
    "asm-options": _honoured(_strings()),
    "cmm-options": _honoured(_strings()),
    "ld-options": _honoured(_strings()),
    "hsc2hs-options": _honoured(_strings()),
    "c-sources": _honoured(_strings()),
    "cxx-sources": _honoured(_strings()),
    "asm-sources": _honoured(_strings()),
    "cmm-sources": _honoured(_strings()),
    "include-dirs": _honoured(_strings()),
    "includes": _honoured(_strings()),
    "install-includes": _honoured(_strings()),
    "extra-libraries": _honoured(_strings()),
    "extra-lib-dirs": _honoured(_strings()),
    # There is no profiling.
    "ghc-prof-options": _ignored(_strings()),
    "ghc-prof-shared-options": _ignored(_strings()),
    # Only for executables linked fully statically (cabal's
    # --enable-executable-static), which the rules do not do.
    "extra-libraries-static": _ignored(_strings()),
    "extra-lib-dirs-static": _ignored(_strings()),
    # The build tools Cabal does not know the package of (describe_package
    # turns the others into build-tool-depends): programs Cabal expects to
    # find in PATH.
    "build-tools": _refused(_strings()),
    "virtual-modules": _refused(_strings()),
    "js-sources": _refused(_strings()),
    "autogen-includes": _refused(_strings()),
    "extra-ghci-libraries": _refused(_strings()),
    "extra-bundled-libraries": _refused(_strings()),
    "extra-library-flavours": _refused(_strings()),
    "extra-dynamic-library-flavours": _refused(_strings()),
    "frameworks": _refused(_strings()),
    "extra-framework-dirs": _refused(_strings()),
    # What the C libraries are called. The libraries themselves are the
    # targets of `cxx_deps` (see simple.bzl), which the generators fill
    # in from --pkgconfig: pkg-config is not run.
    "pkgconfig-depends": _honoured(_strings()),
    "mixins": _refused(_strings()),
}

# @unsorted-dict-items
LIBRARY_FIELDS = {
    "exposed-modules": _honoured(_strings()),
    "reexported-modules": _honoured(_strings()),
    # Cabal makes a sublibrary unexposed whatever this says.
    "exposed": _honoured(attrs.bool(default = True)),
    # buck2 has its own idea of what visibility is.
    "visibility": _honoured(attrs.option(attrs.enum(["public", "private"]), default = None), attr_name = "library_visibility"),
    "signatures": _refused(_strings()),
}

# @unsorted-dict-items
EXECUTABLE_FIELDS = {
    "main-is": _honoured(attrs.string()),
    # Where `cabal install` puts it.
    "scope": _ignored(_string()),
}

# @unsorted-dict-items
TEST_SUITE_FIELDS = {
    # Only exitcode-stdio-1.0, see simple.bzl
    "type": _honoured(_string("exitcode-stdio-1.0")),
    # Of an exitcode-stdio test suite.
    "main-is": _honoured(_string()),
    # Of a detailed test suite.
    "test-module": _refused(_string()),
    "code-generators": _refused(_strings()),
}

def attr_name(field: str, spec: struct) -> str:
    return spec.attr_name or field.replace("-", "_")

def field_attrs(fields: dict[str, struct]) -> dict[str, Attr]:
    """The attributes of a rule for these fields."""
    return {attr_name(field, spec): spec.attr for field, spec in fields.items()}

def check_refused(ctx: AnalysisContext, fields: dict[str, struct]):
    """Fail if a target gives a field the rules refuse."""
    for field, spec in fields.items():
        if spec.use == REFUSED and getattr(ctx.attrs, attr_name(field, spec)):
            fail("{}: `{}` is not supported yet".format(ctx.label, field))

def _version(text: str) -> list[int]:
    return [int(part) for part in text.split(".")]

def check_spec_version(label: Label, cabal_version: str | None):
    """Fail if a package is written to a newer spec than CABAL_SPEC_VERSION.

    Args:
      label: the package, for the message
      cabal_version: the `cabal-version` of the package: a version, or `>=`
        and a version as packages older than 1.12 have it
    """
    if not cabal_version:
        return
    version = cabal_version.removeprefix(">=").strip()
    if not version.replace(".", "").isdigit():
        fail("{}: cannot make sense of cabal-version `{}`".format(label, cabal_version))
    if _version(version)[:2] > _version(CABAL_SPEC_VERSION):
        fail("{}: cabal-version {} is newer than {}, the newest the cabal_simple rules have been checked against. See rules/haskell/cabal/fields.bzl for what to review.".format(
            label,
            version,
            CABAL_SPEC_VERSION,
        ))
