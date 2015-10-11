//
//  NeptuneTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class NeptuneTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNeptune() {
        if let date = getUTCDate(1966, month: 9, day: 15, hour: 9, minute: 0, second: 0) {
            let pos = PlanetPosition.getPosition(.Neptune, date: date)
            XCTAssertEqualWithAccuracy(228.44925, normalizeDegrees(pos.rightAscension), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(360 - 16.2009444444444, normalizeDegrees(pos.declination), accuracy: 0.01)
            XCTAssertEqualWithAccuracy(30.8457020366069, pos.distance, accuracy: 0.01);
        }
        else {
            XCTFail("couldn't get date")
        }
    }

}
