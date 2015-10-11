//
//  UranusTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class UranusTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testUranus() {
        if let date = getUTCDate(1975, month: 10, day: 31, hour: 0, minute: 0, second: 0) {
            let pos = PlanetPosition.getPosition(.Uranus, date: date)
            XCTAssertEqualWithAccuracy(211.38025, normalizeDegrees(pos.rightAscension), accuracy: 0.02)
            XCTAssertEqualWithAccuracy(360 - 12.21186111111110, normalizeDegrees(pos.declination), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(19.4873488102392, pos.distance, accuracy: 0.01);
        }
        else {
            XCTFail("couldn't get date")
        }
    }

}
