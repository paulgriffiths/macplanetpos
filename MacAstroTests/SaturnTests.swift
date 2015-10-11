//
//  SaturnTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class SaturnTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSaturn() {
        if let date = getUTCDate(1947, month: 12, day: 1, hour: 12, minute: 0, second: 0) {
            let pos = PlanetPosition.getPosition(.Saturn, date: date)
            XCTAssertEqualWithAccuracy(146.079125, normalizeDegrees(pos.rightAscension), accuracy: 0.02)
            XCTAssertEqualWithAccuracy(14.6949444444444, normalizeDegrees(pos.declination), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(8.84280824210253, pos.distance, accuracy: 0.01);
        }
        else {
            XCTFail("couldn't get date")
        }
    }

}
