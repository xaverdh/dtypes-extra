{-# language FlexibleInstances #-}
module DTypes.Instances.AlternativeInducesMonoid where

import DTypes.Classes.DApplicative
import Control.Applicative

instance (DApplicative d,Alternative f) => Monoid (d f) where
  mempty = dpure empty
  mappend = dliftA2 (<|>)

