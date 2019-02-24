module EffectZoo.Scenario.FileSizes.RIO.File where

import RIO hiding ( HasLogFunc(..) )
import Control.Monad.IO.Class
import qualified EffectZoo.Scenario.FileSizes.Shared as Shared

newtype FileFunc = FileFunc ( FilePath -> IO ( Maybe Int ) )

class HasFileFunc env where
  fileFuncL :: Lens' env FileFunc

tryFileSize :: HasFileFunc env => FilePath -> RIO env (Maybe Int)
tryFileSize path =
  view fileFuncL >>= \(FileFunc f) -> liftIO ( f path )

ioFileFunc :: FileFunc
ioFileFunc =
  FileFunc Shared.tryGetFileSize