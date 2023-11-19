import XCTest
@testable import Pauli

final class SumTest: XCTestCase {
    func testExample() throws {
        XCTAssertEqual(summation(1, 3, MSequence({ $0 })), 6)
        let pr = PrimeNumbers(first: 25)
        print(pr.generatedPrimes)
        //XCTAssertEqual(summationOverInterval(-15, 3) , -1 * summation(-3, 15, M))
    }
    
    func testProduct() throws {
        XCTAssertEqual(product(1, 3, {3 + $0 * 2}), 24)
    }
    
    func testSumOfPrimesBelow2Million() {
        measure {
            let primes = PrimeNumbers(up: 2000000)
            let sum = summation(list: primes.generatedPrimes)
            print(sum)
        }
    }
    
}
