//
//  EarthMoonBarycenter.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

final class EarthMoonBarycenter: PlanetEarthOrbit {
    init(date: NSDate) {
        super.init(planet:.EMBary, date: date)
    }
}