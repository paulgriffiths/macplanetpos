//
//  utilities.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation
import Darwin

public func toDegrees(radians: Double) -> Double {
    return radians * 180 / M_PI
}

public func toRadians(degrees: Double) -> Double {
    return degrees * M_PI / 180
}

func sindeg(degrees: Double) -> Double {
    return sin(toRadians(degrees))
}

func cosdeg(degrees: Double) -> Double {
    return cos(toRadians(degrees))
}

func tandeg(degrees: Double) -> Double {
    return tan(toRadians(degrees))
}

func normalizeDegrees(degrees: Double) -> Double {
    return degrees - 360.0 * floor(degrees / 360.0)
}
