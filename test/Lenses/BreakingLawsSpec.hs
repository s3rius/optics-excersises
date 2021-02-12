module Lenses.BreakingLawsSpec where

import           Control.Lens
import           Lenses.BreakingLaws
import           Lenses.Ship
import           Test.Hspec

spec :: Spec
spec = do
  describe "Unlawful lense" $ do
    it "can't get back what you set" $ do
      view brokenLens (set brokenLens (show "123") purplePearl) `shouldBe`
        "broken"
    it "can't set back what you got" $ do
      set brokenLens (view brokenLens purplePearl) purplePearl `shouldNotBe`
        purplePearl
    it "has idempotence on set" $ do
      set brokenLens "a" (set brokenLens "b" purplePearl) `shouldBe`
        set brokenLens "a" purplePearl
