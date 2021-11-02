{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE TypeFamilyDependencies #-}
module Prelude.Dot.Entry
  ( Empty(..)
  , Pack(..)
  , Singleton(..)
  , FromList(..)
  ) where

import Data.Kind

class Empty t where
  empty :: t

class Pack t where
  type PackFrom t :: Type
  pack :: PackFrom t -> t

class Singleton (t :: Type) where
  type MkSingleton t = fun | fun -> t
  singleton :: MkSingleton t

class FromList t where
  type FromListElem t
  fromList :: [FromListElem t] -> t