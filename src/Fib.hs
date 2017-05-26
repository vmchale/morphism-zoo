{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE KindSignatures    #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE DeriveFunctor     #-}
{-# LANGUAGE DeriveFoldable    #-}
{-# LANGUAGE DeriveTraversable #-}

module Fib
    ( fib
    , fib'
    , fibInt
    , fibInt'
    ) where

import Data.Functor.Foldable
import Data.Functor.Foldable.TH

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

fibInt' :: Int -> Int
fibInt' 0 = 1
fibInt' 1 = 1
fibInt' n = fibInt' (n-1) + fibInt' (n-2)

exec :: IO ()
exec = print $ map fib [0..20]

fib' :: Integer -> Integer
fib' 0 = 1
fib' 1 = 1
fib' n = fib' (n-1) + fib' (n-2)
