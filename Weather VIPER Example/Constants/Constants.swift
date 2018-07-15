//
//  Constants.swift
//  DealApp
//
//  Created by Egor Sakhabaev on 13.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation

struct API {
    static let baseURL = "http://api.openweathermap.org/data/2.5/"
    
    static let weather = "weather"
}

enum Action: String {
    case get
    case set
}

struct AlertMsg {
    static let unknownError = "Что-то пошло не так. Попробуйте позже."
    static let cityNameIsEmpty = "City name can't be empty"
}
