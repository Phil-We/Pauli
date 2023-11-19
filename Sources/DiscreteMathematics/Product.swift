//
//  File.swift
//  
//
//  Created by Phil Weckenmann on 18.11.23.
//

import Foundation

public protocol Multiplyable {
    static func *(lhs: Self, rhs: Self) -> Self
}

extension Int: Multiplyable {}


/// Π Product of a Sequence
/// - Parameters:
///   - lowerBound: the start index which is incremented by 1 until reaching the upper bound
///   - upperBound: the end index (inclusive)
///   - x_i: the i-_th_ value of the sequence
/// - Returns: the product of all elements in the sequence
public func product<T: Multiplyable>(_ lowerBound: Int = 1, _ upperBound: Int, _ x: (_ i: Int) -> T) -> T {
    var i = lowerBound
    var partialResult: T = x(i)
    while i < upperBound {
        i += 1
        partialResult = partialResult * x(i)
    }
    return partialResult
}
