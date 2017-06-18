import timeit
import math

def suffixes(s):
    return [s[i:len(s)] for i in range(1, len(s))]

def unicode_string():
    return "ང་ན་ཡིན།"

def medium_string():
    return "a" * 20

def long_string():
    return "a" * 100

def extra_long_string():
    return "a" * 1000

if __name__ == '__main__':

    print(suffixes(unicode_string()))

    seconds_small = timeit.timeit("suffixes(u\"tails\")", setup="from __main__ import suffixes\ngc.enable()", number=100000)
    print(str.format("{0:.4g}", seconds_small * 10), " μs")

    seconds_medium = timeit.timeit("suffixes(medium_string())", setup="from __main__ import suffixes, medium_string\ngc.enable()", number=100000)
    print(str.format("{0:.4g}", seconds_medium * 10), " μs")

    seconds_long = timeit.timeit("suffixes(long_string())", setup="from __main__ import suffixes, long_string\ngc.enable()", number=100000)
    print(str.format("{0:.4g}", seconds_long * 10), " μs")

    seconds_extra_long = timeit.timeit("suffixes(extra_long_string())", setup="from __main__ import suffixes, extra_long_string\ngc.enable()", number=100000)
    print(str.format("{0:.4g}", seconds_extra_long * 10), " μs")
