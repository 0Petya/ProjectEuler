{-
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
-}

import Util (isPalindrome)

threeDigitProductPermutation :: [Integer]
threeDigitProductPermutation = [x * y | x <- z, y <- z]
  where z = [100..999]

main :: IO ()
main = print . maximum . map (\x -> read x :: Integer) . filter isPalindrome . map show $ threeDigitProductPermutation
