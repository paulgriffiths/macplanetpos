//
//  PlutoTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class PlutoTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPluto() {
        if let date = getUTCDate(2001, month: 9, day: 11, hour: 14, minute: 0, second: 0) {
            let pos = PlanetPosition.getPosition(.Pluto, date: date)
            XCTAssertEqualWithAccuracy(252.494583333333, normalizeDegrees(pos.rightAscension), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(360 - 12.1994722222222, normalizeDegrees(pos.declination), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(30.5130260187628, pos.distance, accuracy: 0.01);
        }
        else {
            XCTFail("couldn't get date")
        }
    }
}
