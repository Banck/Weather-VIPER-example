//
//  CityDetailViewController.swift
//  Weather VIPER Example
//
//  Created Egor Sakhabaev on 15.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//

import UIKit

class CityDetailViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var windImageView: UIImageView!
    @IBOutlet weak var windDirectionLabel: UILabel!
    
    // MARK: - Properties
	var presenter: CityDetailPresenterInterface?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

}

// MARK: - CityDetailView
extension CityDetailViewController: CityDetailView {
    func display(_ weatherInfo: WeatherInfo) {
        cityLabel.text = weatherInfo.cityName
        weatherImageView.image = weatherInfo.weatherIcon
        degreeLabel.text = weatherInfo.degree
        windImageView.image = weatherInfo.windDirectionIcon
    }
}

// MARK: - IBActions
extension CityDetailViewController {
    @IBAction func closeButtonActionHandler(_ sender: Any) {
        presenter?.didSelectCloseButton()
    }
}