//
//  EarthTest.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class EarthTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEarth() {
        if let date = getUTCDate(2015, month: 4, day: 6, hour: 8, minute: 27, second: 0) {
            let pos = PlanetPosition.getPosition(.Earth, date: date)
            XCTAssertEqualWithAccuracy(0.0, normalizeDegrees(pos.rightAscension), accuracy: 0.00001)
            XCTAssertEqualWithAccuracy(90.0, normalizeDegrees(pos.declination), accuracy: 0.00001)
            XCTAssertEqualWithAccuracy(0.0, pos.distance, accuracy: 0.00001);
        }
        else {
            XCTFail("couldn't get date")
        }
    }
}
