"""
Rules and macros to fetch packages as described in a cabal-install build-plan.
"""

load("common.bzl", "CabalPackageInfo")

def pkg_src(pkg_src, **kwargs):
    if pkg_src["type"] == "repo-tar":
        repo_tar_src(pkg_src["repo"], **kwargs)

def repo_tar_src(repo, **kwargs):
    if repo["type"] == "secure-repo":
        secure_repo_package(repo_uri = repo["uri"], **kwargs)

def _secure_repo_package_impl(ctx: AnalysisContext) -> list[Provider]:
    pkg_id = "{}-{}".format(ctx.attrs.pkg_name, ctx.attrs.pkg_version)
    filename = "{}.tar.gz".format(pkg_id)

    repo_uri = ctx.attrs.repo_uri.rstrip("/")
    url = "{}/package/{}".format(repo_uri, filename)

    sdist = ctx.actions.download_file(filename, url, sha256 = ctx.attrs.pkg_src_sha256)
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

    if ctx.attrs.pkg_cabal_sha256:
        cabal_file = "{}.cabal".format(ctx.attrs.pkg_name)
        url = "https://casa.stackage.org/{}".format(ctx.attrs.pkg_cabal_sha256)
        revision = ctx.actions.download_file(cabal_file, url, sha256 = ctx.attrs.pkg_cabal_sha256)
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

secure_repo_package = rule(
    impl = _secure_repo_package_impl,
    # @unsorted-dict-items
    attrs = {
        "repo_uri": attrs.string(),
        "pkg_name": attrs.string(),
        "pkg_version": attrs.string(),
        "pkg_cabal_sha256": attrs.option(attrs.string(), default = None),
        "pkg_src_sha256": attrs.string(),
    },
)
