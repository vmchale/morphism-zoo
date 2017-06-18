//! Module containing benchmarks

#![allow(unused_imports)]
extern crate test;

use std::iter;
use std::mem::replace;
use test::test::Bencher;
use functions::*;

#[test]
fn test_unicode() {

    let desired: Vec<&str> = vec![
        "\u{0F0B}\u{0F53}\u{0F0B}\u{0F61}\u{0F72}\u{0F53}\u{0F0D}",
        "\u{0F53}\u{0F0B}\u{0F61}\u{0F72}\u{0F53}\u{0F0D}",
        "\u{0F0B}\u{0F61}\u{0F72}\u{0F53}\u{0F0D}",
        "\u{0F61}\u{0F72}\u{0F53}\u{0F0D}",
        "\u{0F72}\u{0F53}\u{0F0D}",
        "\u{0F53}\u{0F0D}",
        "\u{0F0D}",
    ];

    let string_in = "ང་ན་ཡིན།".to_string();
    let string_in_fast = "ང་ན་ཡིན།";
    assert_eq!(suffix_vec_fast(string_in_fast), desired);
    assert_eq!(suffix_vec(string_in), desired);
}

#[test]
fn test_generator() {
    let s: String = iter::repeat('a').take(2).collect();
    assert_eq!(s, "aa");
}

#[bench]
fn bench_suffix(b: &mut Bencher) {
    let s = "tails".to_string();
    b.iter(|| suffix_vec(s.clone()));
}

#[bench]
fn bench_suffix_fast(b: &mut Bencher) {
    let s = "tails";
    b.iter(|| suffix_vec_fast(s));
}

#[bench]
fn bench_suffix_medium_fast(b: &mut Bencher) {
    let medium_string: String = iter::repeat('a').take(20).collect();
    b.iter(|| suffix_vec_fast(medium_string.as_str()));
}

#[bench]
fn bench_suffix_medium(b: &mut Bencher) {
    let medium_string: String = iter::repeat('a').take(20).collect();
    b.iter(|| suffix_vec(medium_string.clone()));
}

#[bench]
fn bench_suffix_long(b: &mut Bencher) {
    let long_string: String = iter::repeat('a').take(100).collect();
    b.iter(|| suffix_vec(long_string.clone()));
}

#[bench]
fn bench_suffix_long_fast(b: &mut Bencher) {
    let long_string: String = iter::repeat('a').take(100).collect();
    b.iter(|| suffix_vec_fast(long_string.as_str()));
}

#[bench]
fn bench_suffix_extra_long_fast(b: &mut Bencher) {
    let extra_long_string: String = iter::repeat('a').take(1000).collect();
    b.iter(|| suffix_vec_fast(extra_long_string.as_str()));
}

#[bench]
fn bench_suffix_extra_long(b: &mut Bencher) {
    let extra_long_string: String = iter::repeat('a').take(1000).collect();
    b.iter(|| suffix_vec(extra_long_string.clone()));
}

// this one doesn't need any special considerations
#[bench]
fn bench_iterative_fib(b: &mut Bencher) {
    b.iter(|| fib_iterative(15))
}

// for comparison to Haskell.
#[bench]
fn bench_big_fib(b: &mut Bencher) {
    b.iter(|| fib_big(15))
}
