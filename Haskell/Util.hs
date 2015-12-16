module Util (primes, fibonaccis, pythagTriplets, isPrime, isPalindrome, toDigits) where

primes :: [Integer]
primes = filter isPrime [2..]

fibonaccis :: [Integer]
fibonaccis = go 1 2
  where go x y = x:go y (x + y)

pythagTriplets :: [(Integer, Integer, Integer)]
pythagTriplets = [(a,b,c) | c <- [1..], b <- [1..c], a <- [1..b], (a ^ 2) + (b ^ 2) == (c ^ 2)]

isPrime :: Integer -> Bool
isPrime 1 = False
isPrime n = null [x | x <- [2..floor . sqrt $ (fromInteger n :: Float)], mod n x == 0]

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

toDigits :: Integral x => x -> [x]
toDigits 0 = []
toDigits x = toDigits (div x 10) ++ [mod x 10]
