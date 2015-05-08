//
//  J2000EpochElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

final class J2000EpochElements: PointOrbitalElements {
    class func newElementsForPlanet(planet: Planet) -> J2000EpochElements {
        switch ( planet ) {
        case .Mercury:
            return J2000EpochElements(
                sma: 0.387009927,
                ecc: 0.20563593,
                inc: toRadians(7.00497902),
                ml: toRadians(252.25032350),
                lp: toRadians(77.45779628),
                lan: toRadians(48.33076593)
            )
            
        case .Venus:
            return J2000EpochElements(
                sma: 0.72333566,
                ecc: 0.00677672,
                inc: toRadians(3.39467605),
                ml: toRadians(181.97909950),
                lp: toRadians(131.60246718),
                lan: toRadians(76.67984255)
            )
            
        case .Earth:
            return J2000EpochElements(
                sma: 1.00000261,
                ecc: 0.01671123,
                inc: toRadians(-0.00001531),
                ml: toRadians(100.46457166),
                lp: toRadians(102.93768193),
                lan: toRadians(0.0)
            )
            
        case .Sun:
            return J2000EpochElements(
                sma: 1.00000261,
                ecc: 0.01671123,
                inc: toRadians(-0.00001531),
                ml: toRadians(100.46457166),
                lp: toRadians(102.93768193),
                lan: toRadians(0.0)
            )
            
        case .Mars:
            return J2000EpochElements(
                sma: 1.52371034,
                ecc: 0.09339410,
                inc: toRadians(1.84969142),
                ml: toRadians(-4.55343205),
                lp: toRadians(-23.94362959),
                lan: toRadians(49.55953891)
            )
            
        case .Jupiter:
            return J2000EpochElements(
                sma: 5.20288700,
                ecc: 0.04838624,
                inc: toRadians(1.30439695),
                ml: toRadians(34.39644051),
                lp: toRadians(14.72847983),
                lan: toRadians(100.47390909)
            )
            
        case .Saturn:
            return J2000EpochElements(
                sma: 9.53667594,
                ecc: 0.05386179,
                inc: toRadians(2.48599187),
                ml: toRadians(49.95424423),
                lp: toRadians(92.59887831),
                lan: toRadians(113.66242448)
            )
            
        case .Uranus:
            return J2000EpochElements(
                sma: 19.18916464,
                ecc: 0.04725744,
                inc: toRadians(0.77263783),
                ml: toRadians(313.23810451),
                lp: toRadians(170.95427630),
                lan: toRadians(74.01692503)
            )
            
        case .Neptune:
            return J2000EpochElements(
                sma: 30.06992276,
                ecc: 0.00859048,
                inc: toRadians(1.77004347),
                ml: toRadians(-55.12002969),
                lp: toRadians(44.96476227),
                lan: toRadians(131.78422574)
            )
            
        case .Pluto:
            return J2000EpochElements(
                sma: 39.48211675,
                ecc: 0.24882730,
                inc: toRadians(17.14001206),
                ml: toRadians(238.92903833),
                lp: toRadians(224.06891629),
                lan: toRadians(110.30393684)
            )
            
        case .Moon:
            fatalError("J2000 epoch orbital elements not available for the Moon")
        }
    }
    
    //  Private initializer to enforce use of factory function
    
    private override init(sma: Double, ecc: Double, inc: Double, ml: Double, lp: Double, lan: Double) {
        super.init(sma: sma, ecc: ecc, inc: inc, ml: ml, lp: lp, lan: lan)
    }
}
