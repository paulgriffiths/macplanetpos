//
//  ZodiacSign.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

private let shortNames: [ZodiacSign : String] = [
    .Aries : "AR",
    .Taurus : "TA",
    .Gemini : "GE",
    .Cancer : "CN",
    .Leo : "LE",
    .Virgo : "VI",
    .Libra : "LI",
    .Scorpio : "SC",
    .Sagittarius : "SG",
    .Capricorn : "CP",
    .Aquarius : "AQ",
    .Pisces : "PI"
]

private let signs: [ZodiacSign] = [
    .Aries, .Taurus, .Gemini, .Cancer, .Leo, .Virgo,
    .Libra, .Scorpio, .Sagittarius, .Capricorn, .Aquarius, .Pisces
]

public enum ZodiacSign: String {
    case Aries = "Aries"
    case Taurus = "Taurus"
    case Gemini = "Gemini"
    case Cancer = "Cancer"
    case Leo = "Leo"
    case Virgo = "Virgo"
    case Libra = "Libra"
    case Scorpio = "Scorpio"
    case Sagittarius = "Sagittarius"
    case Capricorn = "Capricorn"
    case Aquarius = "Aquarius"
    case Pisces = "Pisces"
    
    public static func signForDegrees(degrees: Double) -> ZodiacSign {
        return signs[Int(normalizeDegrees(degrees) / 30.0)]
    }
    
    public var description: String {
        return self.rawValue
    }
    
    public var shortName: String {
        return shortNames[self]!
    }
}
