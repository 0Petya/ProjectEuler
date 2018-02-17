import math

def isPrime(n):
	if n < 2: return False
	return not [i for i in range(2, math.floor(math.sqrt(n) + 1)) if n % i == 0]
