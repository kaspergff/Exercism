{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_leap (
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
version = Version [1,6,0,10] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Kasper\\projects\\exercism.io\\haskell\\leap\\.stack-work\\install\\1e538474\\bin"
libdir     = "C:\\Kasper\\projects\\exercism.io\\haskell\\leap\\.stack-work\\install\\1e538474\\lib\\x86_64-windows-ghc-8.10.7\\leap-1.6.0.10-A2a3Qe2p4gyG4u5KT35U8K-test"
dynlibdir  = "C:\\Kasper\\projects\\exercism.io\\haskell\\leap\\.stack-work\\install\\1e538474\\lib\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\Kasper\\projects\\exercism.io\\haskell\\leap\\.stack-work\\install\\1e538474\\share\\x86_64-windows-ghc-8.10.7\\leap-1.6.0.10"
libexecdir = "C:\\Kasper\\projects\\exercism.io\\haskell\\leap\\.stack-work\\install\\1e538474\\libexec\\x86_64-windows-ghc-8.10.7\\leap-1.6.0.10"
sysconfdir = "C:\\Kasper\\projects\\exercism.io\\haskell\\leap\\.stack-work\\install\\1e538474\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "leap_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "leap_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "leap_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "leap_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "leap_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "leap_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
