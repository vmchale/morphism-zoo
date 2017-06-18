{-# LANGUAGE TemplateHaskell #-}

module Main where

import Criterion.Main
import Suffix

shortString :: String
shortString = "tails" 

mediumString :: String
mediumString = replicate 20 'a'

longString :: String
longString = replicate 100 'a'

extraLongString :: String
extraLongString = replicate 1000 'a'

main = do
    defaultMain [ bgroup "suffixes-short"
                      [ bench "suffix (paramorphism)" $ nf suffix shortString
                      , bench "suffix (pattern matching)" $ nf suffixPattern shortString
                      , bench "suffix (pattern matching v2)" $ nf suffixPattern2 shortString
                      , bench "suffix (pattern matching v3)" $ nf suffixPattern3 shortString
                      , bench "suffix (list comprehension)" $ nf suffixList shortString
                      , bench "suffix (zipper)" $ nf suffixZipper shortString
                      , bench "suffix (functoriality)" $ nf suffixFunctor shortString
                      , bench "suffix (pattern matching done right)" $ nf suffixPattern4 shortString
                      , bench "suffix (hylomorphism)" $ nf suffixHylo shortString ]
                , bgroup "suffixes-medium"
                      [ bench "suffix (paramorphism)" $ nf suffix mediumString
                      , bench "suffix (pattern matching)" $ nf suffixPattern mediumString
                      , bench "suffix (pattern matching v2)" $ nf suffixPattern2 mediumString
                      , bench "suffix (pattern matching v3)" $ nf suffixPattern3 mediumString
                      , bench "suffix (list comprehension)" $ nf suffixList mediumString
                      , bench "suffix (zipper)" $ nf suffixList mediumString
                      , bench "suffix (functoriality)" $ nf suffixFunctor mediumString
                      , bench "suffix (pattern matching done right)" $ nf suffixPattern4 mediumString
                      , bench "suffix (hylomorphism)" $ nf suffixHylo mediumString ]
                , bgroup "suffixes-long"
                      [ bench "suffix (paramorphism)" $ nf suffix longString
                      , bench "suffix (pattern matching)" $ nf suffixPattern longString
                      , bench "suffix (pattern matching v2)" $ nf suffixPattern2 longString
                      , bench "suffix (pattern matching v3)" $ nf suffixPattern3 longString
                      , bench "suffix (list comprehension)" $ nf suffixList longString
                      , bench "suffix (zipper)" $ nf suffixList longString
                      , bench "suffix (functoriality)" $ nf suffixFunctor longString
                      , bench "suffix (pattern matching done right)" $ nf suffixPattern4 longString
                      , bench "suffix (hylomorphism)" $ nf suffixHylo longString ]
                , bgroup "suffixes-extra-long"
                      [ bench "suffix (paramorphism)" $ nf suffix extraLongString
                      , bench "suffix (pattern matching)" $ nf suffixPattern extraLongString
                      , bench "suffix (pattern matching v2)" $ nf suffixPattern2 extraLongString
                      , bench "suffix (pattern matching v3)" $ nf suffixPattern3 extraLongString
                      , bench "suffix (list comprehension)" $ nf suffixList extraLongString
                      , bench "suffix (zipper)" $ nf suffixList extraLongString
                      , bench "suffix (functoriality)" $ nf suffixFunctor extraLongString
                      , bench "suffix (pattern matching done right)" $ nf suffixPattern4 extraLongString
                      , bench "suffix (hylomorphism)" $ nf suffixHylo extraLongString ]
                ]
