{-# OPTIONS_GHC -Wall #-}

import Distribution.Simple.Build (componentInitialBuildSteps)
import Distribution.Simple.Build.PathsModule (generatePathsModule)
import Distribution.Simple.Configure (getConfigStateFile)
import Distribution.Simple.LocalBuildInfo (LocalBuildInfo (..), withAllComponentsInBuildOrder)
import Distribution.Verbosity qualified as Verbosity
import System.Environment (getArgs)

main :: IO ()
main = do
  [arg] <- getArgs
  lbi <- getConfigStateFile arg

  let pkg_descr = localPkgDescr lbi
      dir = buildDir lbi
      verbosity = Verbosity.normal

  withAllComponentsInBuildOrder pkg_descr lbi $ \_comp clbi ->
    writeBuiltinAutogenFiles

-- TODO: try to load the setup-config instead. In this way we can make many smaller utilities.
-- See Distribution.Simple.Configure.getConfigStateFile
