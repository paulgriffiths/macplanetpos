//
//  RectangularCoordsTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

private let accuracy : Double = 1e-6

class RectangularCoordsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDefaultInitializer() {
        let rc = RectangularCoords()
        XCTAssertEqualWithAccuracy(0.0, rc.x, accuracy)
        XCTAssertEqualWithAccuracy(0.0, rc.y, accuracy)
        XCTAssertEqualWithAccuracy(0.0, rc.z, accuracy)
    }
    
    func testMemberwiseInitializer() {
        let rc = RectangularCoords(x: 1.5, y: -4.9, z: 11.367)
        XCTAssertEqualWithAccuracy(1.5, rc.x, accuracy)
        XCTAssertEqualWithAccuracy(-4.9, rc.y, accuracy)
        XCTAssertEqualWithAccuracy(11.367, rc.z, accuracy)
    }
    
    func testCopyInitializer() {
        let rcOriginal = RectangularCoords(x: 1.5, y: -4.9, z: 11.367)
        let rc = RectangularCoords(other: rcOriginal)
        XCTAssertEqualWithAccuracy(1.5, rc.x, accuracy)
        XCTAssertEqualWithAccuracy(-4.9, rc.y, accuracy)
        XCTAssertEqualWithAccuracy(11.367, rc.z, accuracy)
    }
    
    func testSphericalInitializer() {
        let rc = RectangularCoords(spherical: SphericalCoords(azimuth: 25, inclination: 15, radius: -7))
        XCTAssertEqualWithAccuracy(-1.641988012, rc.x, accuracy)
        XCTAssertEqualWithAccuracy(-0.7656715846, rc.y, accuracy)
        XCTAssertEqualWithAccuracy(-6.7614807841, rc.z, accuracy)
    }

    func testToSphericalAllPositive() {
        let sc = RectangularCoords(x: 3, y: 4, z: 5).toSpherical()
        XCTAssertEqualWithAccuracy(53.130102354, sc.azimuth, accuracy)
        XCTAssertEqualWithAccuracy(45.0, sc.inclination, accuracy)
        XCTAssertEqualWithAccuracy(7.071067811, sc.radius, accuracy)
    }
    
    func testToSphericalXNegative() {
        let sc = RectangularCoords(x: -2, y: 8, z: 99).toSpherical()
        XCTAssertEqualWithAccuracy(104.036243468, sc.azimuth, accuracy)
        XCTAssertEqualWithAccuracy(4.761464086, sc.inclination, accuracy)
        XCTAssertEqualWithAccuracy(99.342840708, sc.radius, accuracy)
    }
    
    func testToSphericalYNegative() {
        let sc = RectangularCoords(x: 25, y: -17, z: 6).toSpherical()
        XCTAssertEqualWithAccuracy(-34.21570213, sc.azimuth, accuracy)
        XCTAssertEqualWithAccuracy(78.7748043, sc.inclination, accuracy)
        XCTAssertEqualWithAccuracy(30.82207001, sc.radius, accuracy)
    }
    
    func testToSphericalZNegative() {
        let sc = RectangularCoords(x: 18, y: 51, z: -72).toSpherical()
        XCTAssertEqualWithAccuracy(70.55996517, sc.azimuth, accuracy)
        XCTAssertEqualWithAccuracy(143.0877173, sc.inclination, accuracy)
        XCTAssertEqualWithAccuracy(90.04998612, sc.radius, accuracy)
    }
    
    func testToSphericalAllNegative() {
        let sc = RectangularCoords(x: -10, y: -31, z: -17).toSpherical()
        XCTAssertEqualWithAccuracy(-107.8786966, sc.azimuth, accuracy)
        XCTAssertEqualWithAccuracy(117.5602689, sc.inclination, accuracy)
        XCTAssertEqualWithAccuracy(36.74234614, sc.radius, accuracy)
    }

}
