//
//  AstroFunctionsTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

private var accuracy = 1e-6

class AstroFunctionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testKepler() {
        var expected = toRadians(37.40006)
        var result = kepler(toRadians(20), 0.5)
        XCTAssertEqualWithAccuracy(expected, result, accuracy)
        
        expected = toRadians(48.43418)
        result = kepler(toRadians(27), 0.5)
        XCTAssertEqualWithAccuracy(expected, result, accuracy)
        
        expected = toRadians(226.66512)
        result = kepler(toRadians(235), 0.2)
        XCTAssertEqualWithAccuracy(expected, result, accuracy)
        
        expected = toRadians(0)
        result = kepler(toRadians(0), 0)
        XCTAssertEqualWithAccuracy(expected, result, accuracy)
        
        expected = toRadians(360)
        result = kepler(toRadians(360), 0)
        XCTAssertEqualWithAccuracy(expected, result, accuracy)
        
        expected = toRadians(300)
        result = kepler(toRadians(300), 0)
        XCTAssertEqualWithAccuracy(expected, result, accuracy)
        
        expected = toRadians(96.25884)
        result = kepler(toRadians(45), 0.9)
        XCTAssertEqualWithAccuracy(expected, result, accuracy)
    }

}
