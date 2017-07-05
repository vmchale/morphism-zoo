import timeit

def fib(n):
 a,b = 1,1
 for i in range(n-1):
  a,b = b,a+b
 return a

def first():
  return [ fib(n) for n in range(20)]

if __name__ == '__main__':
    sec = timeit.timeit("first()", setup="from __main__ import first", number=100000)
    print("first 20: ", sec * 10, " us")
