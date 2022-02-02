//
//  SearchViewController.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/18.
//

import Foundation
import UIKit

class SearchViewContoller: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var countriesTableView: UITableView!
    
    var delegate: MainTabBarDelegate?
    
    lazy var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        fetchData()
    }
    
    func fetchData() {
        viewModel.fetchData { [weak self] error in
            if error == nil {
                self?.countriesTableView.reloadData()
            } else {
                // Handle failure
            }
        }
    }
}

extension SearchViewContoller: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coutriesListNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "COUNTRY_CELL", for: indexPath) as! CountryTableViewCell
        guard let view = CountryView.loadView() else { return UITableViewCell() }
        view.setupView(countryName: viewModel.countriesList?[indexPath.row].name ?? "", urlString: viewModel.countriesList?[indexPath.row].flags?.png ?? "")
        cell.contentView.addSubview(view)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry =  viewModel.countriesList?[indexPath.row]
        delegate?.transitionToHomeScreen(with: selectedCountry)
    }
}

extension SearchViewContoller: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        viewModel.filterTableView(text: "")
        searchBar.resignFirstResponder()
        countriesTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        viewModel.filterTableView(text: searchText)
        countriesTableView.reloadData()
    }
}
