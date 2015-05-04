//
//  AstroFunctions.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Darwin

public func kepler(mAnom: Double, ecc: Double) -> Double {
    let desiredAccuracy = 1e-6
    
    precondition(ecc >= 0 && ecc <= 1, "Eccentricity must be between 0.0 and 1.0, inclusive")
    
    var eAnom = mAnom
    var diff : Double
    
    do {
        diff = eAnom - ecc * sin(eAnom) - mAnom
        eAnom -= diff / (1 - ecc * cos(eAnom))
    } while ( abs(diff) > desiredAccuracy )
    
    return eAnom
}