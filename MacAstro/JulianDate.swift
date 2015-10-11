//
//  JulianDate.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

private let DATE_J2000 = getUTCDate(2000, month: 1, day: 1, hour: 12, minute: 0, second: 0)!
private let EPOCH_J2000 = 2451545.0
private let DAYS_IN_CENTURY = 36525.0
private let SECS_IN_DAY = 86400.0

public struct JulianDate {
    public let jdate : Double
    
    private static func julianDateFromDate(date: NSDate) -> Double {
        let secs = date.timeIntervalSinceDate(DATE_J2000)
        return EPOCH_J2000 + secs / SECS_IN_DAY
    }
    
    public init(date: NSDate) {
        jdate = JulianDate.julianDateFromDate(date)
    }
    
    public init() {
        self.init(date: NSDate())
    }
    
    public func daysSinceJ2000() -> Double {
        return jdate - EPOCH_J2000
    }
    
    public func centuriesSinceJ2000() -> Double {
        return daysSinceJ2000() / DAYS_IN_CENTURY
    }
    
    public var description: String {
        return String(format: "%.3f", jdate)
    }
}