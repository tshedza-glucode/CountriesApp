//
//  HomeViewModel.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/19.
//

import Foundation

class HomeViewModel {
    
    let baseURL = "https://restcountries.com/v2/all"
    var countriesList: [CountryData]?
    
    func getAllCountries() {
        
        if let url = URL(string: baseURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        self.countriesList = try JSONDecoder().decode([CountryData].self, from: data)
                    } catch {
                        // print("Error: \(error.localizedDescription)")
                        print(String(describing: error))
                    }
                }
            }.resume()
        }
    }
}
