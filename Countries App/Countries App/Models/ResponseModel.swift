//
//  ResponseModel.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/19.
//

import Foundation

struct CountryData: Codable {
    var name: String?
    var alpha2Code: String?
    var region: String?
    var capital: String?
    var population: Int?
    var currencies: [Currency]?
}

struct Currency: Codable {
    var code: String?
    var name: String?
    var symbol: String?
}
