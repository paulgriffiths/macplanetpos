//
//  DMS.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/7/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Darwin

private let SECS_IN_A_DEG = 3600
private let SECS_IN_A_MIN = 60
private let SECS_IN_A_CIRC = 1296000.0

private func signum(number: Double) -> Int {
    return number < 0 ? -1 : 1
}

private func toSeconds(#degrees: Int) -> Int {
    return degrees * SECS_IN_A_DEG
}

private func toSeconds(#minutes: Int) -> Int {
    return minutes * SECS_IN_A_MIN
}

private func toMinutes(#seconds: Int) -> Int {
    return seconds / SECS_IN_A_MIN
}

private func toDegrees(#seconds: Int) -> Int {
    return seconds / SECS_IN_A_DEG
}

struct DMS {
    let degrees: Double
    let wholeDegrees: Int
    let wholeMinutes: Int
    let wholeSeconds: Int
    
    
    init(degrees: Double) {
        self.degrees = degrees
        let totalSecs = Int(round(abs(self.degrees) / 360.0 * SECS_IN_A_CIRC))
        let sign = signum(degrees)
        
        let d = toDegrees(seconds: totalSecs)
        let m = toMinutes(seconds: totalSecs - toSeconds(degrees: d))
        let s = totalSecs - toSeconds(degrees: d) - toSeconds(minutes: m)
        
        wholeDegrees = d * sign
        wholeMinutes = m * sign
        wholeSeconds = s * sign
    }
    
    var description: String {
        return String(format: "%@%02dd %02dm %02ds", (degrees < 0 ? "-" : "+"),
            abs(wholeDegrees), abs(wholeMinutes), abs(wholeSeconds))
    }
}