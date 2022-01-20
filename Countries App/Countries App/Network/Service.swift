//
//  Service.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/20.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    let baseURL = "https://restcountries.com/v2/all"
    var countriesList: [CountryData]?
    
    init(){}
    
    func getAllCountries(completed: @escaping () -> Void) {

        if let url = URL(string: baseURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        self.countriesList = try JSONDecoder().decode([CountryData].self, from: data)
                        completed()
                    } catch {
                        // print("Error: \(error.localizedDescription)")
                        print(String(describing: error))
                        completed()
                    }
                }
            }.resume()
        }
    }
}
