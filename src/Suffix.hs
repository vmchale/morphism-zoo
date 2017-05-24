module Suffix where

import Data.Functor.Foldable
import Data.Functor.Identity
import Data.Composition

suffix :: [a] -> [[a]]
suffix = para suffixPseudoalg

-- | Our pseudoalgebra
suffixPseudoalg :: (Base [a]) ([a], [[a]]) -> [[a]]
suffixPseudoalg Nil        = mempty
suffixPseudoalg (Cons _ x) = uncurry go $ x
    where go y@(x:xs) suffixes = y:suffixes
          go _ suffixes        = suffixes

suffix' :: [a] -> [[a]]
suffix' x = reverse $ curry (snd . go) x mempty
    where go ((x:xs), suffixes) = go (xs, if not $ null xs then xs:suffixes else suffixes)
          go (_, suffixes)      = ([], suffixes)

suffix''' :: [a] -> [[a]]
suffix''' x = curry (snd . go) x mempty
    where go ((x:xs), suffixes) = go (xs, if not $ null xs then suffixes ++ [xs] else suffixes)
          go (_, suffixes)      = ([], suffixes)

suffix'' :: [a] -> [[a]]
suffix'' x = [ drop n x | n <- [1..(length x - 1)]]
