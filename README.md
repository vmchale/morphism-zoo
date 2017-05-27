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

```bash
 $ stack bench --stack-yaml stack-8.2.yaml
```

To benchmark only one target:

```bash
 $ stack bench morphism-zoo:fib-bench
```

### Conclusions

As it happens, there's not a *huge* difference between the implementations, but
some do stand out as bad. GHC 8.0.2 has trouble with some of the optimizations,
but if you upgrade to GHC 8.2.0 you shouldn't need to reach for recursion
schemes in order to write performant code.

*However* (and some may disagree with me on this), it is true that recursion
schemes give you a bulletproof way to make fast code. Pattern matching also
works, but it a) can go wrong and b) kind of defeats the purpose of functional
programming (higher-order functions).
