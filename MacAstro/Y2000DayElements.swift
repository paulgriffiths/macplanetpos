//
//  Y2000DayElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

final class Y2000DayElements: DeltaOrbitalElements {
    class func newElementsForPlanet(planet: Planet) -> Y2000DayElements {
        switch ( planet ) {
        case .Mercury, .Venus, .Earth, .Sun, .Mars, .Jupiter, .Saturn, .Uranus, .Neptune, .Pluto:
            fatalError("Y2000 day elements not available for \(planet.description)")
            
        case .Moon:
            return Y2000DayElements(
                sma: 0.0,
                ecc: 0.0,
                inc: toRadians(0.0),
                ml: toRadians(13.1763964649),
                lp: toRadians(0.111403514),
                lan: toRadians(-0.0529538083)
            )
            
        case .EMBary:
            return Y2000DayElements(
                sma: 0.0,
                ecc: -0.000000001151,
                inc: toRadians(0.0),
                ml: toRadians(0.98564735200),
                lp: toRadians(0.00004709350),
                lan: toRadians(0.0)
            )
        }
    }
    
    //  Private initializer to enforce use of factory function
    
    private override init(sma: Double, ecc: Double, inc: Double, ml: Double, lp: Double, lan: Double) {
        super.init(sma: sma, ecc: ecc, inc: inc, ml: ml, lp: lp, lan: lan)
    }
}