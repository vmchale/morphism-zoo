module Suffix ( factPattern
              ) where

factPattern :: Int -> Int
factPattern 0 = 1
factPattern 1 = 1
factPattern n = n * factPattern (n - 1)
