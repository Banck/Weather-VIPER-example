//
//  MainAPI.swift
//  DealApp
//
//  Created by Egor Sakhabaev on 13.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON
protocol MainAPI {
    
    static func sendRequest(type: HTTPMethod, url: String!, baseURL: String, parameters: [String: AnyObject]?, headers: HTTPHeaders?, completion: ServerResult?)
}

extension MainAPI {
    
    static func sendRequest(type: HTTPMethod, url: String!, baseURL: String = API.baseURL, parameters: [String: AnyObject]?, headers: HTTPHeaders?, completion: ServerResult?) {
        
        let urlString = baseURL + url
        var encoding: ParameterEncoding = URLEncoding()
        if type == .post {
            encoding = JSONEncoding()
        }
        let tagString = "[Request] "
        print(tagString + urlString + "\r\n \(String(describing: parameters))")

        Alamofire.request(urlString, method: type, parameters: parameters, encoding: encoding ,headers: headers).responseJSON { (response) in
            print(response)

            guard let response = response.result.value as? Dictionary<String, AnyObject> else {
                completion?( .Error (code: nil, message: "Нет соединения!\r\nИнтернет подключение отсутствует или слишком медленное."))
                return
            }
            if let type = response["type"] as? String, type == "error" {
                print("[Error] \(response["message"] as! String)")
                completion?( .Error (code: response["code"] as? String, message: response["message"] as? String))
                return
            }

            if let status = response["success"] as? Bool, status == false {
                print("[Response] \(response["message"] as? String ?? "no message")")
                completion?( .Error (code: response["code"] as? String, message: response["message"] as? String))
                return
            }
            
            let json = JSON(response)
            completion?( .Success (response: json))
        }
    }
    
    static func sendRequest(type: HTTPMethod, url: String!, baseURL: String = API.baseURL, parameters: [String: AnyObject]?, headers: HTTPHeaders?, completion: ServerArrayResult?) {
        
        let urlString = baseURL + url
        let tagString = "[Request] "
        var header: HTTPHeaders = headers == nil ? HTTPHeaders() : headers!
        header["Authorization:Basic"] = "cGV2c2VldkBleGFtcGxlLmNvbTpzZWNyZXQ="

        print(tagString + urlString + "\r\n \(String(describing: parameters))")
        

        Alamofire.request(urlString, method: type, parameters: parameters, headers: header).responseJSON { (response) in
            print(response)
            
            guard let response = response.result.value as? [Dictionary<String, AnyObject>] else {
                completion?( .Error (message: "Нет соединения!\r\nИнтернет подключение отсутствует или слишком медленное."))
                return
            }
            
            completion?( .Success (response: response))
        }
    }
}
