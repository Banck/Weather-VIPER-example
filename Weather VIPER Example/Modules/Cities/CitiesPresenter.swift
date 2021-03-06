//
//  CitiesPresenter.swift
//  Weather VIPER Example
//
//  Created Egor Sakhabaev on 13.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//

import UIKit

class CitiesPresenter {
    // MARK: - Properties
    weak private var view: CitiesView?
    var interactor: CitiesInteractorInput?
    private let router: CitiesWireframeInterface
    
    private var weathers: [Weather] = [Weather]()

    // MARK: - Initialization and deinitialization
    init(interface: CitiesView, interactor: CitiesInteractorInput?, router: CitiesWireframeInterface) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - CitiesPresenterInterface -
extension CitiesPresenter: CitiesPresenterInterface {
    func didSelectAddNewCity() {
        self.view?.showAlert(title: nil, message: "Write city name", cancel: "Done", textField: true) {[weak self] (alertController, alertAction) in
            guard let cityName = alertController.textFields![0].text, !cityName.isEmpty else {
                self?.view?.showAlert(title: nil, message: AlertMsg.cityNameIsEmpty)
                return
            }
            self?.addNewCity(with: cityName)
        }
    }
    
    func didSelectRow(at index: Int) {
        let weather = weathers[index]
        router.navigate(to: .cityDeail(weather))
    }
    
    private func addNewCity(with cityName: String) {
        view?.startLoading()
        interactor?.fetchWeather(for: cityName)
    }
    
}

// MARK: - CitiesInteractorOutput -
extension CitiesPresenter: CitiesInteractorOutput {
    func fetchedWeather(with error: Error) {
        if case let ResponseError.with(code: _, message: msg) = error {
            self.view?.showAlert(title: nil, message: msg)
        }
    }
    
    func fetchedWeather(with weather: Weather) {
        weathers.append(weather)
        let weatherInfo: WeatherInfo = (cityName: weather.city, weatherIcon: weather.precipitation.icon, degree: String(weather.temperature), windDirectionIcon: weather.wind.icon)
        self.view?.display(weatherInfo)
    }
    
    func fetched() {
        view?.stopLoading()
    }
}

