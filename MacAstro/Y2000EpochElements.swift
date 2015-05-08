//
//  Y2000EpochElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

final class Y2000EpochElements: PointOrbitalElements {
    class func newElementsForPlanet(planet: Planet) -> Y2000EpochElements {
        switch ( planet ) {
        case .Mercury, .Venus, .Earth, .Sun, .Mars, .Jupiter, .Saturn, .Uranus, .Neptune, .Pluto:
            fatalError("Y2000 epoch elements not available for \(planet.description)")
            
        case .Moon:
            return Y2000EpochElements(
                sma: 60.2666,
                ecc: 0.0549,
                inc: toRadians(5.1454),
                ml: toRadians(198.5516),
                lp: toRadians(83.1862),
                lan: toRadians(125.1228)
            )
            
        case .EMBary:
            return Y2000EpochElements(
                sma: 1,
                ecc: 0.016709,
                inc: toRadians(0.0),
                ml: toRadians(278.9874),
                lp: toRadians(-77.0596),
                lan: toRadians(0.0)
            )
        }
    }
    
    //  Private initializer to enforce use of factory function
    
    private override init(sma: Double, ecc: Double, inc: Double, ml: Double, lp: Double, lan: Double) {
        super.init(sma: sma, ecc: ecc, inc: inc, ml: ml, lp: lp, lan: lan)
    }
}