{-# LANGUAGE TemplateHaskell #-}

module Lenses.Ship where

import           Control.Lens

data Ship =
  Ship
    { _name    :: String
    , _numCrew :: Int
    }
  deriving (Show, Eq)

makeLenses ''Ship

purplePearl :: Ship
purplePearl = Ship {_name = "Purple Pearl", _numCrew = 38}
