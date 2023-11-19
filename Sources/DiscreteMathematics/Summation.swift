// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Addable {}
extension Int64: Addable{}
extension String: Addable {}


/// ∑ Summation
/// - Parameters:
///   - lowerBound: the start index which is incremented by 1 until reaching the upper bound
///   - upperBound: the end index (inclusive)
///   - void: the computed value
/// - Returns: the sum
public func summation<T: Addable>(_ lowerBound: Int = 1, _ upperBound: Int, _ x: MSequence<T>) -> T {//(_ i: Int) -> T) -> T {
    var i = lowerBound
    var partialResult: T = x[i]
    while i < upperBound {
        i += 1
        partialResult = partialResult + x[i]
    }
    return partialResult
}

public func summation<T:Addable>(list: [T]) -> T {
    var list = list
    let first = list.removeFirst()
    return list.reduce(first, +)
}

/// ∑ Summation over Interval
/// - Parameters:
///   - bound1: first bound (not necessarily the lower) of the interval
///   - bound2: second bound
/// - Returns: The sum of all Integers in the given Interval
public func summationOverInterval(_ bound1: Int=1, _ bound2: Int) -> Int {
    let interval = Interval.closed(bound1, bound2)
    let a = interval.lowerBound-interval.upperBound-1
    let b = interval.lowerBound+interval.upperBound
    return -a*b/2
}
