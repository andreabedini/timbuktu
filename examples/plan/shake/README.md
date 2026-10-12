# shake from a build plan

[shake](https://hackage.haskell.org/package/shake) and everything it depends
on from Hackage (14 packages), each built from its sdist by its
`Setup.hs`. They all have `build-type: Simple`.

```bash
$ buck2 run $(buck2 targets //examples/plan/shake: | grep -- '-e-shake-') -- --version
```

The executable is the unit `shake-<version>-e-shake-<hash>`; a library unit is
`<package>-<version>-<hash>`. See [`../README.md`](../README.md) for how the
plan is made and turned into targets.
