# morphism-zoo
[![Build Status](https://travis-ci.org/vmchale/morphism-zoo.svg?branch=master)](https://travis-ci.org/vmchale/morphism-zoo)

## Benchmarks

This repository is for examples of recursion schemes, and benchmarks
to compare them to other methods you might consider. You can find the results in the
`results` directory.

### Running the Benchmarks

Simply clone this repo and install [stack](http://haskellstack.org). Then:

```bash
 $ stack bench
```

or, if you'd like a particular version of ghc:

To benchmark only one target:

```bash
 $ stack bench morphism-zoo:suffix-bench-long
```

### Conclusions

Recursion schemes are faster sometimes, and pattern matching is faster other
times. Hylomorphisms vs. paramorphisms will make a difference too. Benchmark it
if you're curious!

## Suffix Benchmarks

To run the suffix benchmarks for Haskell, install [llvm
3.9](http://releases.llvm.org/download.html). Then:

```
stack bench morphism-zoo:suffix-bench
```

To benchmark the Rust:

```
cd rust
cargo bench
```

To benchmark the Python:

```
python python/python-suffix.py
```

To benchmark the Julia:

```
julia julia/init.jl
julia suffixes.jl
```
