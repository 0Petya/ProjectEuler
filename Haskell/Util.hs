module Util (primes, fibonaccis, pythagTriplets, isPrime, primeSieve, isPalindrome, toDigits) where

primes :: [Integer]
primes = filter isPrime [2..]

fibonaccis :: [Integer]
fibonaccis = go 1 2
  where go x y = x:go y (x + y)

pythagTriplets :: [(Integer, Integer, Integer)]
pythagTriplets = [(a,b,c) | c <- [1..], b <- [1..c], a <- [1..b], (a ^ two) + (b ^ two) == (c ^ two)]
  where two = 2 :: Integer

isPrime :: Integer -> Bool
isPrime 1 = False
isPrime n = null [x | x <- [2..floor . sqrt $ (fromInteger n :: Float)], mod n x == 0]

primeSieve :: Integer -> [Integer]
primeSieve n
  | n < 2 = error "Invalid input. Must be > 1."
  | otherwise = go [2..n]
      where go [] = []
            go (x:xs)
              | x > (floor . sqrt $ (fromInteger n :: Float)) = x:xs
              | otherwise = x:go (filter (\y -> mod y x /= 0) xs)

isPalindrome :: Eq a => [a] -> Bool
isPalindrome x = x == reverse x

toDigits :: Integral x => x -> [x]
toDigits 0 = []
toDigits x = toDigits (div x 10) ++ [mod x 10]
