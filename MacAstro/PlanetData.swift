//
//  PlanetData.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

class PlanetData: NSObject, NSTableViewDataSource {
    private var planetArray: [PlanetInfo] = []
    private var lastUpdatedString: String = ""
    private let planets: [Planet] = [.Moon, .Sun, .Mercury, .Venus, .Mars, .Jupiter, .Saturn, .Uranus, .Neptune, .Pluto]
    
    var lastUpdated: String {
        return lastUpdatedString
    }
    
    override init() {
        super.init()
        loadPlanetArray()
    }
    
    func refresh() {
        reloadPlanetArray()
    }
    
    private func loadPlanetArray() {
        for planet in planets {
            planetArray.append(PlanetInfo(planet: planet))
        }
        lastUpdatedString = getCurrentTimeString()
    }
    
    private func reloadPlanetArray() {
        planetArray.removeAll(keepCapacity: true)
        loadPlanetArray()
    }
    
    private func getCurrentTimeString() -> String {
        let locale = NSLocale.currentLocale()
        return NSDate().descriptionWithLocale(locale)
        
        /*if let timeString = NSDate().descriptionWithLocale(locale) {
            return "Updated: " + timeString
        }
        else {
            return "Couldn't get last update time"
        }*/
 
    }
}

extension PlanetData {
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        if let col = tableColumn {
            switch col.identifier {
            case "planet":
                return planetArray[row].name
                
            case "right":
                return planetArray[row].rightAscension
                
            case "declination":
                return planetArray[row].declination
                
            case "distance":
                return planetArray[row].distance
                
            case "zodiac":
                return planetArray[row].zodiac
                
            default:
                fatalError("Unrecognized table column: \(col.identifier)")
            }
        }
        else {
            return planetArray[row].name
        }
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return planetArray.count
    }
}