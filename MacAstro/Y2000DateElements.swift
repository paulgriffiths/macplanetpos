//
//  Y2000DateElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

private let EPOCH_Y2000 = getUTCDate(1999, 12, 31, 0, 0, 0)!
private let SECS_IN_DAY = 86400.0

final class Y2000DateElements: DateOrbitalElements {
    override class func newElementsForPlanet(planet: Planet, date: NSDate) -> Y2000DateElements {
        return Y2000DateElements(
            epochElems: Y2000EpochElements.newElementsForPlanet(planet),
            dayElems: Y2000DayElements.newElementsForPlanet(planet),
            date: date
        )
    }
    
    //  Private initializer to enforce use of factory function
    
    private init(epochElems: Y2000EpochElements, dayElems: Y2000DayElements, date: NSDate) {
        super.init(
            epochElems: epochElems,
            periodElems: dayElems,
            periods: (date.timeIntervalSinceDate(EPOCH_Y2000) / SECS_IN_DAY)
        )
    }
}
