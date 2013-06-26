module Paths_biegunka_darcs (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/m/.cabal/bin"
libdir     = "/home/m/.cabal/lib/biegunka-darcs-0.1.0.0/ghc-7.6.3"
datadir    = "/home/m/.cabal/share/biegunka-darcs-0.1.0.0"
libexecdir = "/home/m/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "biegunka_darcs_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "biegunka_darcs_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "biegunka_darcs_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "biegunka_darcs_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
