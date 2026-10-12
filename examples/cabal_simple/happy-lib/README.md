# happy-lib

[happy-lib 2.2](https://hackage.haskell.org/package/happy-lib-2.2), built
from its sdist: a package of five sublibraries (`grammar`, `frontend`,
`tabular`, `backend-lalr`, `backend-glr`) and a main library that has no code
of its own and only reexports their modules (`reexported_modules`).

```bash
$ buck2 build //examples/cabal_simple/happy-lib:lib
```

The `common` stanza that `happy-lib.cabal` imports in every component is
inlined in each target, as Cabal does when it reads the file.
