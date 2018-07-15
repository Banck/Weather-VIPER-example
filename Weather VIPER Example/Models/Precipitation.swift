//
//  Precipitation.swift
//  Weather VIPER Example
//
//  Created by Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation
import UIKit

enum Precipitation: String {
    case sunny = "Sunny"
    case cloudly = "Clouds"
    case rainy = "Rain"
    case stormly = "Storm"
    case foggy = "Fog"
    
    var icon: UIImage {
        switch self {
        case .sunny:
            return #imageLiteral(resourceName: "sunny")
        case .cloudly:
            return #imageLiteral(resourceName: "cloudly")
        case .rainy:
            return #imageLiteral(resourceName: "rainy")
        case .stormly:
            return #imageLiteral(resourceName: "stormly")
        case .foggy:
            return #imageLiteral(resourceName: "foggy")
        }
    }

    static func from(_ string: String) -> Precipitation {
        if string == "Clear" {
            return .sunny
        }
        if string == "Haze" {
            return .foggy
        }
        guard let precipitation = Precipitation(rawValue: string) else {return .sunny}
        return precipitation
    }
    
}
