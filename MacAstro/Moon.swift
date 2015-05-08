//
//  Moon.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

final public class Moon: PlanetEarthOrbit {
    init(date: NSDate) {
        super.init(planet:.Moon, date: date)
    }
    
    override var geoEclCoords: RectangularCoords {
        let hec = helioEclCoords
        let hoc = helioOrbCoords
        let mOes = elements
        let sOes = EarthMoonBarycenter(date: date).elements
        
        let mel = mOes.ml - sOes.ml
        let arl = mOes.ml - sOes.lan
        
        //  Adjust for longitude perturbations
        
        var dlon = -1.274 * sin(mOes.man - 2 * mel)
        dlon += 0.658 * sin(2 * mel)
        dlon -= 0.186 * sin(sOes.man)
        dlon -= 0.059 * sin(2 * mOes.man - 2 * mel)
        dlon -= 0.057 * sin(mOes.man - 2 * mel + sOes.man)
        dlon += 0.053 * sin(mOes.man + 2 * mel)
        dlon += 0.046 * sin(2 * mOes.ml - sOes.man)
        dlon += 0.041 * sin(mOes.man - sOes.man)
        dlon -= 0.035 * sin(mOes.ml)
        dlon -= 0.031 * sin(mOes.man + sOes.man)
        dlon -= 0.015 * sin(2 * arl - 2 * mel)
        dlon += 0.011 * sin(mOes.man - 4 * mel)
        
        let lon = atan2(hec.y, hec.x) + toRadians(dlon)
        
        //  Adjust for latitude perturbations
        
        var dlat = -0.173 * sin(arl - 2 * mel)
        dlat -= 0.055 * sin(mOes.man - arl - 2 * mel)
        dlat -= 0.046 * sin(mOes.man + arl - 2 * mel)
        dlat += 0.033 * sin(arl + 2 * mel)
        dlat += 0.017 * sin(2 * mOes.man + arl)
        
        let lat = atan2(hec.z, hypot(hec.x, hec.y)) + toRadians(dlat)
        
        //  Adjust for rhc perturbations
        
        let rhc = hoc.z - 0.58 * cos(mOes.man - 2 * mel) - 0.46 * cos(2 * mel)
        
        return RectangularCoords(x: rhc * cos(lon) * cos(lat), y: rhc * sin(lon) * cos(lat), z: rhc * sin(lat))
    }
}