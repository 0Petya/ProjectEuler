{-
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
-}

digs :: Integral x => x -> [x]
digs 0 = []
digs x = digs (div x 10) ++ [mod x 10]

isPalindrome :: Integer -> Bool
isPalindrome xs = dxs == reverse dxs
  where dxs = digs xs

threeDigitProductPermutations :: [Integer]
threeDigitProductPermutations = [x * y| x <- threeDigits, y <- threeDigits]
  where threeDigits = [100..999]

main :: IO ()
main = print . maximum . filter isPalindrome $ threeDigitProductPermutations
