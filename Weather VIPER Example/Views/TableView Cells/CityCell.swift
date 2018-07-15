//
//  CityUITableViewCell.swift
//  Weather MVVM example
//
//  Created by Сахабаев Егор on 24.03.17.
//  Copyright © 2017 Сахабаев Егор. All rights reserved.
//

import UIKit
import TableKit
class CityCell: UITableViewCell, ConfigurableCell {
    // MARK: - IBOutlets
    @IBOutlet var precipitationImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    
    // MARK: - Properties
    static var defaultHeight: CGFloat? {
        return CGFloat(50.0).dp
    }

    // MARK: - Initialization and deinitialization
    func configure(with weatherInfo: WeatherInfo) {
        self.cityNameLabel.text = weatherInfo.cityName
        self.temperatureLabel.text = weatherInfo.degree
        self.precipitationImageView.image = weatherInfo.weatherIcon

    }
}
