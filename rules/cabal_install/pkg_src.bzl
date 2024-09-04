def unit_src(pkg_src, **kwargs):
  if pkg_src["type"] == "repo-tar":
    repo_tar_src(pkg_src["repo"], **kwargs)


def repo_tar_src(repo, **kwargs):
  if repo["type"] == "secure-repo":
    fetch_secure_repo(repo_uri = repo["uri"], **kwargs)


def _fetch_secure_repo_impl(ctx: AnalysisContext) -> list[Provider]:
  filename = "{}.tar.gz".format(ctx.attrs.pkg_id)
  url = "{}/package/{}".format(ctx.attrs.repo_uri.rstrip("/"), filename)

  sdist = ctx.actions.download_file(filename, url, sha256 = ctx.attrs.pkg_src_sha256)

  # Unpack archive to output directory.
  srcdir = ctx.actions.declare_output(ctx.attrs.pkg_id, dir = True)
  ctx.actions.run(
    cmd_args("tar", "xzf", sdist, "-C", cmd_args(srcdir.as_output(), parent = 1)),
    category = "download",
  )

  return [
    DefaultInfo(default_output = srcdir)
  ]


fetch_secure_repo = rule(
  impl = _fetch_secure_repo_impl,
  attrs = {
    "repo_uri": attrs.string(),
    "pkg_id": attrs.string(),
    "pkg_src_sha256": attrs.string(),
    "pkg_cabal_sha256": attrs.option(attrs.string(), default = None),
  }
)
