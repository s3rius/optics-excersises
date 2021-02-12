{-# LANGUAGE TemplateHaskell #-}

module Operators.Operators where

import           Control.Lens

data Gate =
  Gate
    { _open    :: Bool
    , _oilTemp :: Float
    }
  deriving (Show, Eq)

data Army =
  Army
    { _archers :: Int
    , _knight  :: Int
    }
  deriving (Show, Eq)

data Kingdom =
  Kingdom
    { _name :: String
    , _army :: Army
    , _gate :: Gate
    }
  deriving (Show, Eq)

duloc :: Kingdom
duloc =
  Kingdom
    { _name = "Duloc"
    , _army = Army {_archers = 22, _knight = 14}
    , _gate = Gate {_open = True, _oilTemp = 10.0}
    }

makeLenses ''Gate

makeLenses ''Army

makeLenses ''Kingdom
