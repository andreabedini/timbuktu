"""
The sources of a package of a plan: the sdist, with the revision of the cabal
file the plan was made with.
"""

load("common.bzl", "CabalPackageInfo")

def pkg_src(name: str, package: dict[str, typing.Any]):
    """The sources of a package entry of a plan.

    Args:
      name: the name of the target
      package: the entry, as in the `packages` of the plan
    """
    src = package["src"]
    if src["type"] != "repo-tar":
        fail("{}: packages of type `{}` are not supported yet".format(package["id"], src["type"]))
    if not src["sha256"]:
        fail("{}: the index has no checksum for the sdist, and buck2 does not download a file without one".format(package["id"]))
    cabal_file = package["cabal-file"] or {}
    repo_package(
        name = name,
        pkg_name = package["name"],
        pkg_version = package["version"],
        repo = src["repo"],
        sha256 = src["sha256"],
        size = src.get("size"),
        cabal_revision = cabal_file.get("revision"),
        cabal_sha256 = cabal_file.get("sha256"),
        cabal_size = cabal_file.get("size"),
    )

def _repo_package_impl(ctx: AnalysisContext) -> list[Provider]:
    pkg_id = "{}-{}".format(ctx.attrs.pkg_name, ctx.attrs.pkg_version)
    filename = "{}.tar.gz".format(pkg_id)

    # NOTE: the repository's URI ends in a slash.
    repo = ctx.attrs.repo
    url = "{}package/{}".format(repo, filename)

    # NOTE: with the size, the download can have a content-based path.
    sdist = ctx.actions.download_file(filename, url, sha256 = ctx.attrs.sha256, size_bytes = ctx.attrs.size)
    srcdir = ctx.actions.declare_output(pkg_id, dir = True)
    filelist = ctx.actions.declare_output("filelist")

    unpack_sh_content = cmd_args(
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        cmd_args(
            "tar",
            "--extract",
            "--file",
            sdist,
            "--directory",
            cmd_args(srcdir.as_output(), parent = 1),
            "--verbose",
            "--index-file",
            filelist.as_output(),
            delimiter = " ",
        ),
    )

    if ctx.attrs.cabal_sha256:
        cabal_file = "{}.cabal".format(ctx.attrs.pkg_name)
        url = "{}package/{}/revision/{}.cabal".format(repo, pkg_id, ctx.attrs.cabal_revision)

        # NOTE: Hackage does not report the size of a cabal file, and a
        # download to a content-based path needs it up front.
        revision = ctx.actions.download_file(cabal_file, url, sha256 = ctx.attrs.cabal_sha256, size_bytes = ctx.attrs.cabal_size)
        unpack_sh_content.add(cmd_args("cp", revision, srcdir.as_output(), delimiter = " "))

    unpack_sh = ctx.actions.write("unpack.sh", unpack_sh_content, is_executable = True, with_inputs = True)

    ctx.actions.run(
        cmd_args(unpack_sh, hidden = [filelist.as_output(), srcdir.as_output()]),
        category = "unpack",
    )

    cabalfile = srcdir.project(ctx.attrs.pkg_name + ".cabal")

    return [
        DefaultInfo(
            default_output = srcdir,
            other_outputs = [filelist],
            sub_targets = {
                "Setup.hs": [DefaultInfo(default_output = srcdir.project("Setup.hs"))],
            },
        ),
        CabalPackageInfo(
            pkg_name = ctx.attrs.pkg_name,
            pkg_version = ctx.attrs.pkg_version,
            srcdir = srcdir,
            cabalfile = cabalfile,
        ),
    ]

repo_package = rule(
    doc = "A package from a package repository such as Hackage, with a revision of its cabal file.",
    impl = _repo_package_impl,
    # @unsorted-dict-items
    attrs = {
        # Ends in a slash.
        "repo": attrs.string(),
        "pkg_name": attrs.string(),
        "pkg_version": attrs.string(),
        # The sdist
        "sha256": attrs.string(),
        "size": attrs.option(attrs.int(), default = None),
        # The revision of the cabal file, None to keep the one in the sdist.
        "cabal_revision": attrs.option(attrs.int(), default = None),
        "cabal_sha256": attrs.option(attrs.string(), default = None),
        "cabal_size": attrs.option(attrs.int(), default = None),
    },
)
