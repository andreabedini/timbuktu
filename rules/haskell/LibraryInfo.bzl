"""
LibraryInfo
"""

load("BuildInfo.bzl", "build_info_fields")

library_info_fields = [
    "libName",
    "exposed-modules",
    "reexported-modules",
    "signatures",
    "exposed",
    # "visibility",
] + build_info_fields

LibraryInfo = provider(
    fields = library_info_fields,
    doc = "LibraryInfo",
)
