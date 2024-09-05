load("@prelude//:paths.bzl", "paths")


def unit_src(pkg_src, **kwargs):
  if pkg_src["type"] == "repo-tar":
    repo_tar_src(pkg_src["repo"], **kwargs)


def repo_tar_src(repo, **kwargs):
  if repo["type"] == "secure-repo":
    download_secure_repo(repo_uri = repo["uri"], **kwargs)


def _download_secure_repo_impl(ctx: AnalysisContext) -> list[Provider]:
  pkg_id = "{}-{}".format(ctx.attrs.pkg_name, ctx.attrs.pkg_version)
  filename = "{}.tar.gz".format(pkg_id)

  repo_uri = ctx.attrs.repo_uri.rstrip("/")
  url = "{}/package/{}".format(repo_uri, filename)

  sdist = ctx.actions.download_file(filename, url, sha256 = ctx.attrs.pkg_src_sha256)
  srcdir = ctx.actions.declare_output(pkg_id, dir=True)
  filelist = ctx.actions.declare_output("filelist")


  script = [
    "#!/usr/bin/env bash",
    cmd_args(
      "tar", "--extract",
      "--file", sdist,
      "--directory", cmd_args(srcdir.as_output(), parent=1),
      "--index-file", filelist.as_output(),
      delimiter=" "
    )
  ]

  if ctx.attrs.pkg_cabal_sha256:
    cabal_file = "{}.cabal".format(ctx.attrs.pkg_name)
    url = "https://casa.stackage.org/{}".format(ctx.attrs.pkg_cabal_sha256)
    revision = ctx.actions.download_file(cabal_file, url, sha256 = ctx.attrs.pkg_cabal_sha256)
    script.append(cmd_args("cp", revision, cmd_args(srcdir.as_output()), delimiter=" "))

  unpack = ctx.actions.write("unpack.sh", script, with_inputs=True, is_executable=True)
  ctx.actions.run(cmd_args(unpack, hidden=[filelist.as_output(), srcdir.as_output()]), category="tar_extract")

  return [
    DefaultInfo(
      default_output = srcdir,
      other_outputs = [filelist],
  )]

download_secure_repo = rule(
  impl = _download_secure_repo_impl,
  attrs = {
    "repo_uri": attrs.string(),
    "pkg_name": attrs.string(),
    "pkg_version": attrs.string(),
    "pkg_src_sha256": attrs.string(),
    "pkg_cabal_sha256": attrs.option(attrs.string(), default = None),
  }
)
