module Lenses.ProductPrices where

import           Control.Lens

data ProducePrices =
  ProducePrices
    { _limePrice  :: Float
    , _lemonPrice :: Float
    }
  deriving (Show)

limePrice :: Lens' ProducePrices Float
limePrice = lens getter setter
  where
    getter = _limePrice
    setter prices new_price =
      prices
        { _limePrice = correct_price new_price
        , _lemonPrice = correct_price new_price + 0.5
        }
    correct_price new_price = max new_price 0.0

lemonPrice :: Lens' ProducePrices Float
lemonPrice = lens getter setter
  where
    getter = _lemonPrice
    setter prices new_price =
      prices
        { _lemonPrice = correct_price new_price
        , _limePrice = correct_price new_price + 0.5
        }
    correct_price new_price = max new_price 0.0
