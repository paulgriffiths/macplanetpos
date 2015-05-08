//
//  MercuryTest.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class MercuryTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMercury() {
        if let date = getUTCDate(1980, 5, 5, 20, 23, 0) {
            let pos = PlanetPosition.getPosition(.Mercury, date: date)
            XCTAssertEqualWithAccuracy(35.0765, normalizeDegrees(pos.rightAscension), 0.1)
            XCTAssertEqualWithAccuracy(12.7926666666667, normalizeDegrees(pos.declination), 0.01)
            XCTAssertEqualWithAccuracy(1.30377991344909, pos.distance, 0.0001);
        }
        else {
            XCTFail("couldn't get date")
        }
    }

}
