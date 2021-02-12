module Polymorphic.ComposingLensesSpec where

import           Control.Lens
import           Test.Hspec

spec :: Spec
spec = do
  describe "Given example" $ do
    it "works" $ do
      view (_2 . _1 . _2) ("Ginerva", (("Galileo", "Waldo"), "Malfoy")) `shouldBe`
        "Waldo"
