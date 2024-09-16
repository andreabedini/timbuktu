#!/usr/bin/env python3
# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under both the MIT license found in the
# LICENSE-MIT file in the root directory of this source tree and the Apache
# License, Version 2.0 found in the LICENSE-APACHE file in the root directory
# of this source tree.

import argparse
import os
import shutil
import subprocess


def find_root():
    """Find the repository root using `buck2 root`."""
    # TODO[AH] This assumes that buck2 is in PATH when executing the script via `buck2 run`.
    #   Consider making the name/path `buck2` configurable via an environment variable.
    return subprocess.check_output(["buck2", "root"], text=True).strip()


def write_lockfile(lockfile, lockfile_out):
    os.makedirs(os.path.dirname(lockfile_out), exist_ok=True)
    shutil.copy(lockfile, lockfile_out)


def write_targets(update_label, lock_generate, conan_generate, targets_out):
    header = """\
# {at}generated
# Update using `buck2 run {update_label}`

load(
    "@prelude//toolchains/conan:defs.bzl",
    "conan_component",
    "conan_dep",
    "conan_package",
)
""".format(
        at="@", update_label=update_label
    )
    os.makedirs(os.path.dirname(targets_out), exist_ok=True)
    with open(targets_out, "w") as outf:
        outf.write(header)
        with open(lock_generate, "r") as inf:
            for x in inf:
                outf.write(x)
        with open(conan_generate, "r") as inf:
            for x in inf:
                outf.write(x)


def main():
    parser = argparse.ArgumentParser(
        prog="conan_update",
        description="Update the Conan lock-file and the Buck2 package imports.",
    )
    parser.add_argument(
        "--update-label",
        metavar="LABEL",
        type=str,
        required=True,
        help="The label to the target to run this program.",
    )
    parser.add_argument(
        "--lockfile",
        metavar="FILE",
        type=str,
        required=True,
        help="Path to the lockfile to copy to the repository.",
    )
    parser.add_argument(
        "--lock-targets",
        metavar="FILE",
        type=str,
        required=True,
        help="Path to the targets file generated from the lock file.",
    )
    parser.add_argument(
        "--conan-targets",
        metavar="FILE",
        type=str,
        required=True,
        help="Path to the targets file generated by Buckler.",
    )
    parser.add_argument(
        "--conanfile",
        metavar="FILE",
        type=str,
        required=True,
        help="Path to the Conanfile.",
    )
    parser.add_argument(
        "--lockfile-out",
        metavar="FILE",
        type=str,
        required=True,
        help="Name of the Conan lock-file to generate, relative to the Conanfile.",
    )
    parser.add_argument(
        "--targets-out",
        metavar="FILE",
        type=str,
        required=True,
        help="Name of the Starlark file to generate, relative to the Conanfile.",
    )
    args = parser.parse_args()

    root = find_root()
    conanfile = os.path.join(root, args.conanfile)
    package = os.path.dirname(conanfile)

    lockfile_out = os.path.join(package, args.lockfile_out)
    targets_out = os.path.join(package, args.targets_out)

    write_lockfile(args.lockfile, lockfile_out)
    write_targets(args.update_label, args.lock_targets, args.conan_targets, targets_out)


if __name__ == "__main__":
    main()