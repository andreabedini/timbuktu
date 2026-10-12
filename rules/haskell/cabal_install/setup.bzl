"""
Building a unit of a plan with its Setup.hs, as functions of `actions`.

Nothing here reads a rule's context: what a unit takes is passed in, the
providers of its dependencies included. The rules in build.bzl and
build_legacy.bzl call these functions with what their attributes say, and
something that builds several units in one target (a plan read in a dynamic
action) can call them with what it read, giving each unit a `scope` of its
own.

There are two ways to build a unit, as cabal-install has:

- build_component: one component of a package with `build-type: Simple`;
  configure, build, copy and register are separate actions.
- build_package: a whole package of any other build type. Setup.hs may do
  anything, so every step runs in one action.
"""

load("@prelude//:paths.bzl", "paths")
load("//rules/haskell:providers.bzl", "CabalExecutableInfo", "CabalLibraryInfo", "CabalUnit", "CabalUnitTSet", "mangle")
load("//rules/haskell:toolchain.bzl", "GhcToolchainInfo")
load("//rules/haskell:unit.bzl", "resolve_unit")

SetupUnit = record(
    id = str,
    # The package
    name = str,
    version = str,
    # Every flag of the package and its value
    flags = dict[str, bool],
    # The component as cabal-install calls it ("lib", "lib:x", "exe:x", ...)
    # for a unit built one component at a time, None for a whole package.
    component = str | None,
)

SetupEnv = record(
    actions = AnalysisActions,
    ghc = GhcToolchainInfo,
    # Who the unit is built for, for error messages.
    label = Label,
    # A directory for the unit's outputs and an identifier for its actions,
    # when there is more than one unit to a target. None otherwise.
    scope = str | None,
)

InstallDirs = record(
    prefix = Artifact,
    libdir = Artifact,
    args = cmd_args,
)

BuiltUnit = record(
    installdirs = InstallDirs,
    # The package db with the unit's registration, for a library.
    package_db = Artifact | None,
    package_conf = Artifact | None,
    library = CabalLibraryInfo | None,
    executable = CabalExecutableInfo | None,
)

def _declare(env: SetupEnv, name: str, **kwargs) -> Artifact:
    if env.scope:
        return env.actions.declare_output(env.scope, name, **kwargs)
    return env.actions.declare_output(name, **kwargs)

def _run(env: SetupEnv, cmd: cmd_args, category: str):
    env.actions.run(cmd, category = category, identifier = env.scope)

def _script(env: SetupEnv, name: str, srcdir: Artifact, lines: list[cmd_args], with_inputs: bool = True) -> Artifact:
    """A bash script that runs `lines` from the package's directory."""
    content = cmd_args(
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        cmd_args(srcdir, format = "cd {}"),
        [cmd_args(line, relative_to = srcdir) for line in lines],
    )
    script = _declare(env, name)
    return env.actions.write(script.as_output(), content, is_executable = True, with_inputs = with_inputs)

def dep_units(actions: AnalysisActions, deps: list[CabalLibraryInfo], value: CabalUnit | None = None) -> CabalUnitTSet:
    """The units of the dependencies, and `value` if given."""
    children = [dep.units for dep in deps]
    if value:
        return actions.tset(CabalUnitTSet, value = value, children = children)
    return actions.tset(CabalUnitTSet, children = children)

def configure_args(env: SetupEnv, unit: SetupUnit, deps: list[CabalLibraryInfo]) -> cmd_args:
    """What Setup.hs configure is told about the compiler and the dependencies."""
    args = cmd_args(
        cmd_args(env.ghc.ghc, format = "--with-compiler={}"),
        "--exact-configuration",
        "--package-db=clear",
        "--package-db=global",
    )

    # One package db for each unit that is not the compiler's, the way the
    # cabal_simple rules do it.
    units = dep_units(env.actions, deps)
    args.add(units.project_as_args("setup_package_db"))
    args.add(cmd_args(hidden = units.project_as_args("artifacts")))

    for info in deps:
        if not info.id or not info.name:
            fail("{}: Setup.hs is told each dependency by package name and unit-id during analysis, and a dependency of {} does not know {}".format(
                env.label,
                unit.id,
                "the unit-id of `{}` (give haskell_unit an `id`)".format(info.name) if info.name else "its package name",
            ))
        if info.lib_name:
            args.add("--dependency={}:{}={}".format(info.name, info.lib_name, info.id))
        else:
            args.add("--dependency={}={}".format(info.name, info.id))

    args.add(cmd_args([("+" if value else "-") + name for name, value in unit.flags.items()], format = "--flags={}"))
    return args

def build_env(exe_deps: list[CabalExecutableInfo]) -> cmd_args:
    """The environment of the build tools, as Cabal sets it up."""
    env = cmd_args()

    if exe_deps:
        path = cmd_args([exe.exe for exe in exe_deps], parent = 1, delimiter = ":")
        env.add(cmd_args(path, format = "PATH={}:$PATH"))

    # NOTE: the paths have to be absolute: a tool can write them into a file
    # somewhere else, as hsc2hs does with `#include "<datadir>/template-hsc.h"`.
    # The scripts run from the package's directory, which is what the paths
    # are relative to.
    for exe in exe_deps:
        for name, value in exe.env.items():
            env.add(cmd_args(value, format = name + "=$PWD/{}"))

    return env

def install_dirs(env: SetupEnv) -> InstallDirs:
    prefix = _declare(env, "prefix", dir = True, has_content_based_path = False)
    args = cmd_args(
        cmd_args(prefix, format = "--prefix=$(realpath {})"),
        "--libdir='$prefix/lib'",
        "--libsubdir=",
        "--dynlibdir='$prefix/lib'",
        "--libexecdir='$prefix/libexec'",
        "--libexecsubdir=",
        "--datadir='$prefix/data'",
        "--datasubdir=",
        "--docdir='$prefix/doc'",
    )
    return InstallDirs(
        prefix = prefix,
        libdir = prefix.project("lib"),
        args = args,
    )

def data_dir(installdirs: InstallDirs) -> cmd_args:
    """Where Setup.hs copied the data-files of the package.

    NOTE: not a projection of the prefix, since the directory is only there
    when the package has data-files.
    """
    return cmd_args(installdirs.prefix, "/data", delimiter = "")

def _library_info(env: SetupEnv, unit: SetupUnit, deps: list[CabalLibraryInfo], package_db: Artifact, installdirs: InstallDirs, lib_name: str | None) -> CabalLibraryInfo:
    """What a library unit hands to its dependents, whatever rule set they are of."""

    # The cabal_simple rules want to hear what the registration says.
    # NOTE: a sublibrary is registered with a name of its own (z-<pkg>-z-<lib>),
    # so it is only looked for by id.
    resolved = resolve_unit(
        env.actions,
        env.ghc,
        env.label,
        package_db,
        unit.id,
        None if lib_name else unit.name,
        unit.version,
        scope = env.scope,
    )
    return CabalLibraryInfo(
        name = unit.name,
        lib_name = lib_name,
        id = unit.id,
        unit = resolved.unit,
        units = dep_units(env.actions, deps, CabalUnit(
            id = unit.id,
            package_db = package_db,
            # The registration refers to the installation prefix.
            artifacts = [installdirs.prefix],
            data_dir = (mangle(unit.name) + "_datadir", data_dir(installdirs)),
        )),
    )

def _setup_component(unit: SetupUnit) -> str:
    """The component as Setup.hs wants it."""
    return "lib:{}".format(unit.name) if unit.component == "lib" else unit.component

def build_component(
        env: SetupEnv,
        unit: SetupUnit,
        srcdir: Artifact,
        setup: RunInfo,
        deps: list[CabalLibraryInfo],
        exe_deps: list[CabalExecutableInfo]) -> BuiltUnit:
    """Build one component of a package with `build-type: Simple`.

    Args:
      env: where to declare the actions
      unit: the unit; its component is not None
      srcdir: the package's source tree
      setup: a Setup.hs of build-type Simple
      deps: the libraries it depends on
      exe_deps: the build tools it uses
    Returns:
      what was built
    """
    if not unit.component:
        fail("{}: build_component builds one component, and {} has none".format(env.label, unit.id))
    component = _setup_component(unit)
    tools = build_env(exe_deps)
    installdirs = install_dirs(env)

    # NOTE: the paths of these outputs end up in the setup-config and in the
    # package conf, so they cannot be content-based.
    setup_config = _declare(env, "setup-config", has_content_based_path = False)
    build = _declare(env, "build", dir = True, has_content_based_path = False)
    builddir = cmd_args(build, parent = 1)

    # configure

    configure = _script(env, "configure.sh", srcdir, [cmd_args(
        tools,
        setup,
        "configure",
        cmd_args(builddir, format = "--builddir={}", ignore_artifacts = True),
        cmd_args(installdirs.args, ignore_artifacts = True),
        configure_args(env, unit, deps),
        "--cid={}".format(unit.id),
        component,
        delimiter = " ",
    )])
    _run(env, cmd_args(configure, hidden = [srcdir, setup, setup_config.as_output()]), "cabal_configure")

    # build: what the registrations of the dependencies refer to is read here

    build_sh = _script(env, "build.sh", srcdir, [cmd_args(
        tools,
        setup,
        "build",
        cmd_args(builddir, format = "--builddir={}", ignore_artifacts = True),
        component,
        delimiter = " ",
    )])
    _run(env, cmd_args(build_sh, hidden = [setup_config, build.as_output(), dep_units(env.actions, deps).project_as_args("artifacts")]), "cabal_build")

    # copy

    copy = _script(env, "copy.sh", srcdir, [cmd_args(
        tools,
        setup,
        "copy",
        cmd_args(builddir, format = "--builddir={}"),
        component,
        delimiter = " ",
    )])
    _run(env, cmd_args(copy, hidden = [installdirs.prefix.as_output()]), "cabal_copy")

    # register: only libraries have a registration

    package_db = None
    package_conf = None
    library = None
    if unit.component == "lib" or unit.component.startswith("lib:"):
        package_db = _declare(env, "package.conf.d", dir = True, has_content_based_path = False)
        package_conf = package_db.project("{}.conf".format(unit.id))
        register = _script(env, "register.sh", srcdir, [
            cmd_args("mkdir", package_db, delimiter = " "),
            cmd_args(
                tools,
                setup,
                "register",
                cmd_args(builddir, format = "--builddir={}"),
                cmd_args(package_conf.as_output(), format = "--gen-pkg-config={}"),
                component,
                delimiter = " ",
            ),
            cmd_args(env.ghc.ghc_pkg, "recache", cmd_args(package_db, format = "--package-db={}"), delimiter = " "),
        ], with_inputs = False)
        _run(env, cmd_args(register, hidden = [installdirs.prefix, package_db.as_output()]), "cabal_register")
        library = _library_info(env, unit, deps, package_db, installdirs, unit.component[4:] or None)

    executable = None
    if unit.component.startswith("exe:"):
        exe_name = unit.component[4:]
        executable = CabalExecutableInfo(
            name = exe_name,
            exe = installdirs.prefix.project(paths.join("bin", exe_name)),
            env = {mangle(unit.name) + "_datadir": data_dir(installdirs)},
        )

    return BuiltUnit(
        installdirs = installdirs,
        package_db = package_db,
        package_conf = package_conf,
        library = library,
        executable = executable,
    )

def build_package(
        env: SetupEnv,
        unit: SetupUnit,
        srcdir: Artifact,
        setup: RunInfo,
        deps: list[CabalLibraryInfo],
        exe_deps: list[CabalExecutableInfo]) -> BuiltUnit:
    """Build a whole package, of a build type other than Simple.

    Setup.hs may write anything anywhere, so configure, build, copy and
    register run in one action. Only the library of the package is available
    to dependents.

    Args:
      env: where to declare the actions
      unit: the unit; its component is None
      srcdir: the package's source tree
      setup: the package's own Setup.hs, compiled
      deps: the libraries it depends on, all components together
      exe_deps: the build tools it uses
    Returns:
      what was built
    """
    tools = build_env(exe_deps)
    installdirs = install_dirs(env)

    build = _declare(env, "build", dir = True, has_content_based_path = False)
    builddir = cmd_args(build, parent = 1, ignore_artifacts = True)

    package_db = _declare(env, "package.conf.d", dir = True, has_content_based_path = False)
    package_conf = package_db.project("{}.conf".format(unit.id))

    def setup_cmd(*args):
        return cmd_args(tools, setup, list(args), delimiter = " ")

    content = cmd_args(
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        cmd_args("mkdir", "-p", installdirs.prefix.as_output(), delimiter = " "),
        cmd_args(srcdir, format = "cd {}"),
        cmd_args(
            [
                setup_cmd(
                    "configure",
                    cmd_args(builddir, format = "--builddir={}"),
                    cmd_args(installdirs.args, ignore_artifacts = True),
                    configure_args(env, unit, deps),
                    "--ipi={}".format(unit.id),
                ),
                setup_cmd("build", cmd_args(builddir, format = "--builddir={}")),
                setup_cmd("copy", cmd_args(builddir, format = "--builddir={}")),
                cmd_args("mkdir", package_db, delimiter = " ", ignore_artifacts = True),
                setup_cmd(
                    "register",
                    cmd_args(builddir, format = "--builddir={}"),
                    cmd_args(package_conf.as_output(), format = "--gen-pkg-config={}"),
                ),
                cmd_args(env.ghc.ghc_pkg, "recache", cmd_args(package_db, format = "--package-db={}", ignore_artifacts = True), delimiter = " "),
            ],
            relative_to = srcdir,
        ),
    )
    script = _declare(env, "build_package.sh")
    env.actions.write(script.as_output(), content, is_executable = True, with_inputs = True)

    _run(
        env,
        cmd_args(
            script,
            hidden = [
                srcdir,
                setup,
                dep_units(env.actions, deps).project_as_args("artifacts"),
                build.as_output(),
                installdirs.prefix.as_output(),
                package_db.as_output(),
            ],
        ),
        "cabal_build_package",
    )

    return BuiltUnit(
        installdirs = installdirs,
        package_db = package_db,
        package_conf = package_conf,
        library = _library_info(env, unit, deps, package_db, installdirs, None),
        executable = None,
    )
