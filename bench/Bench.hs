module Main where

import Criterion.Main
import Suffix

main = do
    defaultMain [ bgroup "suffixes-short"
                      [ bench "suffix (recursion schemes)" $ whnf suffix "tails"
                      {--, bench "suffix (pattern matching)" $ whnf suffixPattern "tails"
                      , bench "suffix (pattern matching v2)" $ whnf suffixPattern2 "tails"
                      , bench "suffix (pattern matching v3)" $ whnf suffixPattern3 "tails"
                      , bench "suffix (pattern matching ignore reverse)" $ whnf suffixPatternRev "tails"
                      , bench "suffix (list comprehension)" $ whnf suffixList "tails"
                      , bench "suffix (zipper)" $ whnf suffixZipper "tails"
                      , bench "suffix (functoriality)" $ whnf suffixFunctor "tails"--}
                      , bench "suffix (hylophorphism)" $ whnf suffixHylo "tails" ]
                {--, bgroup "suffixes-long"
                      [ bench "suffix (recursion schemes)" $ whnf suffix "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching)" $ whnf suffixPattern "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching v2)" $ whnf suffixPattern2 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching v3)" $ whnf suffixPattern3 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching ignore reverse)" $ whnf suffixPatternRev "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (list comprehension)" $ whnf suffixList "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (zipper)" $ whnf suffixList "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (functoriality)" $ whnf suffixFunctor "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" ]--}
                ]
