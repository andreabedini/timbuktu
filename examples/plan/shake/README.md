# shake from a build plan

[shake](https://hackage.haskell.org/package/shake) and everything it depends
on from Hackage (14 packages), each built from its sdist by its
`Setup.hs`. They all have `build-type: Simple`.

```bash
$ buck2 run //examples/plan/shake:exe-shake -- --version
```

`:exe-shake` and `:shake` are aliases of the units the plan was made for,
the executable `shake-0.19.9-exe-shake` and the library `shake-0.19.9`. See [`../README.md`](../README.md) for how the
plan is made and written out as targets.
