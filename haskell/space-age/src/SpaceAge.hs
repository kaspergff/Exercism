module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
  deriving Eq

ageOn :: Planet -> Float -> Float
ageOn planet seconds
  | planet == Mercury = seconds / eartSec / 0.2408467
  | planet == Venus = seconds / eartSec / 0.61519726 
  | planet == Earth = seconds / eartSec
  | planet == Mars = seconds / eartSec / 1.8808158 
  | planet == Jupiter = seconds / eartSec / 11.862615
  | planet == Saturn = seconds / eartSec / 29.447498
  | planet == Uranus = seconds / eartSec / 84.016846
  | otherwise = seconds / eartSec / 164.79132
  
  where eartSec = 31557600
