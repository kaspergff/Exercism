module Pangram (isPangram) where

import Data.List
import Data.Char


isPangram :: String -> Bool
isPangram = (==26) . length . nub . filter(\x -> x `elem` ['a'..'z'] ) . map toLower
