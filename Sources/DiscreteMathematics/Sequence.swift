//
//  File.swift
//  
//
//  Created by Phil Weckenmann on 18.11.23.
//

import Foundation

public protocol InfiniteSequence {
    
    associatedtype Element
    
    func a(_ n: Int) -> Element
    
}

public extension InfiniteSequence {
    subscript (n: Int) ->  Element {
        return a(n)
    }
}


public protocol FiniteSequence: InfiniteSequence {
    
}

public struct MSequence<T>: InfiniteSequence {
    
    public var b: (Int) -> T
    
    public func a(_ n: Int) -> T {
        return b(n)
    }
    
    public init(_ a: @escaping (Int) -> T) {
        self.b = a
    }
}


