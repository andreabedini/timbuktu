-- The Setup.hs of a package of build-type Simple built as a whole
-- package (see plan_targets.bzl): what Cabal does for it anyway. Its own
-- may be missing from its sdist.
import Distribution.Simple

main :: IO ()
main = defaultMain
