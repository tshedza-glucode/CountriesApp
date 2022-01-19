//
//  ResponseModel.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/19.
//

import Foundation

struct CountryData: Codable {
    var name: String
    var alpha2Code: String
    var region: String
    var population: Int
}

struct Currency: Codable {
    var code: String?
    var name: String?
    var symbol: String?
}
