module Util (isPrime, primes, fibonaccis, isPalindrome) where

isPrime :: Integer -> Bool
isPrime 1 = False
isPrime n = null [x | x <- [2..floor . sqrt $ (fromInteger n :: Float)], mod n x == 0]

primes :: [Integer]
primes = filter isPrime [2..]

fibonaccis :: [Integer]
fibonaccis = go 1 2
  where go x y = x:go y (x + y)

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x
