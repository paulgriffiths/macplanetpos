//
//  DMSTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class DMSTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitializeZero() {
        let dms = DMS(degrees: 0)
        XCTAssertEqualWithAccuracy(0.0, dms.degrees, 0.000001)
        XCTAssertEqual(0, dms.wholeDegrees)
        XCTAssertEqual(0, dms.wholeMinutes)
        XCTAssertEqual(0, dms.wholeSeconds)
    }
    
    func testInitializePositiveWhole() {
        let dms = DMS(degrees: 90)
        XCTAssertEqualWithAccuracy(90.0, dms.degrees, 0.000001)
        XCTAssertEqual(90, dms.wholeDegrees)
        XCTAssertEqual(0, dms.wholeMinutes)
        XCTAssertEqual(0, dms.wholeSeconds)
    }
    
    func testInitializeNegativeWhole() {
        let dms = DMS(degrees: -90)
        XCTAssertEqualWithAccuracy(-90.0, dms.degrees, 0.000001)
        XCTAssertEqual(-90, dms.wholeDegrees)
        XCTAssertEqual(0, dms.wholeMinutes)
        XCTAssertEqual(0, dms.wholeSeconds)
    }
    
    func testInitializePositiveFractional() {
        let dms = DMS(degrees: 111.374)
        XCTAssertEqualWithAccuracy(111.374, dms.degrees, 0.000001)
        XCTAssertEqual(111, dms.wholeDegrees)
        XCTAssertEqual(22, dms.wholeMinutes)
        XCTAssertEqual(26, dms.wholeSeconds)
    }
    
    func testInitializeNegativeFractional() {
        let dms = DMS(degrees: -111.374)
        XCTAssertEqualWithAccuracy(-111.374, dms.degrees, 0.000001)
        XCTAssertEqual(-111, dms.wholeDegrees)
        XCTAssertEqual(-22, dms.wholeMinutes)
        XCTAssertEqual(-26, dms.wholeSeconds)
    }
    
    func testInitializePositiveGreaterThan360() {
        let dms = DMS(degrees: 504.892)
        XCTAssertEqualWithAccuracy(504.892, dms.degrees, 0.000001)
        XCTAssertEqual(504, dms.wholeDegrees)
        XCTAssertEqual(53, dms.wholeMinutes)
        XCTAssertEqual(31, dms.wholeSeconds)
    }
    
    func testInitializeNegativeGreaterThan360() {
        let dms = DMS(degrees: -504.892)
        XCTAssertEqualWithAccuracy(-504.892, dms.degrees, 0.000001)
        XCTAssertEqual(-504, dms.wholeDegrees)
        XCTAssertEqual(-53, dms.wholeMinutes)
        XCTAssertEqual(-31, dms.wholeSeconds)
    }

    func testDescription() {
        XCTAssertEqual("+00d 00m 00s", DMS(degrees: 0).description)
        XCTAssertEqual("+11d 22m 26s", DMS(degrees: 11.374).description)
        XCTAssertEqual("-11d 22m 26s", DMS(degrees: -11.374).description)
        XCTAssertEqual("+54d 53m 31s", DMS(degrees: 54.892).description)
        XCTAssertEqual("-54d 53m 31s", DMS(degrees: -54.892).description)
        XCTAssertEqual("+222d 13m 19s", DMS(degrees: 222.222).description)
        XCTAssertEqual("-222d 13m 19s", DMS(degrees: -222.222).description)
    }
}
