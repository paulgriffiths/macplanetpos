//
//  UtilitiesTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

private let accuracy = 1e-6

class UtilitiesTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testToRadians() {
        var result = toRadians(0)
        XCTAssertEqual(0.0, result)
        
        result = toRadians(90)
        XCTAssertEqualWithAccuracy(M_PI / 2, result, accuracy)
        
        result = toRadians(180)
        XCTAssertEqualWithAccuracy(M_PI, result, accuracy)
        
        result = toRadians(270)
        XCTAssertEqualWithAccuracy(M_PI / 2 * 3, result, accuracy)
        
        result = toRadians(360)
        XCTAssertEqualWithAccuracy(M_PI * 2, result, accuracy)
        
        result = toRadians(450)
        XCTAssertEqualWithAccuracy(M_PI * 5 / 2, result, accuracy)
    }
    
    func testToDegrees() {
        var result = toDegrees(0)
        XCTAssertEqual(0.0, result)
        
        result = toDegrees(M_PI / 2)
        XCTAssertEqualWithAccuracy(90.0, result, accuracy)
        
        result = toDegrees(M_PI)
        XCTAssertEqualWithAccuracy(180.0, result, accuracy)
        
        result = toDegrees(M_PI / 2 * 3)
        XCTAssertEqualWithAccuracy(270.0, result, accuracy)
        
        result = toDegrees(M_PI * 2)
        XCTAssertEqualWithAccuracy(360.0, result, accuracy)
        
        result = toDegrees(M_PI * 5 / 2)
        XCTAssertEqualWithAccuracy(450.0, result, accuracy)
    }
    
    func testNormalizeDegrees() {
        var result = normalizeDegrees(50);
        XCTAssertEqualWithAccuracy(50.0, result, accuracy)
        
        result = normalizeDegrees(400);
        XCTAssertEqualWithAccuracy(40.0, result, accuracy)
        
        result = normalizeDegrees(-60);
        XCTAssertEqualWithAccuracy(300.0, result, accuracy)
        
        result = normalizeDegrees(-460);
        XCTAssertEqualWithAccuracy(260.0, result, accuracy)
        
        result = normalizeDegrees(500);
        XCTAssertEqualWithAccuracy(140.0, result, accuracy)
        
        result = normalizeDegrees(360);
        XCTAssertEqualWithAccuracy(0.0, result, accuracy)
        
        result = normalizeDegrees(0);
        XCTAssertEqualWithAccuracy(0.0, result, accuracy)
    }
    
    func testBackForthDate() {
        if let date = getUTCDate(2012, 7, 4, 11, 20, 44) {
            if let dc = getUTCComponentsFromDate(date) {
                XCTAssertEqual(2012, dc.year)
                XCTAssertEqual(7, dc.month)
                XCTAssertEqual(4, dc.day)
                XCTAssertEqual(11, dc.hour)
                XCTAssertEqual(20, dc.minute)
                XCTAssertEqual(44, dc.second)
            }
            else {
                XCTFail("Failed to get date components")
            }
        }
        else {
            XCTFail("Failed to get date")
        }
    }
    
}
