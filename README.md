# morphism-zoo
[![Build Status](https://travis-ci.org/vmchale/morphism-zoo.svg?branch=master)](https://travis-ci.org/vmchale/morphism-zoo)

## Benchmarks

This repository is for examples of recursion schemes, and benchmarks
to compare them to other methods you might consider. You can find them under
`bench8.0.txt` and `bench8.2.txt`.

### Running the Benchmarks

Simply clone this repo and install [stack](http://haskellstack.org). Then:

```bash
 $ stack bench
```

or, if you'd like a particular version of ghc:

```bash
 $ stack bench --stack-yaml stack-8.2.yaml
```

### Conclusions

As it happens, there's not a *huge* difference between the implementations, but
some stand out as bad.
