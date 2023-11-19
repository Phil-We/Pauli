//
//  File.swift
//  
//
//  Created by Phil Weckenmann on 19.11.23.
//

import Foundation

struct Limit<R>{
    
    enum ApproachingSide{ case left, right, bothSides }
    
    enum LimitValue{
        case infinityN
        case infinityP
        case discrete(R)
    }
    
    var against: LimitValue
    
    var approachingFrom: ApproachingSide = .bothSides
    
    var equals: LimitValue?
}
