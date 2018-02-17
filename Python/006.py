'''
The sum of the squares of the first ten natural numbers is,

12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
'''

def sumOfSquares(n):
	return sum(list(map(lambda x: x ** 2, n)))

def squareOfSums(n):
	return sum(n) ** 2

firstHundredNatNums = range(1, 101)
print(squareOfSums(firstHundredNatNums) - sumOfSquares(firstHundredNatNums))
