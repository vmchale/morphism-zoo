import Test.Hspec
import Suffix
import Test.QuickCheck
import Fib

main :: IO ()
main = hspec $ do
    describe "fib" $ do
        parallel $ it "gives fibonacci numbers" $ 
            fib 10 `shouldBe` 89
    describe "fib'" $ do
        parallel $ it "gives fibonacci numbers" $ 
            fib; 10 `shouldBe` 89
    describe "suffix" $ do
        parallel $ it "returns the suffixes of a list" $ do
            suffix "tails" `shouldBe` ["ails","ils","ls","s"]
        parallel $ it "returns nothing for singletons" $ do
            property $ \x -> suffix (pure x :: String) `shouldBe` mempty
        --parallel $ it "drops the first letter" $
        --    property $ \x xs -> not $ ([x] :: String) `elem` (suffix (x:xs))
        parallel $ it "doesn't include the empty string" $
            property $ \s -> not $ "" `elem` suffix s
        parallel $ it "includes exerything aside from the first letter" $
            property $ \x xs -> all (\c -> any (c `elem`) (suffix (x:xs))) (xs :: String)
    describe "suffixPattern" $ do
        parallel $ it "agrees with suffix" $
            property $ \s -> suffixPattern s == (suffix s :: [String])
    describe "suffixPattern2" $ do
        parallel $ it "agrees with suffixPattern" $
            property $ \s -> suffixPattern2 s == (suffixPattern s :: [String])
    describe "suffixList" $ do
        parallel $ it "agrees with suffixPattern2" $
            property $ \s -> suffixList s == (suffixPattern2 s :: [String])
    describe "suffixFunctor" $ do
        parallel $ it "returns the suffixes of a list" $ do
            suffix "tails" `shouldBe` ["ails","ils","ls","s"]
    describe "suffixZipper" $ do
        parallel $ it "agrees with suffixFunctor" $
            property $ \s -> suffixZipper s == (suffixFunctor s :: [String])
    describe "suffixHylo" $ do
        parallel $ it "agrees with suffixZipper" $
            property $ \s -> suffixHylo s == (suffixZipper s :: [String])
    describe "suffixPattern4" $ do
        parallel $ it "agrees with suffixZipper" $
            property $ \s -> suffixPattern4 s == (suffixHylo s :: [String])
