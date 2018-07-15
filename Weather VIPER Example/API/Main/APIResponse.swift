//
//  MainAPI.swift
//  DealApp
//
//  Created by Egor Sakhabaev on 13.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//
import Foundation
import SwiftyJSON
enum APIResponse {
    case Success (response: JSON)
    case Error (code: String?, message: String?)
}

typealias ServerResult = (_ response: APIResponse) -> Void

enum APIArrayResponse {
    case Success (response: [Dictionary<String, AnyObject>])
    case Error (message: String?)
}

typealias ServerArrayResult = (_ response: APIArrayResponse) -> Void

enum ResponseError: Error {
    case with(code: String?, message: String?)

}

enum SuccessResponse {
    case Success
    case Error (message: String)
}
