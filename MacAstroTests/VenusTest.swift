//
//  VenusTest.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class VenusTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testVenus() {
        if let date = getUTCDate(1982, 6, 14, 8, 30, 0) {
            let pos = PlanetPosition.getPosition(.Venus, date: date)
            XCTAssertEqualWithAccuracy(45.2389583333333, normalizeDegrees(pos.rightAscension), 0.01)
            XCTAssertEqualWithAccuracy(15.0340277777778, normalizeDegrees(pos.declination), 0.01)
            XCTAssertEqualWithAccuracy(1.23214680691694, pos.distance, 0.001);
        }
        else {
            XCTFail("couldn't get date")
        }
    }

}
