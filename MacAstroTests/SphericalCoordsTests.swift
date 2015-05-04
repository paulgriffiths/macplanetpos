//
//  SphericalCoordsTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

private let accuracy : Double = 1e-6

class SphericalCoordsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDefaultInitializer() {
        let sc = SphericalCoords()
        XCTAssertEqualWithAccuracy(0.0, sc.azimuth, accuracy)
        XCTAssertEqualWithAccuracy(0.0, sc.inclination, accuracy)
        XCTAssertEqualWithAccuracy(0.0, sc.radius, accuracy)
    }
    
    func testMemberwiseInitializer() {
        let sc = SphericalCoords(azimuth: 1.5, inclination: -4.9, radius: 11.367)
        XCTAssertEqualWithAccuracy(1.5, sc.azimuth, accuracy)
        XCTAssertEqualWithAccuracy(-4.9, sc.inclination, accuracy)
        XCTAssertEqualWithAccuracy(11.367, sc.radius, accuracy)
    }
    
    func testCopyInitializer() {
        let scOriginal = SphericalCoords(azimuth: 1.5, inclination: -4.9, radius: 11.367)
        let sc = SphericalCoords(other: scOriginal)
        XCTAssertEqualWithAccuracy(1.5, sc.azimuth, accuracy)
        XCTAssertEqualWithAccuracy(-4.9, sc.inclination, accuracy)
        XCTAssertEqualWithAccuracy(11.367, sc.radius, accuracy)
    }
    
    func testRectangularInitializer() {
        let sc = SphericalCoords(rectangular: RectangularCoords(x: 3, y: 4, z: 5))
        XCTAssertEqualWithAccuracy(53.130102354, sc.azimuth, accuracy)
        XCTAssertEqualWithAccuracy(45.0, sc.inclination, accuracy)
        XCTAssertEqualWithAccuracy(7.071067811, sc.radius, accuracy)
    }
    
    func testToRectangularAllPositive() {
        let rc = SphericalCoords(azimuth: 45, inclination: 30, radius: 10).toRectangular()
        XCTAssertEqualWithAccuracy(3.535533906, rc.x, accuracy)
        XCTAssertEqualWithAccuracy(3.535533906, rc.y, accuracy)
        XCTAssertEqualWithAccuracy(8.660254038, rc.z, accuracy)
    }
    
    func testToRectangularAzimuthNegative() {
        let rc = SphericalCoords(azimuth: -43.8, inclination: 7, radius: 64).toRectangular()
        XCTAssertEqualWithAccuracy(5.629468486, rc.x, accuracy)
        XCTAssertEqualWithAccuracy(-5.398466185, rc.y, accuracy)
        XCTAssertEqualWithAccuracy(63.52295371, rc.z, accuracy)
    }
    
    func testToRectangularInclinationNegative() {
        let rc = SphericalCoords(azimuth: 4, inclination: -3, radius: 9.3).toRectangular()
        XCTAssertEqualWithAccuracy(-0.4855387569, rc.x, accuracy)
        XCTAssertEqualWithAccuracy(-0.03395217735, rc.y, accuracy)
        XCTAssertEqualWithAccuracy(9.287254673, rc.z, accuracy)
    }
    
    func testToRectangularRadiusNegative() {
        let rc = SphericalCoords(azimuth: 25, inclination: 15, radius: -7).toRectangular()
        XCTAssertEqualWithAccuracy(-1.641988012, rc.x, accuracy)
        XCTAssertEqualWithAccuracy(-0.7656715846, rc.y, accuracy)
        XCTAssertEqualWithAccuracy(-6.761480784, rc.z, accuracy)
    }

    func testToRectangularAllNegative() {
        let rc = SphericalCoords(azimuth: -11.1, inclination: -23.2, radius: -19).toRectangular()
        XCTAssertEqualWithAccuracy(7.344873812, rc.x, accuracy)
        XCTAssertEqualWithAccuracy(-1.441006951, rc.y, accuracy)
        XCTAssertEqualWithAccuracy(-17.46357145, rc.z, accuracy)
    }
    
    
}
