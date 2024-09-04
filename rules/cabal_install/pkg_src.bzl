
def unit_src(pkg_src, **kwargs):
  if pkg_src["type"] == "repo-tar":
    repo_tar_src(pkg_src["repo"], **kwargs)

def repo_tar_src(repo, **kwargs):
  if repo["type"] == "secure-repo":
    secure_repo_tar(repo_uri = repo["uri"], **kwargs)

def secure_repo_tar(repo_uri : str, pkg_id : str, pkg_src_sha256 : str, **kwargs):
  fetch_secure_repo(
    repo_uri = repo_uri,
    pkg_id = pkg_id,
    pkg_sha256 = pkg_src_sha256,
    **kwargs
  )

def _fetch_secure_repo_impl(ctx: AnalysisContext) -> list[Provider]:
  filename = "{}.tar.gz".format(ctx.attrs.pkg_id)
  url = "{}/package/{}".format(ctx.attrs.repo_uri.rstrip("/"), filename)

  sdist = ctx.actions.download_file(filename, url, sha256 = ctx.attrs.pkg_sha256)

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
    "pkg_sha256": attrs.string(),
  }
)
