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

    let string_in = "ང་ན་ཡིན།";
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
    b.iter(|| suffix_vec(s.as_str()));
}

#[bench]
fn bench_suffix_cow(b: &mut Bencher) {
    let s = "tails".to_string();
    b.iter(|| suffix_vec_cow(s.as_str()));
}

#[bench]
fn bench_suffix_ref_medium(b: &mut Bencher) {
    let medium_string: String = iter::repeat('a').take(20).collect();
    b.iter(|| suffix_vec_ref(medium_string.as_str()));
}

#[bench]
fn bench_suffix_cow_medium(b: &mut Bencher) {
    let medium_string: String = iter::repeat('a').take(20).collect();
    b.iter(|| suffix_vec_cow(medium_string.as_str()));
}

#[bench]
fn bench_suffix_ref_short(b: &mut Bencher) {
    let s = "tails".to_string();
    b.iter(|| suffix_vec_ref(s.as_str()));
}
/*
#[bench]
fn bench_suffix_generic(b: &mut Bencher) {
    let s = "tails".to_string();
    let s_vec: Vec<char> = s.chars().collect();
    b.iter(|| suffix_iter(&s_vec));
}*/

#[bench]
fn bench_suffix_medium(b: &mut Bencher) {
    let medium_string: String = iter::repeat('a').take(20).collect();
    b.iter(|| suffix_vec(medium_string.as_str()));
}

/*
#[bench]
fn bench_medium_generic(b: &mut Bencher) {
    let medium_string: String = iter::repeat('a').take(20).collect();
    let medium_vec: Vec<char> = medium_string.chars().collect();
    b.iter(|| suffix_iter(&medium_vec));
}*/

#[bench]
fn bench_suffix_medium_unicode(b: &mut Bencher) {
    let unicode_string = "བོད་སྐད་ལ་པདི་ག་ར་རེད།";
    b.iter(|| suffix_vec(unicode_string));
}

#[bench]
fn bench_suffix_long(b: &mut Bencher) {
    let long_string: String = iter::repeat('a').take(100).collect();
    b.iter(|| suffix_vec(long_string.as_str()));
}


#[bench]
fn bench_suffix_long_generic(b: &mut Bencher) {
    let long_string: String = iter::repeat('a').take(100).collect();
    let long_vec: Vec<char> = long_string.chars().collect();
    b.iter(|| suffix_iter(&long_vec));
}

#[bench]
fn bench_suffix_extra_long(b: &mut Bencher) {
    let extra_long_string: String = iter::repeat('a').take(1000).collect();
    b.iter(|| suffix_vec(extra_long_string.as_str()));
}

/*
#[bench]
fn bench_suffix_extra_long_generic(b: &mut Bencher) {
    let extra_long_string: String = iter::repeat('a').take(1000).collect();
    let extra_long_vec: Vec<char> = extra_long_string.chars().collect();
    b.iter(|| suffix_iter(&extra_long_vec));
}*/

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
