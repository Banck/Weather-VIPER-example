//
//  WeatherAPI.swift
//  Weather VIPER Example
//
//  Created by Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation
struct WeatherAPI: MainAPI {
    
    static func loadWeather(for cityName: String, completion: ServerResult?) {
        guard let appID = Bundle.main.object(forInfoDictionaryKey: "WeatherApiKey") else {
            fatalError("Please provide appID from openweathermap.ord in info.plist for key WeatherApiKey")
        }
        let parameters: [String : AnyObject] = [
            "q": cityName,
            "units": "metric",
            "appid": appID
            ] as [String : AnyObject]
        sendRequest(type: .get, url: API.weather, parameters: parameters, headers: nil, completion: completion)
    }
    
}
