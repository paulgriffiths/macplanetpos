//
//  MarsTest.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class MarsTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMars() {
        if let date = getUTCDate(1997, month: 6, day: 21, hour: 0, minute: 0, second: 0) {
            let pos = PlanetPosition.getPosition(.Mars, date: date)
            XCTAssertEqualWithAccuracy(180.840541666667, normalizeDegrees(pos.rightAscension), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(0.03566666666667, normalizeDegrees(pos.declination), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(1.18174124286972, pos.distance, accuracy: 0.0001);
        }
        else {
            XCTFail("couldn't get date")
        }
    }

}
