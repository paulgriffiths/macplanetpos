//
//  HMSTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class HMSTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitializeZero() {
        let hms = HMS(degrees: 0.0)
        XCTAssertEqualWithAccuracy(0.0, hms.degrees, accuracy: 0.000001)
        XCTAssertEqual(0, hms.hours)
        XCTAssertEqual(0, hms.minutes)
        XCTAssertEqual(0, hms.seconds)
    }
    
    func testInitializePositiveWhole() {
        let hms = HMS(degrees: 100.0)
        XCTAssertEqualWithAccuracy(100.0, hms.degrees, accuracy: 0.000001)
        XCTAssertEqual(6, hms.hours)
        XCTAssertEqual(40, hms.minutes)
        XCTAssertEqual(0, hms.seconds)
    }

    func testInitializeNegativeWhole() {
        let hms = HMS(degrees: -100.0)
        XCTAssertEqualWithAccuracy(260.0, hms.degrees, accuracy: 0.000001)
        XCTAssertEqual(17, hms.hours)
        XCTAssertEqual(20, hms.minutes)
        XCTAssertEqual(0, hms.seconds)
    }

    func testInitializePositiveFractional() {
        let hms = HMS(degrees: 107.4)
        XCTAssertEqualWithAccuracy(107.4, hms.degrees, accuracy: 0.000001)
        XCTAssertEqual(7, hms.hours)
        XCTAssertEqual(9, hms.minutes)
        XCTAssertEqual(36, hms.seconds)
    }
    
    func testInitializeNegativeFractional() {
        let hms = HMS(degrees: -107.4)
        XCTAssertEqualWithAccuracy(252.6, hms.degrees, accuracy: 0.000001)
        XCTAssertEqual(16, hms.hours)
        XCTAssertEqual(50, hms.minutes)
        XCTAssertEqual(24, hms.seconds)
    }
    
    func testInitializePositive360() {
        let hms = HMS(degrees: 360.0)
        XCTAssertEqualWithAccuracy(0.0, hms.degrees, accuracy: 0.000001)
        XCTAssertEqual(0, hms.hours)
        XCTAssertEqual(0, hms.minutes)
        XCTAssertEqual(0, hms.seconds)
    }
    
    func testInitializeNegative360() {
        let hms = HMS(degrees: -360.0)
        XCTAssertEqualWithAccuracy(0.0, hms.degrees, accuracy: 0.000001)
        XCTAssertEqual(0, hms.hours)
        XCTAssertEqual(0, hms.minutes)
        XCTAssertEqual(0, hms.seconds)
    }

    func testInitializePositiveGreaterThan360() {
        let hms = HMS(degrees: 389.62)
        XCTAssertEqualWithAccuracy(29.62, hms.degrees, accuracy: 0.000001)
        XCTAssertEqual(1, hms.hours)
        XCTAssertEqual(58, hms.minutes)
        XCTAssertEqual(29, hms.seconds)
    }
    
    func testInitializeNegativeGreatherThan360() {
        let hms = HMS(degrees: -389.62)
        XCTAssertEqualWithAccuracy(330.38, hms.degrees, accuracy: 0.000001)
        XCTAssertEqual(22, hms.hours)
        XCTAssertEqual(1, hms.minutes)
        XCTAssertEqual(31, hms.seconds)
    }

    func testDescription() {
        XCTAssertEqual("06h 00m 00s", HMS(degrees: 90.0).description)
        XCTAssertEqual("18h 00m 00s", HMS(degrees: -90.0).description)
        XCTAssertEqual("01h 58m 29s", HMS(degrees: 389.62).description)
        XCTAssertEqual("22h 01m 31s", HMS(degrees: -389.62).description)
    }

}
