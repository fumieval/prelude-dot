module Prelude.Dot.Entry
  ( Empty(..)
  , Pack(..)
  ) where

import Data.Kind

class Empty t where
  empty :: t

class Pack t where
  type PackFrom t :: Type
  pack :: PackFrom t -> t