//
//  SphericalCoords.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

public struct SphericalCoords {
    public let azimuth : Double
    public let inclination : Double
    public let radius : Double
}

extension SphericalCoords {
    public init() {
        self.init(azimuth: 0.0, inclination: 0.0, radius: 0.0)
    }
    
    public init(other: SphericalCoords) {
        self.init(azimuth: other.azimuth, inclination: other.inclination, radius: other.radius)
    }

    public init(rectangular: RectangularCoords) {
        self.init(other: rectangular.toSpherical())
    }
    
}

extension SphericalCoords {
    public var rightAscension : Double {
        return azimuth
    }
    
    public var declination : Double {
        return 90.0 - inclination
    }
    
    public var distance : Double {
        return radius
    }
}

extension SphericalCoords {
    public func toRectangular() -> RectangularCoords {
        return RectangularCoords(x: radius * sindeg(inclination) * cosdeg(azimuth),
                                 y: radius * sindeg(inclination) * sindeg(azimuth),
                                 z: radius * cosdeg(inclination))
    }
}