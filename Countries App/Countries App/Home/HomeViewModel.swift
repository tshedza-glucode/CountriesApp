//
//  HomeViewModel.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/19.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var countryResponse: CountryData?
    
    func fetchData(completion: @escaping (Error?) -> ()) {
        Service.shared.getAllCountries { [weak self] response, error in
            self?.selectRandomCountry(from: response)
            completion(error)
        }
    }
    
    func selectRandomCountry(from response: [CountryData]?) {
        guard let count = response?.count  else { return }
        let index = Int.random(in: 0..<count)
        countryResponse =  response?[index]
    }
    
    var countryName: String {
        return countryResponse?.name ?? ""
    }
    
    var nativeName: String {
        return "Native name: \(countryResponse?.name ?? "")"
    }
    
    var capitalCity: String {
        return "Capital city: \(countryResponse?.capital ?? "")"
    }
    
    var region: String {
        return "Region: \(countryResponse?.region ?? "")"
    }
    
    var subRegion: String {
        return "Sub region: \(countryResponse?.subregion ?? "")"
    }
    
    var currency: String {
        return "Currency: \(countryResponse?.currencies?[0].name ?? "")(\(countryResponse?.currencies?[0].symbol ?? "")) "
    }
    
    var population: String {
        return "Population: \(String(countryResponse?.population ?? 0))"
    }
    
    var languageList: [String] {
        return countryResponse?.languages?.compactMap({ $0.name }) ?? []
    }
    
    var area: String {
        return "Area: \(String(countryResponse?.area ?? 0.0)) KM^2"
    }
    
    var countryImageURL: String {
        return countryResponse?.flags?.png ?? ""
    }
    
    var countryHeader: CountryHeader {
        return CountryHeader(countryName: countryName, flagImageURL: countryImageURL)
    }
    
    var generalDetailsList: [String] {
        return [nativeName, capitalCity, region, subRegion, currency, population, area]
    }
    
    var generalDetails: CountryDetails {
        return CountryDetails(header: "General", details: generalDetailsList)
    }
    
    var languages: CountryDetails {
        return CountryDetails(header: "Languages", details: languageList)
    }
    
    var borderDetails: CountryDetails {
        return CountryDetails(header: "Borders", details: countryResponse?.borders ?? [])
    }
    
    var failureMessage: CountryDetails {
        return CountryDetails(header: "Warning", details: ["Couldn't retrieve countries at this time,\n Please try again later"])
    }
    
    func savefavorite(country: CountryData) {
        UserDefaults.addToFavorites(country)
    }
    
    func retriveFavorites() -> [CountryData] {
        return UserDefaults.savedfavorites
    }
    
    func rightBarButtonImage() -> UIImage? {
        if UserDefaults.isFavorite(countryResponse) {
            return UIImage(systemName: "star.fill")
        }
        return UIImage(systemName: "star")
    }
    
    func updateFavorites() {
        guard let currentCountry = countryResponse  else { return }
        if UserDefaults.isFavorite(currentCountry) {
            removeFromFavorites(country: currentCountry)
        } else {
            savefavorite(country: currentCountry)
        }
    }
    
    func removeFromFavorites(country: CountryData) {
        UserDefaults.savedfavorites.removeAll(where: { $0.alpha2Code == country.alpha2Code })
    }
}
