import           Fib
import           Suffix
import           Test.Hspec
import           Test.QuickCheck
import PlusMinus

main :: IO ()
main = hspec $ do
    describe "plusMinus" $ do
        parallel $ it "should work" $
            plusMinusInt [1,2,3] `shouldBe` -4
        parallel $ it "should give the same results" $
            property $ \x -> plusMinusInt (x :: [Int]) == plusMinusBoring x
    describe "fib" $ do
        parallel $ it "gives fibonacci numbers" $
            fib 10 `shouldBe` 89
    describe "fibPattern" $ do
        parallel $ it "gives fibonacci numbers" $
            fib 10 `shouldBe` 89
    describe "suffix" $ do
        parallel $ it "returns the suffixes of a list" $ do
            suffix "tails" `shouldBe` ["ails","ils","ls","s"]
        parallel $ it "works with unicode" $ do
            suffix "ང་ན་ཡིན།" `shouldBe` -- FIXME this is bad grammar
                 [ "\3851\3923\3851\3937\3954\3923\3853"
                 , "\3923\3851\3937\3954\3923\3853"
                 , "\3851\3937\3954\3923\3853"
                 , "\3937\3954\3923\3853"
                 , "\3954\3923\3853"
                 , "\3923\3853"
                 , "\3853"]
        parallel $ it "returns nothing for singletons" $ do
            property $ \x -> suffix (pure x :: String) `shouldBe` mempty
        parallel $ it "drops the first letter" $
            property $ \x xs -> (not $ ([x] :: String) `elem` (suffix (x:xs))) || length xs <= 1 || x `elem` xs
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
