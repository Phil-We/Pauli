//
//  File.swift
//  
//
//  Created by Phil Weckenmann on 19.11.23.
//

import Foundation

public func gcd(_ a: Int, b: Int) -> Int {
    if (a == 0) { return b }
    else if (b == 0) { return a }
    else {
        return gcd(b, b: a % b)
    }
}

public func gcd(_ arr: [Int]) -> Int {
    arr.reduce(1, gcd)
}

public func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b: b)
}
public func lcm(_ arr: [Int]) -> Int {
    arr.reduce(1, lcm)
}
