module Util (primes, fibonaccis, pythagTriplets, triangleNumbers, collatz, isPrime, primeSieve, primeFactorization, isPalindrome, toDigits, divisors, numOfDivisors, factorial, centralBinomialCoefficient) where

import Data.List

primes :: [Integer]
primes = filter isPrime [2..]

fibonaccis :: [Integer]
fibonaccis = go 1 2
  where go x y = x:go y (x + y)

pythagTriplets :: [(Integer, Integer, Integer)]
pythagTriplets = [(a,b,c) | c <- [1..], b <- [1..c], a <- [1..b], (a ^ two) + (b ^ two) == (c ^ two)]
  where two = 2 :: Integer

triangleNumbers :: [Integer]
triangleNumbers = go 0 1
  where go x i = n:go n (i + 1)
          where n = x + i

collatz :: Integer -> [Integer]
collatz x
  | x == 1 = [1]
  | mod x 2 == 0 = x:(collatz . div x $ 2)
  | otherwise = x:collatz (3 * x + 1)

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

primeFactorization :: Integer -> [Integer]
primeFactorization n = go n . primeSieve $ n
  where go _ [] = []
        go x (p:ps)
          | isPrime x = [x]
          | mod x p == 0 = p:go (div x p) (p:ps)
          | otherwise = go x ps

isPalindrome :: Eq a => [a] -> Bool
isPalindrome x = x == reverse x

toDigits :: Integral x => x -> [x]
toDigits 0 = []
toDigits x = toDigits (div x 10) ++ [mod x 10]

divisors :: Integer -> [Integer]
divisors x = [xs | xs <- [1..(div x 2)], mod x xs == 0] ++ [x]

numOfDivisors :: Integer -> Integer
numOfDivisors x = genericLength [xs | xs <- [1..floor . sqrt $ (fromIntegral x :: Float)], mod x xs == 0] * 2 + 1

factorial :: Integer -> Integer
factorial 1 = 1
factorial x = x * factorial (x - 1)

centralBinomialCoefficient :: Integer -> Integer
centralBinomialCoefficient x = div (factorial (2 * x)) ((factorial x) ^ 2)
