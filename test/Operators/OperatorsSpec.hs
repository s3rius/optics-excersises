module Operators.OperatorsSpec where

import           Control.Lens
import           Data.Char           (toUpper)
import           Operators.Operators
import           Test.Hspec

goalA :: Kingdom
goalA =
  Kingdom
    { _name = "Duloc: a perfect place"
    , _army = Army {_archers = 22, _knight = 42}
    , _gate = Gate {_open = False, _oilTemp = 10.0}
    }

goalB :: Kingdom
goalB =
  Kingdom
    { _name = "Dulocinstein"
    , _army = Army {_archers = 17, _knight = 14}
    , _gate = Gate {_open = True, _oilTemp = 100.0}
    }

goalC :: ([Char], Kingdom)
goalC =
  ( "Duloc: Home"
  , Kingdom
      { _name = "Duloc: Home of the talking Donkeys"
      , _army = Army {_archers = 22, _knight = 14}
      , _gate = Gate {_open = True, _oilTemp = 5.0}
      })

spec :: Spec
spec = do
  describe "Kindom" $ do
    it "can be processed as needed" $ do
      let resultA =
            duloc & name .~ "Duloc: a perfect place" & (army . knight) .~ 42 &
            (gate . open) .~
            False
      resultA `shouldBe` goalA
      let resultB =
            duloc & name .~ "Dulocinstein" & (army . archers) .~ 17 &
            (gate . oilTemp) .~
            100
      resultB `shouldBe` goalB
      let resultC =
            duloc & name .~ "Duloc: Home" & (gate . oilTemp) .~ 5 & name <<<>~
            " of the talking Donkeys"
      resultC `shouldBe` goalC
      let resultD = (False, "opossums") & _1 ||~ True
      resultD `shouldBe` (True, "opossums")
      let resultE = 2 & id *~ 3
      resultE `shouldBe` 6
      let resultF =
            ((True, "Dudley"), 55.0) & _1 . _2 <>~ " - the worst" & _2 -~ 15 &
            _2 //~
            2 &
            _1 .
            _2 %~
            map toUpper &
            _1 .
            _1 .~
            False
      resultF `shouldBe` ((False, "DUDLEY - THE WORST"), 20.0)
