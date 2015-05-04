//
//  JulianDateTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

private let accuracy = 1e-3

class JulianDateTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitializeWithDate() {
        var jd = JulianDate(date: getUTCDate(2013, 6, 2, 0, 0, 0)!)
        XCTAssertEqualWithAccuracy(2456445.5, jd.jdate, accuracy)
        
        jd = JulianDate(date: getUTCDate(1980, 1, 1, 0, 0, 0)!)
        XCTAssertEqualWithAccuracy(2444239.5, jd.jdate, accuracy)
        
        jd = JulianDate(date: getUTCDate(1918, 11, 11, 11, 11, 0)!)
        XCTAssertEqualWithAccuracy(2421908.9661, jd.jdate, accuracy)
    }

}
