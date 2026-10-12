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
    repo_package(name = name, package = package)

def fetch_package(
        actions: AnalysisActions,
        scope: str | None,
        package: dict[str, typing.Any]) -> struct:
    """Download a package of a plan and unpack it, with its cabal file revision.

    Args:
      actions: where to declare the actions
      scope: a directory for the outputs and an identifier for the actions,
        when a target fetches more than one package
      package: the entry, as in the `packages` of the plan
    Returns:
      a struct with the source tree (`srcdir`) and the list of its files
      (`filelist`)
    """
    src = package["src"]
    if src["type"] != "repo-tar":
        fail("{}: packages of type `{}` are not supported yet".format(package["id"], src["type"]))
    if not src["sha256"]:
        fail("{}: the index has no checksum for the sdist, and buck2 does not download a file without one".format(package["id"]))

    def declare(name, **kwargs):
        return actions.declare_output(scope, name, **kwargs) if scope else actions.declare_output(name, **kwargs)

    pkg_id = package["id"]
    filename = "{}.tar.gz".format(pkg_id)

    # NOTE: the repository's URI ends in a slash.
    repo = src["repo"]

    # NOTE: with the size, the download can have a content-based path.
    sdist = declare(filename)
    actions.download_file(sdist.as_output(), "{}package/{}".format(repo, filename), sha256 = src["sha256"], size_bytes = src.get("size"))

    # NOTE: the build scripts give paths relative to the source tree. Out of a
    # dynamic action, a content-based path for it made those wrong (buck2
    # computed them from the path it would have had otherwise).
    srcdir = declare(pkg_id, dir = True, has_content_based_path = False)
    filelist = declare("filelist")

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

    cabal_file = package["cabal-file"]
    if cabal_file:
        # NOTE: Hackage does not report the size of a cabal file, and a
        # download to a content-based path needs it up front.
        revision = declare(package["name"] + ".cabal")
        url = "{}package/{}/revision/{}.cabal".format(repo, pkg_id, cabal_file["revision"])
        actions.download_file(revision.as_output(), url, sha256 = cabal_file["sha256"], size_bytes = cabal_file["size"])
        unpack_sh_content.add(cmd_args("cp", revision, srcdir.as_output(), delimiter = " "))

    unpack_sh = declare("unpack.sh")
    actions.write(unpack_sh.as_output(), unpack_sh_content, is_executable = True, with_inputs = True)

    actions.run(
        cmd_args(unpack_sh, hidden = [filelist.as_output(), srcdir.as_output()]),
        category = "unpack",
        identifier = scope,
    )
    return struct(srcdir = srcdir, filelist = filelist)

def _repo_package_impl(ctx: AnalysisContext) -> list[Provider]:
    fetched = fetch_package(ctx.actions, None, ctx.attrs.package)
    srcdir = fetched.srcdir
    return [
        DefaultInfo(
            default_output = srcdir,
            other_outputs = [fetched.filelist],
            sub_targets = {
                "Setup.hs": [DefaultInfo(default_output = srcdir.project("Setup.hs"))],
            },
        ),
        CabalPackageInfo(
            pkg_name = ctx.attrs.package["name"],
            pkg_version = ctx.attrs.package["version"],
            srcdir = srcdir,
            cabalfile = srcdir.project(ctx.attrs.package["name"] + ".cabal"),
        ),
    ]

repo_package = rule(
    doc = "A package from a package repository such as Hackage, with a revision of its cabal file.",
    impl = _repo_package_impl,
    attrs = {
        # The entry of the plan, as in its `packages`
        "package": attrs.dict(attrs.string(), attrs.any()),
    },
)
