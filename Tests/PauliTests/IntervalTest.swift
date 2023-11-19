//
//  File.swift
//  
//
//  Created by Phil Weckenmann on 18.11.23.
//

import XCTest
@testable import Pauli

final class IntervalTest: XCTestCase {
    func testExample() throws {
        let closedInterval = Interval.closed(-1, 1)
        let openInterval = Interval.open(0, 4)
        let halfOpenInterval = Interval.halfOpen(1, 3, openBound: .upper)
        
        XCTAssertEqual(closedInterval.contains(1), true)
        XCTAssertEqual(closedInterval.contains(2), false)
        XCTAssertEqual(openInterval.contains(4), false)
        XCTAssertEqual(halfOpenInterval.contains(3), false)
    }
}
