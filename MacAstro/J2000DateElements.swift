//
//  J2000DateElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

final class J2000DateElements: DateOrbitalElements {
    override class func newElementsForPlanet(planet: Planet, date: NSDate) -> J2000DateElements {
        return J2000DateElements(
            epochElems: J2000EpochElements.newElementsForPlanet(planet),
            centuryElems: J2000CenturyElements.newElementsForPlanet(planet),
            date: date
        )
    }
    
    //  Private initializer to enforce use of factory function
    
    private init(epochElems: J2000EpochElements, centuryElems: J2000CenturyElements, date: NSDate) {
        super.init(epochElems: epochElems, periodElems: centuryElems, periods: JulianDate(date: date).centuriesSinceJ2000())
    }
}
