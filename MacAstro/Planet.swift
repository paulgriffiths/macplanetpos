//
//  Planet.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

public enum Planet: String {
    case Mercury = "Mercury"
    case Venus = "Venus"
    case Earth = "Earth"
    case Moon = "Moon"
    case Sun = "Sun"
    case Mars = "Mars"
    case Jupiter = "Jupiter"
    case Saturn = "Saturn"
    case Uranus = "Uranus"
    case Neptune = "Nepture"
    case Pluto = "Pluto"
    case EMBary = "Earth-Moon Barycenter"
    
    public var description: String {
        return self.rawValue
    }
}