module Lenses.BreakingLaws where

import           Control.Lens
import           Lenses.Ship

setConstName :: Ship -> String -> Ship
setConstName ship _ = ship {_name = "broken"}

brokenLens :: Lens' Ship String
brokenLens = lens _name setConstName
