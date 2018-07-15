//
//  Weather.swift
//  Weather VIPER Example
//
//  Created by Egor Sakhabaev on 13.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

typealias WeatherInfo = (cityName: String, weatherIcon: UIImage, degree: String, windDirectionIcon: UIImage)

struct Weather {
    
    // MARK: - Properties
    var city: String!
    var temperature: Float!
    var wind: WindDirection!
    var precipitation: Precipitation!

    // MARK: - Initialization and deinitialization
    init(_ json: JSON) {
        let precipitationString = json["weather"][0]["main"].string ?? "Clear"
        precipitation = Precipitation.from(precipitationString)
        city = json["name"].string
        temperature = json["main"]["temp"].float
        wind = WindDirection.from(json["wind"]["deg"].double)
    }

}
