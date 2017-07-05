{-# LANGUAGE TemplateHaskell #-}

module Main where

import Criterion.Main
import Suffix

shortString :: String
shortString = "tails" 

mediumString :: String
mediumString = replicate 20 'a'

unicodeString :: String
unicodeString = "བོད་སྐད་ལ་པདི་ག་ར་རེད།"

longString :: String
longString = replicate 100 'a'

extraLongString :: String
extraLongString = replicate 1000 'a'

main = do
    defaultMain [ bgroup "suffixes-short"
                      [ bench "suffix (hylomorphism)" $ nf suffixHylo shortString ]
                , bgroup "suffixes-medium"
                      [ bench "suffix (hylomorphism)" $ nf suffixHylo mediumString ]
                , bgroup "suffixes-unicode"
                      [ bench "suffix (hylomorphism)" $ nf suffixHylo unicodeString ]
                , bgroup "suffixes-long"
                      [ bench "suffix (hylomorphism)" $ nf suffixHylo longString ]
                , bgroup "suffixes-extra-long"
                      [ bench "suffix (hylomorphism)" $ nf suffixHylo extraLongString ]
                ]
