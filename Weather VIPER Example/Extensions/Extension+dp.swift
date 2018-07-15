//
//  Extension+dp.swift
//  Weather VIPER Example
//
//  Created by Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//

import Foundation
import UIKit
// The main design for iPhone's 6 screen

extension CGFloat {
    var dp: CGFloat {
        return (self / 375) * UIScreen.main.bounds.width
    }
}
extension Float {
    var dp: Float {
        return (self / 375) * Float(UIScreen.main.bounds.width)
    }
}
extension Double {
    var dp: Double {
        return (self / 375) * Double(UIScreen.main.bounds.width)
    }
}
