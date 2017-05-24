module Main where

import Criterion.Main
import Suffix

main = do
    defaultMain [ bgroup "suffixes"
                      [ bench "suffix (recursion schemes)" $ whnf suffix "tails"
                      , bench "suffix (pattern matching)" $ whnf suffix' "tails"
                      , bench "suffix (pattern matching v2)" $ whnf suffix'' "tails"
                      , bench "suffix (list comprehension)" $ whnf suffix''' "tails" ]
                ]
