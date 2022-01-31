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
}
