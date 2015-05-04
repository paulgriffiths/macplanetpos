//
//  OrbitalElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Darwin

public class OrbitalElements {
    public let sma : Double
    public let ecc : Double
    public let inc : Double
    public let ml : Double
    public let lp : Double
    public let lan : Double
    
    public var man : Double {
        return ml - lp
    }
    
    public var arp : Double {
        return lp - lan
    }
    
    public init(sma: Double, ecc: Double, inc: Double, ml: Double, lp: Double, lan: Double) {
        self.sma = sma
        self.ecc = ecc
        self.inc = inc
        self.ml = ml
        self.lp = lp
        self.lan = lan
    }
}

extension OrbitalElements {
    public func helioOrbCoords() -> RectangularCoords {
        let eAnom = kepler(man, ecc)
        let x = sma * (cos(eAnom) - ecc)
        let y = sma * sqrt(1 - pow(ecc, 2)) * sin(eAnom)
        return RectangularCoords(x: x, y: y, z: hypot(x, y))
    }
    
    public func helioEclCoords() -> RectangularCoords {
        let hoc = helioOrbCoords()
        let x = (cos(arp) * cos(lan) - sin(arp) * sin(lan) * cos(inc)) * hoc.x +
                (-sin(arp) * cos(lan) - cos(arp) * sin(lan) * cos(inc)) * hoc.y
        let y = (cos(arp) * sin(lan) + sin(arp) * cos(lan) * cos(inc)) * hoc.x +
                (-sin(arp) * sin(lan) + cos(arp) * cos(lan) * cos(inc) ) * hoc.y
        let z = sin(arp) * sin(inc) * hoc.x + cos(arp) * sin(inc) * hoc.y
        return RectangularCoords(x: x, y: y, z: z)
    }
}