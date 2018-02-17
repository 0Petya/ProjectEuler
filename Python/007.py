'''
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
'''

from Util import isPrime
from itertools import *

print(list(islice((i for i in count() if isPrime(i)), 10001))[-1])
