//
//  PlanetSolarOrbit.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

public class PlanetSolarOrbit: PlanetPosition {
    override var geoEclCoords: RectangularCoords {
        let eec = PlanetPosition.getPosition(.Earth, date: date).helioEclCoords
        return helioEclCoords - eec
    }
}