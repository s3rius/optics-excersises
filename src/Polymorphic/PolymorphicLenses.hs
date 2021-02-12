module Polymorphic.PolymorphicLenses where

import           Control.Lens
import           Data.Either

-- | Second task's structure.
data Preferences a =
  Preferences
    { _best  :: a
    , _worst :: String
    }
  deriving (Show)

bestLens :: Lens (Preferences a) (Preferences b) a b
bestLens = lens getter setter
  where
    getter :: Preferences a -> a
    getter = _best
    setter :: Preferences a -> b -> Preferences b
    setter prefs newBest = prefs {_best = newBest}

-- | Third task's structure.
data Result e =
  Result
    { _lineNumber :: Int
    , _result     :: Either e String
    }

resultLens :: Lens (Result a) (Result b) (Either a String) (Either b String)
resultLens = lens getter setter
  where
    getter :: Result a -> Either a String
    getter = _result
    setter :: Result a -> Either b String -> Result b
    setter res newres = res {_result = newres}
