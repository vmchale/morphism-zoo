# Cross-language comparisons

| Language | Benchmark | Input size | Time |
| -------- | --------- | ---------- | ---- |
| Haskell | Suffixes | 5 | 69.57 ns |
| Haskell | Suffixes | 20 | 773.7 ns |
| Haskell | Suffixes | 100 | 17.26 μs |
| Haskell | Suffixes | 1000 | 1.635 ms |
| Rust | Suffixes | 5 | 229 ns |
| Rust | Suffixes | 20 | 2.497 μs |
| Rust | Suffixes | 100 | 39.22 μs |
| Rust | Suffixes | 1000 | 2.798 ms |

# Commands

To bench the Haskell code:

```
stack bench morphism-zoo:suffix-bench
```

To bench the Rust code (must be on nightly):

```
cargo bench
```

<!-- figure out if these are correct before including them
| Python | Suffixes | 5 | 1.455 μs |
| Python | Suffixes | 20 | 3.936 μs |
| Python | Suffixes | 100 | 16.01 μs |
| Python | Suffixes | 1000 | 281.7 μs |
| Julia | Suffixes | 5 | 354.3 ns |
| Julia | Suffixes | 20 | 9.011 μs |
| Julia | Suffixes | 100 | 38.44 μs |
| Julia | Suffixes | 1000 | 2.427 ms |
-->
