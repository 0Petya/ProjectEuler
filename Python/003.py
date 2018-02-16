'''
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
'''

import math

def isPrime(n):
	if n < 2: return False
	return not [i for i in range(2, math.ceil(math.sqrt(n))) if n % i == 0]

def primeFactorize(n):
	pFacsUnderSqrt = [i for i in range(2, math.ceil(math.sqrt(n))) if n % i == 0 and isPrime(i)]
	return pFacsUnderSqrt + list(filter(isPrime, map(lambda x: int(n / x), pFacsUnderSqrt[::-1])))

print(primeFactorize(600851475143)[-1])
