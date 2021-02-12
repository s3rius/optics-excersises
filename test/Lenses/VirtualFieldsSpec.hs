module Lenses.VirtualFieldsSpec where

import           Control.Lens
import           Lenses.VirtualFields
import           Test.Hspec

spec :: Spec
spec = do
  let user = User "John" "Cena" "invisible@example.com"
  describe "Virtual field owner" $ do
    it "can do computations on set field" $ do
      let new_full_name = "Doctor of Thuganomics"
      let new_user = set fullName new_full_name user
      view fullName new_user `shouldBe` new_full_name
    it "can do computations on view fild" $ do
      view fullName user `shouldBe` "John Cena"
