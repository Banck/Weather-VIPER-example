//
//  Extension+UIVIewController.swift
//  Weather VIPER Example
//
//  Created by Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func showAlert(title: String? = nil, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String? = nil, message: String?, handler: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "OK", style: .cancel, handler: handler)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String? = nil, message: String?, cancel: String? = nil, textField:  Bool = false, completion: ((UIAlertController, UIAlertAction) -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelTitle: String = cancel ?? "Done"
        let action: UIAlertAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: { (alertAction) in
            if completion != nil {
                completion!(alert, alertAction)
            }
        })
        alert.addAction(action)
        
        if textField {
            alert.addTextField(configurationHandler: nil)
        }

        present(alert, animated: true, completion: nil)
    }
}
