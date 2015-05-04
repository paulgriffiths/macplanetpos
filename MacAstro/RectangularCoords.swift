//
//  RectangularCoords.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation
import Darwin

public struct RectangularCoords {
    public let x : Double
    public let y : Double
    public let z : Double
}

extension RectangularCoords {
    public init() {
        self.init(x: 0.0, y: 0.0, z: 0.0)
    }
    
    public init(other: RectangularCoords) {
        self.init(x: other.x, y: other.y, z: other.z)
    }
    
    public init(spherical: SphericalCoords) {
        self.init(other: spherical.toRectangular())
    }
}

extension RectangularCoords {
    public func toSpherical() -> SphericalCoords {
        return SphericalCoords(azimuth: toDegrees(atan2(y, x)),
                               inclination: toDegrees(atan2(hypot(x, y), z)),
                               radius: sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2)))
    }
}