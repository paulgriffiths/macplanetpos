//
//  OrbitalElements.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Darwin

class OrbitalElements {
    let sma : Double
    let ecc : Double
    let inc : Double
    let ml : Double
    let lp : Double
    let lan : Double
    
    var man : Double {
        return ml - lp
    }
    
    var arp : Double {
        return lp - lan
    }
    
    init(sma: Double, ecc: Double, inc: Double, ml: Double, lp: Double, lan: Double) {
        self.sma = sma
        self.ecc = ecc
        self.inc = inc
        self.ml = ml
        self.lp = lp
        self.lan = lan
    }
}

