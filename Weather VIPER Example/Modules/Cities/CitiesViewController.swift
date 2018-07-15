//
//  CitiesViewController.swift
//  Weather VIPER Example
//
//  Created Egor Sakhabaev on 13.07.2018.
//  Copyright © 2018 Egor Sakhabaev. All rights reserved.
//
//  Template generated by Sakhabaev Egor @Banck
//

import UIKit
import TableKit
class CitiesViewController: UIViewController {
    // MARK: - Properties
	var presenter: CitiesPresenterInterface?
    var tableDirector: TableDirector!

    // MARK: - IBOutlets
    @IBOutlet weak var addNewCityButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableDirector = TableDirector(tableView: tableView)
            tableView.tableFooterView = UIView()
        }
    }
    
    // MARK: - Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - CitiesView
extension CitiesViewController: CitiesView {
    func display(_ citiesWeather: [WeatherInfo], shouldClearBefore: Bool) {
        if shouldClearBefore {
            tableDirector.clear()
        }
        let section = TableSection()
        citiesWeather.forEach { (weatherInfo) in
            let rowSelectAction = TableRowAction<CityCell>(.select) { (cellOption) -> Void in
                guard cellOption.cell != nil else {return}
                let index = cellOption.indexPath.section + cellOption.indexPath.row
                self.presenter?.didSelectRow(at: index)
            }
            let row = TableRow<CityCell>(item: weatherInfo, actions: [rowSelectAction])
            section.append(row: row)
        }
        tableDirector += [section]
        tableDirector.reload()
    }
    
    func display(_ cityWeather: WeatherInfo) {
        display([cityWeather], shouldClearBefore: false)
    }
}

// MARK: - IBActions
extension CitiesViewController {
    @IBAction func addNewCityActionHandler(_ sender: Any) {
        presenter?.didSelectAddNewCity()
    }
}
