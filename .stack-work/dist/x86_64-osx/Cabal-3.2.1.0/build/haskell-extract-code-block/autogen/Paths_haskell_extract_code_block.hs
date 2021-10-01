{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_haskell_extract_code_block (
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

bindir     = "/Users/aaa/myfile/github/haskell-extract-code-block/.stack-work/install/x86_64-osx/d7f578d6b10ae0536af8dc8e89cb7a01edbc718a3c48c892ccc9f2b779755930/8.10.4/bin"
libdir     = "/Users/aaa/myfile/github/haskell-extract-code-block/.stack-work/install/x86_64-osx/d7f578d6b10ae0536af8dc8e89cb7a01edbc718a3c48c892ccc9f2b779755930/8.10.4/lib/x86_64-osx-ghc-8.10.4/haskell-extract-code-block-0.1.0.0-8LAKjMXWlCHEJZnwanvuE3-haskell-extract-code-block"
dynlibdir  = "/Users/aaa/myfile/github/haskell-extract-code-block/.stack-work/install/x86_64-osx/d7f578d6b10ae0536af8dc8e89cb7a01edbc718a3c48c892ccc9f2b779755930/8.10.4/lib/x86_64-osx-ghc-8.10.4"
datadir    = "/Users/aaa/myfile/github/haskell-extract-code-block/.stack-work/install/x86_64-osx/d7f578d6b10ae0536af8dc8e89cb7a01edbc718a3c48c892ccc9f2b779755930/8.10.4/share/x86_64-osx-ghc-8.10.4/haskell-extract-code-block-0.1.0.0"
libexecdir = "/Users/aaa/myfile/github/haskell-extract-code-block/.stack-work/install/x86_64-osx/d7f578d6b10ae0536af8dc8e89cb7a01edbc718a3c48c892ccc9f2b779755930/8.10.4/libexec/x86_64-osx-ghc-8.10.4/haskell-extract-code-block-0.1.0.0"
sysconfdir = "/Users/aaa/myfile/github/haskell-extract-code-block/.stack-work/install/x86_64-osx/d7f578d6b10ae0536af8dc8e89cb7a01edbc718a3c48c892ccc9f2b779755930/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_extract_code_block_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_extract_code_block_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskell_extract_code_block_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskell_extract_code_block_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_extract_code_block_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_extract_code_block_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
