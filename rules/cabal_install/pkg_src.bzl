
def unit_src(pkg_src, **kwargs):
  if pkg_src["type"] == "repo-tar":
    repo_tar_src(pkg_src["repo"], **kwargs)

def repo_tar_src(repo, **kwargs):
  if repo["type"] == "secure-repo":
    secure_repo_tar(uri = repo["uri"], **kwargs)

def secure_repo_tar(uri : str, pkg_name : str, pkg_version : str, pkg_src_sha256 : str, **kwargs):
  pkg_id = "{}-{}".format(pkg_name, pkg_version)
  filename = "{}.tar.gz".format(pkg_id)
  native.http_archive(
    urls = [
      "{}/package/{}".format(uri.rstrip("/"), filename)
    ],
    sha256 = pkg_src_sha256,
    out = pkg_id,
    strip_prefix = pkg_id,
    **kwargs,
  )

