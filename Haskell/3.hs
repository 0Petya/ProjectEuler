{-
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?
-}

isPrime :: Integer -> Bool
isPrime n = null [x | x <- [2..ceiling . sqrt $ a], mod n x == 0]
  where a = fromInteger n :: Float

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n = last . filter isPrime $ [x | x <- [1..ceiling (sqrt a)], mod n x == 0]
  where a = fromInteger n :: Float

main :: IO ()
main = print . largestPrimeFactor $ 600851475143
