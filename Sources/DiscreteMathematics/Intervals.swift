//
//  File.swift
//  
//
//  Created by Phil Weckenmann on 18.11.23.
//

import Foundation

/// A dense Interval containing every value between the two bounds
public struct Interval<T: Comparable>{
    
    public enum Bounds{ case lower, upper }
    
    public var lowerBound: T
    public var upperBound: T
    
    private var lowerBoundClosed: Bool
    private var upperBoundClosed: Bool
    
    public func contains(_ item: T) -> Bool {
        switch boundTypes {
        case .closed:
            return (lowerBound <= item) && (item <= upperBound)
        case .open:
            return (lowerBound < item) && (item < upperBound)
        case .halfOpenLowerClosed:
            return (lowerBound <= item) && (item < upperBound)
        case .halfOpenUpperClosed:
            return (lowerBound < item) && (item <= upperBound)
        }
    }
}

// MARK: Initializers
public extension Interval {
    static func sortBounds<B:Comparable>(_ a: B, _ b: B) -> (lowerBound: B, upperBound: B) {
        return (a <= b) ? (a,b) : (b,a)
    }
    
    static func closed(_ a: T, _ b: T) -> Interval {
        let bounds = sortBounds(a, b)
        return Interval(lowerBound: bounds.lowerBound, upperBound: bounds.upperBound, lowerBoundClosed: true, upperBoundClosed: true)
    }
    
    static func open(_ a: T, _ b: T) -> Interval {
        let bounds = sortBounds(a, b)
        return Interval(lowerBound: bounds.lowerBound, upperBound: bounds.upperBound, lowerBoundClosed: false, upperBoundClosed: false)
    }
    
    static func halfOpen(_ a: T, _ b: T, openBound: Interval.Bounds) -> Interval {
        let bounds = sortBounds(a, b)
        let lowerBoundClosed = (openBound == .upper)
        return Interval(lowerBound: bounds.lowerBound, upperBound: bounds.upperBound, lowerBoundClosed: lowerBoundClosed, upperBoundClosed: !lowerBoundClosed)
    }
}


public extension Interval {
    enum BoundTypes { case closed, open, halfOpenUpperClosed, halfOpenLowerClosed }
    
    var boundTypes: BoundTypes {
        switch (lowerBoundClosed, upperBoundClosed) {
        case (true, true):
            return .closed
        case (false, false):
            return .open
        case (false, true):
            return .halfOpenUpperClosed
        case (true, false):
            return .halfOpenLowerClosed
        }
    }
}
