{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_pangram (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [2,0,0,12] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Kasper\\projects\\exercism.io\\haskell\\pangram\\.stack-work\\install\\1e538474\\bin"
libdir     = "C:\\Kasper\\projects\\exercism.io\\haskell\\pangram\\.stack-work\\install\\1e538474\\lib\\x86_64-windows-ghc-8.10.7\\pangram-2.0.0.12-FGBsGxYHaXd1MN7nupRo00-test"
dynlibdir  = "C:\\Kasper\\projects\\exercism.io\\haskell\\pangram\\.stack-work\\install\\1e538474\\lib\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\Kasper\\projects\\exercism.io\\haskell\\pangram\\.stack-work\\install\\1e538474\\share\\x86_64-windows-ghc-8.10.7\\pangram-2.0.0.12"
libexecdir = "C:\\Kasper\\projects\\exercism.io\\haskell\\pangram\\.stack-work\\install\\1e538474\\libexec\\x86_64-windows-ghc-8.10.7\\pangram-2.0.0.12"
sysconfdir = "C:\\Kasper\\projects\\exercism.io\\haskell\\pangram\\.stack-work\\install\\1e538474\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pangram_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pangram_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "pangram_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "pangram_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pangram_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pangram_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
