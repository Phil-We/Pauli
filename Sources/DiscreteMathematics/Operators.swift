//
//  File.swift
//  
//
//  Created by Phil Weckenmann on 19.11.23.
//

import Foundation

infix operator **
public func **(lhs: Int, rhs: Int) -> Int {
    Array(repeating: lhs, count: rhs).reduce(1, *)
}
