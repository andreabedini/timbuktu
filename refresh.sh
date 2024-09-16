#!/usr/bin/env bash

pkg=$(basename "$PWD")
rm -rf dist-newstyle store logs
tracexec log --show-cmdline --no-diff-fd --output trace.log -- cabal --storedir=store build --dry-run --build-log=logs/\$compiler/\$libname.log -j1 "$pkg"
cp dist-newstyle/cache/plan.json plan.json
