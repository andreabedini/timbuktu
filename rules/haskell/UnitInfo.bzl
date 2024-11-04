"""
InstalledPackageInfo
"""

# Information about an installed Haskell library.
# NOTE: GHC refers to these as "units"
InstalledPackageInfo = record(
    "name",
    "version",
    "package-name",
    "lib-name",
    "visibility",
    #  basic_fields
    "id",
    "instantiated-with",
    "key",
    "license",
    "copyright",
    "maintainer",
    "author",
    "stability",
    "homepage",
    "package-url",
    "synopsis",
    "description",
    "category",
    # installed fields
    "abi",
    "indefinite",
    "exposed",
    "exposed-modules",
    "hidden-modules",
    "trusted",
    "import-dirs",
    "library-dirs",
    "library-dirs-static",
    "dynamic-library-dirs",
    "data-dir",
    "hs-libraries",
    "extra-libraries",
    "extra-libraries-static",
    "extra-ghci-libraries",
    "include-dirs",
    "includes",
    "depends",
    "abi-depends",
    "cc-options",
    "cxx-options",
    "ld-options",
    "framework-dirs",
    "frameworks",
    "haddock-interfaces",
    "haddock-html",
)
