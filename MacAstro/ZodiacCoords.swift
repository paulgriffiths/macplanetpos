//
//  ZodiacCoords.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

public struct ZodiacCoords {
    private let sign: ZodiacSign
    private let position: DMS
    
    public init(degrees: Double) {
        sign = ZodiacSign.signForDegrees(degrees)
        position = DMS(degrees: normalizeDegrees(degrees))
    }
    
    public var description: String {
        return String(format: "%02d%@%02d", position.wholeDegrees % 30, sign.shortName, position.wholeMinutes)
    }
}
