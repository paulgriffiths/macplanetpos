//
//  MoonTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class MoonTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMoon() {
        if let date = getUTCDate(1988, 8, 10, 0, 0, 0) {
            let pos = PlanetPosition.getPosition(.Moon, date: date)
            XCTAssertEqualWithAccuracy(112.130708333333, normalizeDegrees(pos.rightAscension), 0.3)
            XCTAssertEqualWithAccuracy(26.1949444444444, normalizeDegrees(pos.declination), 0.1)
        }
        else {
            XCTFail("couldn't get date")
        }
    }

}
