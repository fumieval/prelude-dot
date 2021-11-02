{-# LANGUAGE UndecidableInstances #-}
module Prelude.Dot.HashMap (HashMap) where

import Prelude (flip, String, Maybe, Bool, Eq)
import Prelude.Dot.Entry
import GHC.Records
import Data.HashMap.Strict as HM
import Data.Hashable

instance (Eq k, Hashable k) => Singleton (HashMap k v) where
  type MkSingleton (HashMap k v) = k -> v -> HashMap k v
  singleton k v = HM.singleton k v

instance (Eq k, Hashable k) => FromList (HashMap k v) where
  type FromListElem (HashMap k v) = (k, v)
  fromList = HM.fromList

instance Empty (HashMap k v) where
  empty = HM.empty

instance (Eq k, Hashable k) => HasField "null" (HashMap k v) Bool where
  getField = null

instance (Eq k, Hashable k) => HasField "insertWith" (HashMap k v) ((v -> v -> v) -> k -> v -> HashMap k v) where
  getField m f k v = insertWith f k v m

instance (Eq k, Hashable k) => HasField "insert" (HashMap k v) (k -> v -> HashMap k v) where
  getField m k v = insert k v m

instance (Eq k, Hashable k) => HasField "lookup" (HashMap k v) (k -> Maybe v) where
  getField = flip lookup

instance (Eq k, Hashable k) => HasField "delete" (HashMap k v) (k -> HashMap k v) where
  getField = flip delete

instance (Eq k, Hashable k) => HasField "alter" (HashMap k v) ((Maybe v -> Maybe v) -> k -> HashMap k v) where
  getField m f k = alter f k m

instance (Eq k, Hashable k) => HasField "adjust" (HashMap k v) ((v -> v) -> k -> HashMap k v) where
  getField m f k = adjust f k m

instance (Eq k, Hashable k) => HasField "toList" (HashMap k v) [(k, v)] where
  getField = toList
