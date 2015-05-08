//
//  PlanetInfo.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

struct PlanetInfo {
    let name: String
    let rightAscension: String
    let declination: String
    let distance: String
    let zodiac: String
    
    init(planet: Planet) {
        let pos = PlanetPosition.getPosition(planet)
        
        name = planet.description
        rightAscension = HMS(degrees: pos.rightAscension).description
        declination = DMS(degrees: pos.declination).description
        distance = String(format: "%.7f", pos.distance)
        zodiac = ZodiacCoords(degrees: pos.rightAscension).description
    }
}
