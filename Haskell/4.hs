{-
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
-}

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = if xs == reverse xs then True else False

main = print "fail"
