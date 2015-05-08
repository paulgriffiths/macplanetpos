//
//  ZodiacCoordsTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class ZodiacCoordsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDescription() {
        XCTAssertEqual("00AR00", ZodiacCoords(degrees: 0.0).description)
        XCTAssertEqual("29AR23", ZodiacCoords(degrees: 29.39).description)
        XCTAssertEqual("13LE24", ZodiacCoords(degrees: 133.41).description)
        XCTAssertEqual("15SG52", ZodiacCoords(degrees: 255.88).description)
        XCTAssertEqual("29PI55", ZodiacCoords(degrees: 359.92).description)
        XCTAssertEqual("17TA04", ZodiacCoords(degrees: 407.08).description)
        XCTAssertEqual("09CP16", ZodiacCoords(degrees: -80.73).description)
    }
}
