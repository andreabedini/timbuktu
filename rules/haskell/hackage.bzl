load("@prelude//:paths.bzl", "paths")

def hackage_package(name: str, sha256: str, sub_targets: list[str] = []):
    return native.http_archive(
        name = name,
        urls = ["https://hackage.haskell.org/package/{}/{}.tar.gz".format(name, name)],
        sha256 = sha256,
        strip_prefix = name,
        sub_targets = sub_targets,
    )

def module_path(name: str, dir: str | None = None):
    if dir:
        return paths.replace_extension(paths.join(dir, *name.split(".")), ".hs")
    else:
        return paths.replace_extension(paths.join(*name.split(".")), ".hs")
