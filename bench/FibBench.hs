module Main where

import Criterion.Main
import Fib

main = 
    defaultMain [ bgroup "fib"
                      [ bench "10" $ nf fib 10 
                      , bench "15" $ nf fib 15
                      , bench "20" $ nf fib 20 ]
                , bgroup "fib'"
                      [ bench "10" $ nf fib' 10 
                      , bench "15" $ nf fib' 15
                      , bench "20" $ nf fib' 20 ]
                , bgroup "fibInt"
                      [ bench "10" $ nf fibInt 10 
                      , bench "15" $ nf fibInt 15
                      , bench "20" $ nf fibInt 20 ]
                , bgroup "fibInt'"
                      [ bench "10" $ nf fibInt' 10 
                      , bench "15" $ nf fibInt' 15
                      , bench "20" $ nf fibInt' 20 ]
                ]
