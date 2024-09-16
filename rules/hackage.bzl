def hackage_package(name : str, version : str, sha256 : str, sub_targets : list[str] = []):
  pkgid = name + "-" + version
  return native.http_archive(
    name = "src-{}".format(pkgid),
    urls = ["https://hackage.haskell.org/package/{}/{}.tar.gz".format(pkgid, pkgid)],
    sha256 = sha256,
    out = pkgid,
    strip_prefix = pkgid,
    sub_targets = sub_targets,
  )
