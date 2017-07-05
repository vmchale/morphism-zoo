using BenchmarkTools

function factorial(n)
  total = 1
  for i = 1:n
    total = total * i
  end
  total
end

println(@benchmark factorial(20))
println(@benchmark factorial(BigInt(100)))
