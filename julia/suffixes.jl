using BenchmarkTools

function suffixes(s)
  return [s[chr2ind(s,i):chr2ind(s,length(s))] for i in (2:(length(s)))]
end

medium_string = "a"^20
long_string = "a"^100
extra_long_string = "a"^1000

println("small: ", @benchmark suffixes("tails"))
println("medium: ", @benchmark suffixes(medium_string))
println("long: ", @benchmark suffixes(long_string))
println("extra_long: ", @benchmark suffixes(extra_long_string))
