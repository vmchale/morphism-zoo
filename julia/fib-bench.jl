using Lazy
using BenchmarkTools

function fib(n)
  a,b = 0,1
  for i in 1:(n-1)
    a,b = b,a+b
  end
  return a
end

fibs = @lazy 0:1:(fibs + drop(1, fibs));

println(@benchmark fib(20))
println(@benchmark take(20,fibs))
