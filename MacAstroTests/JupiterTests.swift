//
//  JupiterTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class JupiterTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testJupiter() {
        if let date = getUTCDate(1991, 6, 17, 0, 0, 0) {
            let pos = PlanetPosition.getPosition(.Jupiter, date: date)
            XCTAssertEqualWithAccuracy(134.511875, normalizeDegrees(pos.rightAscension), 0.01)
            XCTAssertEqualWithAccuracy(17.9471666666667, normalizeDegrees(pos.declination), 0.01)
            XCTAssertEqualWithAccuracy(5.9852047799159, pos.distance, 0.01);
        }
        else {
            XCTFail("couldn't get date")
        }
    }

}
