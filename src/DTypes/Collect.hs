{-# language TypeOperators, TypeFamilies #-}
module DTypes.Collect
  ( collect
  , collectMaybe
  ) where


import DTypes.Classes.DTraversable
import DTypes.Classes.HasDType
import DTypes.Trafo
import DTypes.Compose

import Control.Applicative
import Data.Functor.Identity


collect :: (DTraversable d,HasDType a,d ~ DType a,Applicative f)
  => d f -> f a
collect = fmap dosi . dtraverse trf
  where
    trf :: Functor f => (f ==> Compose f Identity)
    trf = Compose . fmap Identity

collectMaybe :: (DTraversable d,HasDType a,d ~ DType a)
  => d Maybe -> Maybe a
collectMaybe = collect



