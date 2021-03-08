{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_my_project (
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

bindir     = "/home/kiyotakakudo/IdeaProjects/haskell/ciphers/github/ciphers/.stack-work/install/x86_64-linux-tinfo6/8266f5f2b6a16f4d4f4fd5e1267449ec40d150d4e532088e527bcad3f41ddddf/8.8.4/bin"
libdir     = "/home/kiyotakakudo/IdeaProjects/haskell/ciphers/github/ciphers/.stack-work/install/x86_64-linux-tinfo6/8266f5f2b6a16f4d4f4fd5e1267449ec40d150d4e532088e527bcad3f41ddddf/8.8.4/lib/x86_64-linux-ghc-8.8.4/my-project-0.1.0.0-F3dvPPT7hGw4WcAY6pGw4H"
dynlibdir  = "/home/kiyotakakudo/IdeaProjects/haskell/ciphers/github/ciphers/.stack-work/install/x86_64-linux-tinfo6/8266f5f2b6a16f4d4f4fd5e1267449ec40d150d4e532088e527bcad3f41ddddf/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/kiyotakakudo/IdeaProjects/haskell/ciphers/github/ciphers/.stack-work/install/x86_64-linux-tinfo6/8266f5f2b6a16f4d4f4fd5e1267449ec40d150d4e532088e527bcad3f41ddddf/8.8.4/share/x86_64-linux-ghc-8.8.4/my-project-0.1.0.0"
libexecdir = "/home/kiyotakakudo/IdeaProjects/haskell/ciphers/github/ciphers/.stack-work/install/x86_64-linux-tinfo6/8266f5f2b6a16f4d4f4fd5e1267449ec40d150d4e532088e527bcad3f41ddddf/8.8.4/libexec/x86_64-linux-ghc-8.8.4/my-project-0.1.0.0"
sysconfdir = "/home/kiyotakakudo/IdeaProjects/haskell/ciphers/github/ciphers/.stack-work/install/x86_64-linux-tinfo6/8266f5f2b6a16f4d4f4fd5e1267449ec40d150d4e532088e527bcad3f41ddddf/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "my_project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "my_project_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "my_project_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "my_project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
