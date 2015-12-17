{-
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
-}

import Util (primeSieve)

main :: IO ()
main = print . sum . primeSieve $ 2000000
