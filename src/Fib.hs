{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE KindSignatures    #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE DeriveFunctor     #-}
{-# LANGUAGE DeriveFoldable    #-}
{-# LANGUAGE DeriveTraversable #-}

module Fib
    ( fib
    , fibPattern
    , fibBig
    ) where

import Data.Functor.Foldable
import Data.Functor.Foldable.TH
import Data.Int

data Fib a = Add (Fib a) (Fib a)
    | Fix a

makeBaseFunctor ''Fib

algebra :: Num t => FibF t t -> t
algebra (AddF x1 x2) = x1 + x2
algebra (FixF x) = x

coalgebra :: (Num a, Num r, Eq r) => r -> FibF a r
coalgebra 0 = FixF 1
coalgebra 1 = FixF 1
coalgebra n = AddF (n-1) (n-2)

fib :: Int -> Int
fib = hylo algebra coalgebra

fibPattern :: Int -> Int
fibPattern 0 = 1
fibPattern 1 = 1
fibPattern n = fibPattern (n-1) + fibPattern (n-2)

fibBig :: Integer -> Integer
fibBig = hylo algebra coalgebra

--fibBig :: Integer -> Integer
--fibBig 0 = 1
--fibBig 1 = 1
--fibBig n = fibBigPattern (n-1) + fibBigPattern (n-2)
