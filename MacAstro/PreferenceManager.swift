//
//  PreferenceManager.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/26/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

class PreferenceManager {
    private let userDefaults = NSUserDefaults.standardUserDefaults()
    private let autorefreshKey = "autorefresh"
    
    var autorefresh: Bool {
        get {
            return userDefaults.boolForKey(autorefreshKey)
        }
        
        set (refresh) {
            userDefaults.setBool(refresh, forKey: autorefreshKey)
        }
    }
    
    init() {
        registerDefaultPreferences()
    }
    
    func registerDefaultPreferences() {
        let defaults: [String: AnyObject] = [autorefreshKey: false]
        userDefaults.registerDefaults(defaults)
    }
}