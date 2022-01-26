//
//  SearchViewModel.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/19.
//

import Foundation

class SearchViewModel {
    
    var countriesList: [CountryData]?
    var unFiltredCountriesList: [CountryData] = []
    
    func fetchData(completion: @escaping (Error?) -> ()) {
        Service.shared.getAllCountries { [weak self] response, error in
            self?.countriesList = response
            self?.unFiltredCountriesList = response ?? []
            completion(error)
        }
    }
    
    var coutriesListNumber: Int {
        return countriesList?.count ?? Int()
    }
    
    func filterTableView(text:String) {
        if text == "" {
            self.countriesList = unFiltredCountriesList
        } else {
            self.countriesList = unFiltredCountriesList.filter({ (data) -> Bool in
                return data.name?.localizedCaseInsensitiveContains(text) ?? false
            })
        }
    }
}
