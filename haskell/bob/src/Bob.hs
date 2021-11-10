module Bob (responseFor) where

import Data.Char
import Data.List

responseFor :: String -> String
responseFor xs
  | all isSpace xs = "Fine. Be that way!"
  | last xs == '?' && map toUpper xs == xs && any isLetter xs= "Calm down, I know what I'm doing!"
  | map toUpper xs == xs && any isLetter xs = "Whoa, chill out!"
  | isSuffixOf "?" xs = "Sure."
  | otherwise = "Whatever."
