module Main where

import Criterion.Main
import Suffix

longString = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

main = do
    defaultMain [ bgroup "suffixes-short"
                      [ bench "suffix (paramorphism)" $ nf suffix "tails"
                      , bench "suffix (pattern matching)" $ nf suffixPattern "tails"
                      , bench "suffix (pattern matching v2)" $ nf suffixPattern2 "tails"
                      , bench "suffix (pattern matching v3)" $ nf suffixPattern3 "tails"
                      , bench "suffix (list comprehension)" $ nf suffixList "tails"
                      , bench "suffix (zipper)" $ nf suffixZipper "tails"
                      , bench "suffix (functoriality)" $ nf suffixFunctor "tails"
                      , bench "suffix (pattern matching done right)" $ nf suffixPattern4 "tails"
                      , bench "suffix (hylophorphism)" $ nf suffixHylo "tails" ]
                , bgroup "suffixes-medium"
                      [ bench "suffix (paramorphism)" $ nf suffix "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching)" $ nf suffixPattern "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching v2)" $ nf suffixPattern2 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching v3)" $ nf suffixPattern3 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (list comprehension)" $ nf suffixList "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (zipper)" $ nf suffixList "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (functoriality)" $ nf suffixFunctor "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (pattern matching done right)" $ nf suffixPattern4 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                      , bench "suffix (hylophorphism)" $ nf suffixHylo "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" ]
                , bgroup "suffixes-long"
                      [ bench "suffix (paramorphism)" $ nf suffix longString
                      , bench "suffix (pattern matching)" $ nf suffixPattern longString
                      , bench "suffix (pattern matching v2)" $ nf suffixPattern2 longString
                      , bench "suffix (pattern matching v3)" $ nf suffixPattern3 longString
                      , bench "suffix (list comprehension)" $ nf suffixList longString
                      , bench "suffix (zipper)" $ nf suffixList longString
                      , bench "suffix (functoriality)" $ nf suffixFunctor longString
                      , bench "suffix (pattern matching done right)" $ nf suffixPattern4 longString
                      , bench "suffix (hylophorphism)" $ nf suffixHylo longString ]
                ]
