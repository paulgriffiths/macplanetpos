//
//  OrbitalElementsTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

private let accuracy = 1e-6

class OrbitalElementsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testHelioOrbCoords() {
        let oe = PointOrbitalElements(sma: 1.5237098724978781, ecc: 0.09339210495304585,
                                      inc: 0.03228679757582795, ml: -8.535041810818056,
                                      lp: -0.4180914976406765, lan: 0.8651063792705691);
        let hoc = oe.helioOrbCoords()
        
        XCTAssertEqualWithAccuracy(-0.6657481021889328, hoc.x, accuracy)
        XCTAssertEqualWithAccuracy(-1.424723224035724, hoc.y, accuracy)
        XCTAssertEqualWithAccuracy(1.5725955616988474, hoc.z, accuracy)
    }

    func testHelioEclCoords() {
        let oe = PointOrbitalElements(sma: 0.7233349755491102, ecc: 0.006783927794370295,
                                      inc: 0.0592506905566204, ml: -176.0672590160593,
                                      lp: 2.296888136969044, lan: 1.3391663154600715);
        let hec = oe.helioEclCoords()
        
        XCTAssertEqualWithAccuracy(0.7180208300043192, hec.x, accuracy)
        XCTAssertEqualWithAccuracy(-0.10607733560942739, hec.y, accuracy)
        XCTAssertEqualWithAccuracy(-0.04290011049715045, hec.z, accuracy)
    }
    
    func testDateOrbitalElementsMars() {
        if let date = getUTCDate(1997, 6, 21, 0, 0, 0) {
            let oe = J2000DateElements.newElementsForPlanet(.Mars, date: date)
            let hoc = oe.helioOrbCoords()
            
            XCTAssertEqualWithAccuracy(-0.6657481021889328, hoc.x, accuracy)
            XCTAssertEqualWithAccuracy(-1.424723224035724, hoc.y, accuracy)
            XCTAssertEqualWithAccuracy(1.5725955616988474, hoc.z, accuracy)
        }
        else {
            XCTFail("Couldn't get date")
        }
    }
    
    func testDateOrbitalElementsVenus() {
        if let date = getUTCDate(1982, 6, 14, 8, 30, 0) {
            let oe = J2000DateElements.newElementsForPlanet(.Venus, date: date)
            let hec = oe.helioEclCoords()
            
            XCTAssertEqualWithAccuracy(0.7180208300043192, hec.x, accuracy)
            XCTAssertEqualWithAccuracy(-0.10607733560942739, hec.y, accuracy)
            XCTAssertEqualWithAccuracy(-0.04290011049715045, hec.z, accuracy)
        }
        else {
            XCTFail("Couldn't get date")
        }
    }
}
