# morphism-zoo

## Benchmarks

This repository is for examples of recursion schemes, and benchmarks
to compare them to other methods you might consider.

### Results

| GHC | Benchmark | Method | Time |
| --- | --------- | ------ | ---- |
| 8.0.2 | suffix | recursion schemes | 34.35 ns |
| 8.0.2 | suffix | pattern matching v2 | 116.4 ns |
| 8.0.2 | suffix | pattern matching v1 | 100.8 ns |
| 8.0.2 | suffix | list comprehension | 38.84 ns |

### Conclusions

Using recursion schemes correctly will get you the fastest code. Failing that,
functoriality will also get you nice fusion.
