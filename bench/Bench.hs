module Main where

import Criterion.Main
import Suffix

main = do
    defaultMain [ bgroup "suffixes-short-whnf"
                      [ bench "suffix (paramorphism)" $ whnf suffix "tails"
                      , bench "suffix (pattern matching)" $ whnf suffixPattern "tails"
                      , bench "suffix (pattern matching v2)" $ whnf suffixPattern2 "tails"
                      , bench "suffix (pattern matching v3)" $ whnf suffixPattern3 "tails"
                      , bench "suffix (pattern matching ignore reverse)" $ whnf suffixPatternRev "tails"
                      , bench "suffix (list comprehension)" $ whnf suffixList "tails"
                      , bench "suffix (zipper)" $ whnf suffixZipper "tails"
                      , bench "suffix (functoriality)" $ whnf suffixFunctor "tails"
                      , bench "suffix (pattern matching done right)" $ whnf suffixPattern4 "tails"
                      , bench "suffix (hylophorphism)" $ whnf suffixHylo "tails" ]
                , bgroup "suffixes-long-whnf"
                      [ bench "suffix (paramorphism)" $ whnf suffix "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching)" $ whnf suffixPattern "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching v2)" $ whnf suffixPattern2 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching v3)" $ whnf suffixPattern3 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching ignore reverse)" $ whnf suffixPatternRev "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (list comprehension)" $ whnf suffixList "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (zipper)" $ whnf suffixList "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (functoriality)" $ whnf suffixFunctor "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching done right)" $ whnf suffixPattern4 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (hylophorphism)" $ whnf suffixHylo "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" ]
                , bgroup "suffixes-short-nf"
                      [ bench "suffix (paramorphism)" $ nf suffix "tails"
                      , bench "suffix (pattern matching)" $ nf suffixPattern "tails"
                      , bench "suffix (pattern matching v2)" $ nf suffixPattern2 "tails"
                      , bench "suffix (pattern matching v3)" $ nf suffixPattern3 "tails"
                      , bench "suffix (pattern matching ignore reverse)" $ nf suffixPatternRev "tails"
                      , bench "suffix (list comprehension)" $ nf suffixList "tails"
                      , bench "suffix (zipper)" $ nf suffixZipper "tails"
                      , bench "suffix (functoriality)" $ nf suffixFunctor "tails"
                      , bench "suffix (pattern matching done right)" $ nf suffixPattern4 "tails"
                      , bench "suffix (hylophorphism)" $ nf suffixHylo "tails" ]
                , bgroup "suffixes-long-nf"
                      [ bench "suffix (paramorphism)" $ nf suffix "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching)" $ nf suffixPattern "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching v2)" $ nf suffixPattern2 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching v3)" $ nf suffixPattern3 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching ignore reverse)" $ nf suffixPatternRev "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (list comprehension)" $ nf suffixList "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (zipper)" $ nf suffixList "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (functoriality)" $ nf suffixFunctor "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching done right)" $ nf suffixPattern4 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (hylophorphism)" $ nf suffixHylo "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" ]
                ]
