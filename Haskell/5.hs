{-
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
-}

import Data.List (groupBy, elemIndex)
import Data.Maybe (fromJust)

modulateTuples :: [[(Integer, Integer)]] -> [[Integer]]
modulateTuples xs = map (\x -> map (\y -> mod (fst y) (snd y)) x) $ xs

tupleMultiples :: [Integer] -> [[(Integer, Integer)]]
tupleMultiples xs = groupBy (\x y -> fst x == fst y) [(y, x) | y <- [2,4..], x <- xs]

main :: IO ()
main = print ((fromJust . elemIndex [] . map (filter (/= 0)) . modulateTuples . tupleMultiples $ [1..20]) * 2 + 2)
