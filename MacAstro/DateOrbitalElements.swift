//
//  DateOrbitalElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

class DateOrbitalElements: PointOrbitalElements {
    init(epochElems: PointOrbitalElements, periodElems: DeltaOrbitalElements, periods: Double) {
        super.init(
        sma: epochElems.sma + periodElems.sma * periods,
        ecc: epochElems.ecc + periodElems.ecc * periods,
        inc: epochElems.inc + periodElems.inc * periods,
        ml: epochElems.ml + periodElems.ml * periods,
        lp: epochElems.lp + periodElems.lp * periods,
        lan: epochElems.lan + periodElems.lan * periods
        )
    }
}