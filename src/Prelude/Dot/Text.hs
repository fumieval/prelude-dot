module Prelude.Dot.Text where

import Prelude (flip, String, Maybe, Bool)
import GHC.Records
import Data.Text

instance HasField "null" Text Bool where
  getField = null

instance HasField "unpack" Text String where
  getField = unpack

instance HasField "unlines" [Text] Text where
  getField = unlines

instance HasField "lines" Text [Text] where
  getField = lines

instance HasField "splitOn" Text (Text -> [Text]) where
  getField = flip splitOn

instance HasField "stripPrefix" Text (Text -> Maybe Text) where
  getField = flip stripPrefix