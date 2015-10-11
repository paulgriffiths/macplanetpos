//
//  SunTest.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class SunTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSun() {
        if let date = getUTCDate(2013, month: 6, day: 4, hour: 1, minute: 15, second: 0) {
            let pos = PlanetPosition.getPosition(.Sun, date: date)
            XCTAssertEqualWithAccuracy(72.0135416666667, normalizeDegrees(pos.rightAscension), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(22.4078888888889, normalizeDegrees(pos.declination), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(1.01447036664534, pos.distance, accuracy: 0.0001);
        }
        else {
            XCTFail("couldn't get date")
        }
    }

}
