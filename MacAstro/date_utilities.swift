//
//  date_utilities.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

func getUTCDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> NSDate? {
    if let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian) {
        let dc: NSDateComponents = NSDateComponents()
        dc.year = year
        dc.month = month
        dc.day = day
        dc.hour = hour
        dc.minute = minute
        dc.second = second
        dc.timeZone = NSTimeZone(name: "UTC")
        return cal.dateFromComponents(dc)
    }
    else {
        return nil
    }
}

func getUTCComponentsFromDate(date: NSDate) -> NSDateComponents? {
    if let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian) {
        cal.timeZone = NSTimeZone(name: "UTC")!
        let cu : NSCalendarUnit = [NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second]
        return cal.components(cu, fromDate: date)
    }
    else {
        return nil
    }
}