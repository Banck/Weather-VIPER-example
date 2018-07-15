//
//  CityDetailRouter.swift
//  Weather VIPER Example
//
//  Created Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//

import UIKit

class CityDetailRouter {
    
    weak var viewController: UIViewController?
}

// MARK: - CityDetailWireframeInterface -
extension CityDetailRouter: CityDetailWireframeInterface {
    
    func navigate(to option: CityDetailNavigationOption) {
        switch option {
        case .cities:
            viewController?.dismiss(animated: true)
        }
    }
}

