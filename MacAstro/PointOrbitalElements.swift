//
//  PointOrbitalElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Darwin

class PointOrbitalElements: OrbitalElements {
    
}

//  Coordinates calculation methods extension

extension PointOrbitalElements {
    func helioOrbCoords() -> RectangularCoords {
        let eAnom = kepler(man, ecc: ecc)
        let x = sma * (cos(eAnom) - ecc)
        let y = sma * sqrt(1 - pow(ecc, 2)) * sin(eAnom)
        return RectangularCoords(x: x, y: y, z: hypot(x, y))
    }
    
    func helioEclCoords() -> RectangularCoords {
        let hoc = helioOrbCoords()
        let x = (cos(arp) * cos(lan) - sin(arp) * sin(lan) * cos(inc)) * hoc.x +
            (-sin(arp) * cos(lan) - cos(arp) * sin(lan) * cos(inc)) * hoc.y
        let y = (cos(arp) * sin(lan) + sin(arp) * cos(lan) * cos(inc)) * hoc.x +
            (-sin(arp) * sin(lan) + cos(arp) * cos(lan) * cos(inc) ) * hoc.y
        let z = sin(arp) * sin(inc) * hoc.x + cos(arp) * sin(inc) * hoc.y
        return RectangularCoords(x: x, y: y, z: z)
    }
}