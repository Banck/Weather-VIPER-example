//
//  Loadable.swift
//  Weather VIPER Example
//
//  Created by Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView
protocol Loadable {
    func startLoading()
    func stopLoading()
}

extension Loadable where Self: UIViewController {
    func startLoading() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(type: .lineScale), NVActivityIndicatorView.DEFAULT_FADE_IN_ANIMATION)
        
    }
    
    func stopLoading() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(NVActivityIndicatorView.DEFAULT_FADE_OUT_ANIMATION)
    }
}
