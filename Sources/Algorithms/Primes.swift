//
//  File.swift
//  
//
//  Created by Phil Weckenmann on 19.11.23.
//

import Foundation

public struct PrimeNumbers: InfiniteSequence {
    
    public typealias Element = Int
    
    private var bucket: [Int] = [2,3]
    
    public var generatedPrimes: [Int] {bucket}
    
    public func a(_ n: Int) -> Int {
        assert(n < bucket.count, "The index exceeds the amount of generated Primes")
        return bucket[n]
    }
    /*private mutating func nthPrime(_ n: Int) -> Int {
        if bucket.count < n {
            generateFirstNPrimes(n)
        }
        return bucket[n]
    }*/
    
    public init(first n: Int){
        var generatedPrimes = bucket.count
        var i = 5
        while generatedPrimes < n {
            if !i.isDividableByAny(in: bucket){
                bucket.append(i)
                generatedPrimes += 1
            }
            i += 2
        }
    }
    
    public init(up to: Int) {
        var i = 5
        while i <= to {
            if !i.isDividableByAny(in: bucket){
                bucket.append(i)
            }
            i += 2
        }
    }
}
