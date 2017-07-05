#![feature(test)]

extern crate num_bigint;
extern crate num_traits;

pub use functions::*;

pub mod test;

/// Separate module for functions, so that they can be called in the test module.
pub mod functions {

    use num_bigint::BigUint;
    use num_traits::{Zero, One};
    use std::mem::replace;
    use std::borrow::Cow;

    /// this function returns a vector of all possible suffixes.
    ///
    /// # Examples
    ///
    /// ```
    /// use rust_suffix::functions::*;
    ///
    /// let v: Vec<String> = vec!["ails".to_string()
    ///     , "ils".to_string()
    ///     , "ls".to_string()
    ///     , "s".to_string()];
    /// let s = "tails";
    /// assert_eq!(v, suffix_vec(s))
    /// ```
    pub fn suffix_vec(s: &str) -> Vec<String> {
        let len = s.len();
        let mut vec = Vec::with_capacity(len);
        let mut i = 1;
        'outer: while i < len {
            while !s.is_char_boundary(i) {
                i += 1;
                if i >= len {
                    break 'outer;
                }
            }
            i += 1;
            vec.push((&s[i - 1..]).to_string());
        }
        vec
    }

    pub fn suffix_vec_cow(s: &str) -> Vec<Cow<str>> {
        let len = s.len();
        let mut vec = Vec::with_capacity(len);
        let mut i = 1;
        'outer: while i < len {
            while !s.is_char_boundary(i) {
                i += 1;
                if i >= len {
                    break 'outer;
                }
            }
            i += 1;
            vec.push(Cow::from(&s[i - 1..]));
        }
        vec
    }

    pub fn suffix_vec_ref(s: &str) -> Vec<&str> {
        let len = s.len();
        let mut vec = Vec::with_capacity(len);
        let mut i = 1;
        'outer: while i < len {
            while !s.is_char_boundary(i) {
                i += 1;
                if i >= len {
                    break 'outer;
                }
            }
            i += 1;
            vec.push(&s[i - 1..]);
        }
        vec
    }

    /// generic version of the above function
    ///
    /// # Examples
    ///
    /// ```
    /// use rust_suffix::functions::*;
    ///
    /// let v: Vec<char> = vec!['s','t','r'];
    /// let result = vec![vec!['t','r'], vec!['r']];
    ///
    /// assert_eq!(suffix_iter(&v), result)
    /// ```
    pub fn suffix_iter<T: Clone>(v: &Vec<T>) -> Vec<Vec<T>> {
        let mut vec = Vec::new();
        let l = v.len();
        for i in 1..l {
            vec.push(v.get(i..).unwrap().to_owned());
        }
        vec
    }

    struct Fib {
        curr: i32,
        next: i32,
    }

    impl Iterator for Fib {
        type Item = i32;
        fn next(&mut self) -> Option<i32> {
            let new_next = self.curr + self.next;
            let new_curr = replace(&mut self.next, new_next);
            Some(replace(&mut self.curr, new_curr))
        }
    }

    impl Fib {
        fn new() -> Fib {
            Fib { curr: 1, next: 1 }
        }
    }

    /// this function computes the fibonacci sequence iteratively
    ///
    /// # Examples
    ///
    /// ```
    /// use rust_suffix::functions::*;
    ///
    /// assert_eq!(89, fib_iterative(10))
    /// ```
    pub fn fib_iterative(n: usize) -> i32 {
        let fib = Fib::new();
        let v: Vec<i32> = fib.take(n + 1).collect();
        v[n]
    }

    /// this function computes the fibonacci sequence iteratively, to arbitrary precision
    ///
    /// # Examples
    ///
    /// ```
    /// use rust_suffix::functions::*;
    ///
    /// assert_eq!(89, fib_iterative(10))
    /// ```
    pub fn fib_big(n: usize) -> BigUint {
        let mut f0: BigUint = Zero::zero();
        let mut f1: BigUint = One::one();
        for _ in 0..n {
            let f2 = f0 + &f1;
            // This is a low cost way of swapping f0 with f1 and f1 with f2.
            f0 = replace(&mut f1, f2);
        }
        f0
    }
}
