{-# LANGUAGE TemplateHaskell #-}

module Lenses.VirtualFields where

import           Control.Lens
import           Data.List

data User =
  User
    { _firstName :: String
    , _lastName  :: String
    , _email     :: String
    }
  deriving (Show)

makeLenses ''User

usernameLens :: Lens' User String
usernameLens = email

getFullname :: User -> String
getFullname user = view firstName user ++ " " ++ view lastName user

setFullName :: User -> String -> User
setFullName user newName =
  user {_firstName = head nameList, _lastName = unwords $ tail nameList}
  where
    nameList = words newName

fullName :: Lens' User String
fullName = lens getFullname setFullName
