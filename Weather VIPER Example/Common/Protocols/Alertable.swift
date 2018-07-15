//
//  Alertable.swift
//  Weather VIPER Example
//
//  Created by Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation
import UIKit
protocol Alertable {
    func showAlert(title: String?, message: String?)
    func showAlert(title: String?, message: String?, handler: @escaping ((UIAlertAction) -> Void))
    func showAlert(title: String?, message: String?, cancel: String?, textField:  Bool, completion: ((UIAlertController, UIAlertAction) -> Void)?)
}
