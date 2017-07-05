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
                , bgroup "fib (big)"
                      [ bench "10" $ nf fibBig 10 
                      , bench "15" $ nf fibBig 15
                      , bench "20" $ nf fibBig 20 ]
                ]
