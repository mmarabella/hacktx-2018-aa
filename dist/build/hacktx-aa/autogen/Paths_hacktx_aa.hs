{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hacktx_aa (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/madalynmarabella/.cabal/bin"
libdir     = "/Users/madalynmarabella/.cabal/lib/x86_64-osx-ghc-8.4.3/hacktx-aa-0.1.0.0-9WvgpJP5okg86LXD48l9lt-hacktx-aa"
dynlibdir  = "/Users/madalynmarabella/.cabal/lib/x86_64-osx-ghc-8.4.3"
datadir    = "/Users/madalynmarabella/.cabal/share/x86_64-osx-ghc-8.4.3/hacktx-aa-0.1.0.0"
libexecdir = "/Users/madalynmarabella/.cabal/libexec/x86_64-osx-ghc-8.4.3/hacktx-aa-0.1.0.0"
sysconfdir = "/Users/madalynmarabella/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hacktx_aa_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hacktx_aa_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hacktx_aa_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hacktx_aa_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hacktx_aa_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hacktx_aa_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
