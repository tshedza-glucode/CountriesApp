//
//  CountryHeader.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/26.
//

import Foundation

class CountryHeader {
    
    var countryName: String
    var flagImageURL: String
    
    init(countryName: String, flagImageURL: String) {
        self.countryName = countryName
        self.flagImageURL = flagImageURL
    }
}
