module Main where

import Criterion.Main
import Fib

main = 
    defaultMain [ bgroup "fib (hylomorphism)"
                      [ bench "10" $ nf fib 10 
                      , bench "15" $ nf fib 15
                      , bench "20" $ nf fib 20 ]
                , bgroup "fib (pattern matching)"
                      [ bench "10" $ nf fibPattern 10 
                      , bench "15" $ nf fibPattern 15
                      , bench "20" $ nf fibPattern 20 ]
                , bgroup "fibInt (hylomorphism + small ints)"
                      [ bench "10" $ nf fibInt 10 
                      , bench "15" $ nf fibInt 15
                      , bench "20" $ nf fibInt 20 ]
                , bgroup "fibInt (pattern matching + small ints)"
                      [ bench "10" $ nf fibIntPattern 10 
                      , bench "15" $ nf fibIntPattern 15
                      , bench "20" $ nf fibIntPattern 20 ]
                ]
