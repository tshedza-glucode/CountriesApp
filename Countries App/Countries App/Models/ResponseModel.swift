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
    var subregion: String?
    var region: String?
    var capital: String?
    var population: Int?
    var area: Double?
    var languages: [Language]?
    var currencies: [Currency]?
    var borders: [String]?
    var flags: Flag?
}

struct Currency: Codable {
    var code: String?
    var name: String?
    var symbol: String?
}

struct Flag: Codable {
    var svg: String?
    var png: String?
}

struct Language: Codable {
    var name: String?
    var nativeName: String?
}
