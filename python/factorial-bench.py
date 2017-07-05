import timeit
import math

def big():
    return math.factorial(100)

def small():
    return math.factorial(20)

if __name__ == '__main__':
    seconds_small = timeit.timeit("small()", setup="from __main__ import small", number=100000)
    print(seconds_small * 10, " us")
    seconds_big = timeit.timeit("big()", setup="from __main__ import big", number=100000)
    print(seconds_big * 10, " us")
