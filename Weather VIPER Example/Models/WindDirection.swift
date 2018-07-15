//
//  WindDirection.swift
//  Weather VIPER Example
//
//  Created by Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation
import UIKit
enum WindDirection {
    case northerly, northWesterly, northEasterly, southerly, southWesterly, southEasterly, easterly, westerly
    
    var icon: UIImage {
        switch self {
        case .northerly:
            return #imageLiteral(resourceName: "North")
        case .northWesterly:
            return #imageLiteral(resourceName: "North West")
        case .northEasterly:
            return #imageLiteral(resourceName: "North East")
        case .southerly:
            return #imageLiteral(resourceName: "South")
        case .southWesterly:
            return #imageLiteral(resourceName: "South West")
        case .southEasterly:
            return #imageLiteral(resourceName: "South East")
        case .easterly:
            return #imageLiteral(resourceName: "East")
        case .westerly:
            return #imageLiteral(resourceName: "West")
        }
    }

    static func from(_ degree: Double?) -> WindDirection {
        guard let degree = degree else {return .northerly}
        switch degree {
        case 0..<22.5:
            return .northerly
        case 22.5..<67.5:
            return .northEasterly
        case 67.5..<122.5:
            return .easterly
        case 122.5..<157.5:
            return .southEasterly
        case 157.5..<202.5:
            return .southerly
        case 202.5..<247.5:
            return .southWesterly
        case 247.5..<292.5:
            return .westerly
        default:
            return .northerly
        }
    }
    
}
