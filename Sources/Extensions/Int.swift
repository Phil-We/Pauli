//
//  File.swift
//  
//
//  Created by Phil Weckenmann on 19.11.23.
//

import Foundation

public extension Int {
    var isEven: Bool { self % 2 == 0}
    var isOdd: Bool {!isEven}
   
    
    var maxDivisor: Int {Int(sqrt(Float(self))) + 3 }
    
    var isPrime: Bool {
        let primes = PrimeNumbers(up: maxDivisor)
        return !isDividableByAny(in: primes.generatedPrimes)
    }
     /*var isPrime: Bool {
         if isEven { return false }
         
         let max = maxDivisor
         var collected = [2]
         var counterIsPrime = false
         var counter = 3
         
         while counter <= max {
             if self % counter == 0 { return false }
             collected.append(counter)
             //print(collected)
             counterIsPrime = false
             while !counterIsPrime && counter <= max {
                 counter += 2
                 counterIsPrime = true
                 for i in collected {
                     if counter % i == 0 { counterIsPrime = false; continue }
                 }
             }
             //print(counter)
         }
         return true
     }*/
     var primeFactors: [Int] {
         let max = maxDivisor
         var this = self
         var result = Array<Int>()
         var counter = 2
         while counter <= max {
             if this % counter == 0 {
                 this /= counter
                 result.append(counter)
             } else {
                 counter += 1
             }
         }
         result.append(this)
         return result
     }
     
     var isPalindrome: Bool {
         String(self) == String(String(self).reversed())
     }
     
     func greatestMultiple(up to: Int) -> Int {
         return Int(to / self) * self
     }
     
     func isDividableByAny(in orderedArray: [Int]) -> Bool {
         let max = maxDivisor
         
         for i in orderedArray {
             if i >= max { break }
             if self % i == 0 { return true }
         }
         return false
     }
}
