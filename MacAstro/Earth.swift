//
//  Earth.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

public final class Earth: PlanetSolarOrbit {
    init(date: NSDate) {
        super.init(planet:.Earth, date: date)
    }
    
    override var geoEclCoords: RectangularCoords {
        return RectangularCoords(x: 0.0, y: 0.0, z: 0.0)
    }
    
    override var geoEquCoords: RectangularCoords {
        return RectangularCoords(x: 0.0, y: 0.0, z: 0.0)
    }
}
