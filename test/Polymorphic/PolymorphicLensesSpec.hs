module Polymorphic.PolymorphicLensesSpec where

import           Control.Lens
import           Polymorphic.PolymorphicLenses
import           Test.Hspec

spec :: Spec
spec = do
  describe "Polymorphic exc1 Preferences" $ do
    it "can set and get with bestLens" $ do
      let pr = Preferences "asd" "aws"
      view bestLens (set bestLens 123 pr) `shouldBe` 123
  describe "Result structure" $ do
    it "can set and get with resultLens" $ do
      let res = Result 123 $ Right "comment"
      view resultLens (set resultLens (Left 123) res) `shouldBe` Left 123
