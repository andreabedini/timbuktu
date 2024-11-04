"""
PackageInfo
"""

package_info_fields = [
    "cabal-version",
    "name",
    "version",
    "license-file",
    "copyright",
    "maintainer",
    "author",
    "stability",
    "testedWith",
    "homepage",
    "package-url",
    "bug-reports",
    "source-repos",
    "synopsis",
    "description",
    "category",
    "custom-setup",
    # "library",
    # "subLibraries",
    # "executables",
    # "foreignLibs",
    # "testSuites",
    # "benchmarks",
    "data-files",
    "data-dir",
    "extra-source-files",
    "extra-tmp-files",
    "extra-doc-files",
    "extra-files",
]

PackageInfo = provider(
    fields = package_info_fields,
    doc = "PackageInfo",
)
