//
//  ZodiacSignTests.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class ZodiacSignTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDescription() {
        XCTAssertEqual("Aries", ZodiacSign.Aries.description)
        XCTAssertEqual("Taurus", ZodiacSign.Taurus.description)
        XCTAssertEqual("Gemini", ZodiacSign.Gemini.description)
        XCTAssertEqual("Cancer", ZodiacSign.Cancer.description)
        XCTAssertEqual("Leo", ZodiacSign.Leo.description)
        XCTAssertEqual("Virgo", ZodiacSign.Virgo.description)
        XCTAssertEqual("Libra", ZodiacSign.Libra.description)
        XCTAssertEqual("Scorpio", ZodiacSign.Scorpio.description)
        XCTAssertEqual("Sagittarius", ZodiacSign.Sagittarius.description)
        XCTAssertEqual("Capricorn", ZodiacSign.Capricorn.description)
        XCTAssertEqual("Aquarius", ZodiacSign.Aquarius.description)
        XCTAssertEqual("Pisces", ZodiacSign.Pisces.description)
    }
    
    func testShortName() {
        XCTAssertEqual("AR", ZodiacSign.Aries.shortName)
        XCTAssertEqual("TA", ZodiacSign.Taurus.shortName)
        XCTAssertEqual("GE", ZodiacSign.Gemini.shortName)
        XCTAssertEqual("CN", ZodiacSign.Cancer.shortName)
        XCTAssertEqual("LE", ZodiacSign.Leo.shortName)
        XCTAssertEqual("VI", ZodiacSign.Virgo.shortName)
        XCTAssertEqual("LI", ZodiacSign.Libra.shortName)
        XCTAssertEqual("SC", ZodiacSign.Scorpio.shortName)
        XCTAssertEqual("SG", ZodiacSign.Sagittarius.shortName)
        XCTAssertEqual("CP", ZodiacSign.Capricorn.shortName)
        XCTAssertEqual("AQ", ZodiacSign.Aquarius.shortName)
        XCTAssertEqual("PI", ZodiacSign.Pisces.shortName)
    }
    
    func testSignFromDegrees() {
        XCTAssertEqual(ZodiacSign.signForDegrees(0.0).shortName, "AR");
        XCTAssertEqual(ZodiacSign.signForDegrees(29.9).shortName, "AR");
        XCTAssertEqual(ZodiacSign.signForDegrees(30.0).shortName, "TA");
        XCTAssertEqual(ZodiacSign.signForDegrees(59.9).shortName, "TA");
        XCTAssertEqual(ZodiacSign.signForDegrees(60.0).shortName, "GE");
        XCTAssertEqual(ZodiacSign.signForDegrees(89.9).shortName, "GE");
        XCTAssertEqual(ZodiacSign.signForDegrees(90.0).shortName, "CN");
        XCTAssertEqual(ZodiacSign.signForDegrees(119.9).shortName, "CN");
        XCTAssertEqual(ZodiacSign.signForDegrees(120.0).shortName, "LE");
        XCTAssertEqual(ZodiacSign.signForDegrees(149.9).shortName, "LE");
        XCTAssertEqual(ZodiacSign.signForDegrees(150.0).shortName, "VI");
        XCTAssertEqual(ZodiacSign.signForDegrees(179.9).shortName, "VI");
        XCTAssertEqual(ZodiacSign.signForDegrees(180.0).shortName, "LI");
        XCTAssertEqual(ZodiacSign.signForDegrees(209.9).shortName, "LI");
        XCTAssertEqual(ZodiacSign.signForDegrees(210.0).shortName, "SC");
        XCTAssertEqual(ZodiacSign.signForDegrees(239.9).shortName, "SC");
        XCTAssertEqual(ZodiacSign.signForDegrees(240.0).shortName, "SG");
        XCTAssertEqual(ZodiacSign.signForDegrees(269.9).shortName, "SG");
        XCTAssertEqual(ZodiacSign.signForDegrees(270.0).shortName, "CP");
        XCTAssertEqual(ZodiacSign.signForDegrees(299.9).shortName, "CP");
        XCTAssertEqual(ZodiacSign.signForDegrees(300.0).shortName, "AQ");
        XCTAssertEqual(ZodiacSign.signForDegrees(329.9).shortName, "AQ");
        XCTAssertEqual(ZodiacSign.signForDegrees(330.0).shortName, "PI");
        XCTAssertEqual(ZodiacSign.signForDegrees(359.9).shortName, "PI");
        XCTAssertEqual(ZodiacSign.signForDegrees(-15.0).shortName, "PI");
        XCTAssertEqual(ZodiacSign.signForDegrees(380.0).shortName, "AR");
    }
}
