//
//  Mars.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

public final class Mars: PlanetSolarOrbit {
    init(date: NSDate) {
        super.init(planet:.Mars, date: date)
    }
}