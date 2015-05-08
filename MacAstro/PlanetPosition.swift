//
//  PlanetPosition.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

private var OBLIQUITY = toRadians(23.43928)

public class PlanetPosition {
    let planet: Planet
    let elements: DateOrbitalElements
    let date: NSDate
    
    var helioOrbCoords: RectangularCoords {
        return elements.helioOrbCoords()
    }
    
    var helioEclCoords: RectangularCoords {
        return elements.helioEclCoords()
    }
    
    var geoEclCoords: RectangularCoords {
        fatalError("Do not directly instantiate PlanetPosition class")
    }
    
    var geoEquCoords: RectangularCoords {
        let gec = geoEclCoords
        return RectangularCoords(
            x: gec.x,
            y: gec.y * cos(OBLIQUITY) - gec.z * sin(OBLIQUITY),
            z: gec.y * sin(OBLIQUITY) + gec.z * cos(OBLIQUITY)
        )
    }
    
    public var rightAscension: Double {
        return geoEquCoords.toSpherical().rightAscension
    }
    
    public var declination: Double {
        return geoEquCoords.toSpherical().declination
    }
    
    public var distance: Double {
        return geoEquCoords.toSpherical().distance
    }
    
    public class func getPosition(planet: Planet) -> PlanetPosition {
        return PlanetPosition.getPosition(planet, date: NSDate())
    }
    
    public class func getPosition(planet: Planet, date: NSDate) -> PlanetPosition {
        switch planet {
        case .Mercury:
            return Mercury(date: date)
            
        case .Venus:
            return Venus(date: date)
            
        case .Earth:
            return Earth(date: date)
            
        case .Sun:
            return Sun(date: date)
            
        case .Mars:
            return Mars(date: date)
            
        case .Jupiter:
            return Jupiter(date: date)
            
        case .Saturn:
            return Saturn(date: date)
            
        case .Uranus:
            return Uranus(date: date)
            
        case .Neptune:
            return Neptune(date: date)
            
        case .Pluto:
            return Pluto(date: date)
            
        case .Moon:
            return Moon(date: date)
            
        case .EMBary:
            return EarthMoonBarycenter(date: date)
        }
    }
    
    init(planet: Planet, date: NSDate) {
        self.planet = planet
        if let dateCopy = date.copy() as? NSDate {
            self.date = dateCopy
        }
        else {
            fatalError("couldn't copy valid date")
        }
        self.elements = DateOrbitalElements.newElementsForPlanet(planet, date: self.date)
    }
}