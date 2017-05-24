# morphism-zoo

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

Using recursion schemes correctly will get you the fastest code. Of course, this
depends on the nature of the recursion: a fold is a fold is a catamorphism. 
