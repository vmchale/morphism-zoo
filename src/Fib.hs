{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE KindSignatures    #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE DeriveFunctor     #-}
{-# LANGUAGE DeriveFoldable    #-}
{-# LANGUAGE DeriveTraversable #-}

module Fib
    ( fib
    , fibPattern
    , fibInt
    , fibIntPattern
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

fib :: Integer -> Integer
fib = hylo algebra coalgebra

fibInt :: Int -> Int
fibInt = hylo algebra coalgebra

fibIntPattern :: Int -> Int
fibIntPattern 0 = 1
fibIntPattern 1 = 1
fibIntPattern n = fibIntPattern (n-1) + fibIntPattern (n-2)

exec :: IO ()
exec = print $ map fib [0..20]

fibPattern :: Integer -> Integer
fibPattern 0 = 1
fibPattern 1 = 1
fibPattern n = fibPattern (n-1) + fibPattern (n-2)
