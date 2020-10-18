use crate::algorithms::single_pattern::kmp::{kmp_all, kmp_classic_all};
use crate::algorithms::single_pattern::naive::naive_all;

/// Returns the algorithm function matching the given name.
///
/// The function takes a `&str` containing an algorithm name given by
/// the user as a CLI parameter.
///
/// It returns the algorithm function matching the name or `None`
/// if there is no algorithm with the given name.
pub fn match_algorithm(algorithm: &str) -> Option<fn(&[u8], &[u8]) -> Vec<usize>> {
    match algorithm.to_lowercase().as_str() {
        "naive" => Some(naive_all as fn(&[u8], &[u8]) -> Vec<usize>),
        "kmp" => Some(kmp_all as fn(&[u8], &[u8]) -> Vec<usize>),
        "kmp-classic" => Some(kmp_classic_all as fn(&[u8], &[u8]) -> Vec<usize>),
        _ => None,
    }
}

/// Returns the pretty formatted name of an algorithm matching the given name.
///
/// The function takes a `&str` containing an algorithm name given by
/// the user as a CLI parameter.
///
/// It returns the pretty formatted name of the algorithm (containing spaces
/// etc.) or `"Unknown Algorithm"` if there is no
/// algorithm with the given name.
pub fn algorithm_name(algorithm: &str) -> &str {
    match algorithm.to_lowercase().as_str() {
        "naive" => "Naive",
        "kmp" => "KMP",
        "kmp-classic" => "Classic KMP",
        _ => "Unknown Algorithm",
    }
}
