//
//  FavoritesViewModel.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/19.
//

import Foundation

class FavoritesViewModel {
    
    var favoritesList = UserDefaults.savedfavorites
    
    var favoriteListCount: Int {
        return favoritesList.count
    }
    
    func resetFavorites() {
        favoritesList = UserDefaults.savedfavorites
    }
    
    var noFavoriteMessage: CountryDetails {
        return CountryDetails(header: "Please note", details: ["You current do not have any favorite country"])
    }
}
