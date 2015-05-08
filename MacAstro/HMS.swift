//
//  HMS.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

private let SECS_IN_A_DAY = 86400.0
private let SECS_IN_A_HOUR = 3600
private let SECS_IN_A_MIN = 60

private func toSeconds(#hours: Int) -> Int {
    return hours * SECS_IN_A_HOUR
}

private func toSeconds(#minutes: Int) -> Int {
    return minutes * SECS_IN_A_MIN
}

private func toMinutes(#seconds: Int) -> Int {
    return seconds / SECS_IN_A_MIN
}

private func toHours(#seconds: Int) -> Int {
    return seconds / SECS_IN_A_HOUR
}

struct HMS {
    let degrees: Double
    let hours: Int
    let minutes: Int
    let seconds: Int
    
    init(degrees: Double) {
        self.degrees = normalizeDegrees(degrees)
        let totalSecs = Int(round(self.degrees / 360.0 * SECS_IN_A_DAY))
        hours = toHours(seconds: totalSecs)
        minutes = toMinutes(seconds: totalSecs - toSeconds(hours: hours))
        seconds = totalSecs - toSeconds(hours: hours) - toSeconds(minutes: minutes)
    }
    
    var description: String {
        return String(format: "%02dh %02dm %02ds", hours, minutes, seconds)
    }
}