{-
  If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

  If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


  NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
-}

import Data.Maybe

type Number = (Integer,String)

oneToNine :: [Number]
oneToNine = go 1
  where go 1 = (1,"one"):go 2
        go 2 = (2,"two"):go 3
        go 3 = (3,"three"):go 4
        go 4 = (4,"four"):go 5
        go 5 = (5,"five"):go 6
        go 6 = (6,"six"):go 7
        go 7 = (7,"seven"):go 8
        go 8 = (8,"eight"):go 9
        go 9 = (9,"nine"):[]

tenToNineteen :: [Number]
tenToNineteen = go 10
  where go 10 = (10,"ten"):go 11
        go 11 = (11,"eleven"):go 12
        go 12 = (12,"twelve"):go 13
        go 13 = (13,"thirteen"):go 14
        go 14 = (14,"fourteen"):go 15
        go 15 = (15,"fifteen"):go 16
        go 16 = (16,"sixteen"):go 17
        go 17 = (17,"seventeen"):go 18
        go 18 = (18,"eighteen"):go 19
        go 19 = (19,"nineteen"):[]

extractors :: [Number]
extractors = go 20
  where go 20 = (20,"twenty"):go 30
        go 30 = (30,"thirty"):go 40
        go 40 = (40,"forty"):go 50
        go 50 = (50,"fifty"):go 60
        go 60 = (60,"sixty"):go 70
        go 70 = (70,"seventy"):go 80
        go 80 = (80,"eighty"):go 90
        go 90 = (90,"ninety"):[]

extractAndAppend :: Number -> [Number]
extractAndAppend n@(x,s) = n:go 1
  where go 10 = []
        go i = (i + x,s ++ (fromMaybe "zero" (lookup i oneToNine))):go (i + 1)

oneToNinetyNine :: [Number]
oneToNinetyNine = oneToNine ++ tenToNineteen ++ (concat . map extractAndAppend $ extractors)

hundredExtract :: [Number]
hundredExtract = map (\(x,y) -> (x * 100,y ++ "hundred")) oneToNine

numbers :: [Number]
numbers = oneToNinetyNine ++ go 100
  where go 1000 = [(1000,"onethousand")]
        go i = [z] ++ map (\(x,y) -> (x + i,snd z ++ "and" ++ y)) oneToNinetyNine ++ go (i + 100)
          where z = (i, fromMaybe "zero" (lookup i hundredExtract))

main :: IO ()
main = print . length . concat . map (\(_,y) -> y) $ numbers
