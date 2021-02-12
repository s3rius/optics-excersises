module Lenses.ProductPricesSpec where

import           Control.Lens
import           Lenses.ProductPrices
import           Test.Hspec

spec :: Spec
spec = do
  let prices = ProducePrices 1.1 2.2
  describe "Self correcting lenses" $ do
    it "can correct values on set" $ do
      view limePrice (set limePrice (-10) prices) `shouldBe` 0.0
      view lemonPrice (set lemonPrice (-10) prices) `shouldBe` 0.0
    it "can pass values if they are correct" $ do
      view limePrice (set limePrice 33.4 prices) `shouldBe` 33.4
      view lemonPrice (set lemonPrice 15.6 prices) `shouldBe` 15.6
    it "can correct both values" $ do
      let new_prices = set limePrice (-10) prices
      view lemonPrice new_prices - view limePrice new_prices `shouldBe` 0.5
