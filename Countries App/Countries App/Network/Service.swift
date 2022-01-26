//
//  Service.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/20.
//

import Foundation

typealias CountriesResponseBlock = ([CountryData]?, Error?) -> ()

class Service {
    
    static let shared = Service()
    
    let baseURL = "https://restcountries.com/v2/all"
    private var countriesList: [CountryData]?
    
    init(){}
    
    func getAllCountries(completed: @escaping CountriesResponseBlock) {
        if countriesList != nil {
            completed(countriesList, nil)
        }  else {
            retrieveData(completed: completed)}
    }
    
    func retrieveData(completed: @escaping CountriesResponseBlock) {
        if let url = URL(string: baseURL) {
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            self?.countriesList = try JSONDecoder().decode([CountryData].self, from: data)
                            completed(self?.countriesList, nil)
                        } catch {
                            // print("Error: \(error.localizedDescription)")
                            print(String(describing: error))
                            completed(nil, error)
                        }
                    }
                }
            }.resume()
        }
    }
}
