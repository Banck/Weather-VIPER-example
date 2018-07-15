//
//  WeatherManager.swift
//  Weather VIPER Example
//
//  Created by Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation
import PromiseKit
struct WeatherManager {
    static func getWeather(for cityName: String) -> Promise<Weather?> {
        return Promise(resolver: { (resolver) in
            WeatherAPI.loadWeather(for: cityName) { (response) in
                switch response {
                case let .Success(response: data):
                    if let code = data["cod"].string, let message = data["message"].string  {
                        resolver.reject(ResponseError.with(code: code, message: message))
                        return
                    }
                    
                    let weather = Weather(data)
                    resolver.fulfill(weather)
                case let .Error(code: code, message: msg):
                    resolver.reject(ResponseError.with(code: code, message: msg))
                }
            }
        })
    }
}
