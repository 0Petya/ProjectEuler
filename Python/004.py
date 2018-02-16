'''
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
'''

def isPalindrome(x):
	return str(x) == str(x)[::-1]

def threeDigitProductPermutation():
	threeDigitRange = range(100, 999)
	return [i * j for i in threeDigitRange for j in threeDigitRange]

print(max(list(filter(isPalindrome, threeDigitProductPermutation()))))
