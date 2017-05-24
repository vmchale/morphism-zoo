import Test.Hspec
import Suffix
import Test.QuickCheck

main :: IO ()
main = hspec $ do
    describe "suffix" $ do
        parallel $ it "returns the suffixes of a list" $ do
            suffix "tails" `shouldBe` ["ails","ils","ls","s"]
        parallel $ it "drops the first letter" $
            property $ \x xs -> not $ ([x] :: String) `elem` (suffix (x:xs))
        parallel $ it "doesn't include the empty string" $
            property $ \s -> not $ "" `elem` suffix s
    describe "suffix'" $ do
        parallel $ it "agrees with suffix" $
            property $ \s -> suffix' s == (suffix s :: [String])
    describe "suffix''" $ do
        parallel $ it "agrees with suffix'" $
            property $ \s -> suffix'' s == (suffix' s :: [String])
    describe "suffix'''" $ do
        parallel $ it "agrees with suffix''" $
            property $ \s -> suffix''' s == (suffix'' s :: [String])
