//
//  J2000CenturyElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

final class J2000CenturyElements: DeltaOrbitalElements {
    class func newElementsForPlanet(planet: Planet) -> J2000CenturyElements {
        switch ( planet ) {
        case .Mercury:
            return J2000CenturyElements(
                sma: 0.00000037,
                ecc: 0.00001906,
                inc: toRadians(-0.00594749),
                ml: toRadians(149472.67411175),
                lp: toRadians(0.16047689),
                lan: toRadians(-0.12534081)
            )
            
        case .Venus:
            return J2000CenturyElements(
                sma: 0.00000390,
                ecc: -0.00004107,
                inc: toRadians(-0.00078890),
                ml: toRadians(58517.81538729),
                lp: toRadians(0.00268329),
                lan: toRadians(-0.27769418)
            )
            
        case .Earth:
            return J2000CenturyElements(
                sma: 0.00000562,
                ecc: -0.00004392,
                inc: toRadians(-0.01294668),
                ml: toRadians(35999.37244981),
                lp: toRadians(0.32327364),
                lan: toRadians(0.0)
            )
            
        case .Sun:
            return J2000CenturyElements(
                sma: 0.00000562,
                ecc: -0.00004392,
                inc: toRadians(-0.01294668),
                ml: toRadians(35999.37244981),
                lp: toRadians(0.32327364),
                lan: toRadians(0.0)
            )
            
        case .Mars:
            return J2000CenturyElements(
                sma: 0.00001847,
                ecc: 0.00007882,
                inc: toRadians(-0.00813131),
                ml: toRadians(19140.30268499),
                lp: toRadians(0.44441088),
                lan: toRadians(-0.29257343)
            )
            
        case .Jupiter:
            return J2000CenturyElements(
                sma: -0.00011607,
                ecc: -0.00013253,
                inc: toRadians(-0.00183714),
                ml: toRadians(3034.74612775),
                lp: toRadians(0.21252668),
                lan: toRadians(0.20469106)
            )
            
        case .Saturn:
            return J2000CenturyElements(
                sma: -0.00125060,
                ecc: -0.00050991,
                inc: toRadians(0.00193609),
                ml: toRadians(1222.49362201),
                lp: toRadians(-0.41897216),
                lan: toRadians(-0.28867794)
            )
            
        case .Uranus:
            return J2000CenturyElements(
                sma: -0.00196176,
                ecc: -0.00004397,
                inc: toRadians(-0.00242939),
                ml: toRadians(428.48202785),
                lp: toRadians(0.40805281),
                lan: toRadians(0.04240589)
            )
            
        case .Neptune:
            return J2000CenturyElements(
                sma: 0.00026291,
                ecc: 0.00005105,
                inc: toRadians(0.00035372),
                ml: toRadians(218.45945325),
                lp: toRadians(-0.32241464),
                lan: toRadians(-0.00508664)
            )
            
        case .Pluto:
            return J2000CenturyElements(
                sma: -0.00031596,
                ecc: 0.00005170,
                inc: toRadians(0.00004818),
                ml: toRadians(145.20780515),
                lp: toRadians(-0.04062942),
                lan: toRadians(-0.01183482)
            )
            
        case .Moon, .EMBary:
            fatalError("J2000 century orbital elements not available for \(planet.description)")
        }
    }

    //  Private initializer to enforce use of factory function
    
    private override init(sma: Double, ecc: Double, inc: Double, ml: Double, lp: Double, lan: Double) {
        super.init(sma: sma, ecc: ecc, inc: inc, ml: ml, lp: lp, lan: lan)
    }
}
