//
//  ViewsExtensions.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/25.
//

import Foundation
import UIKit

public protocol NibLoadable {
   static func loadView() -> Self?
}

extension NibLoadable where Self: UIView {
   static func loadView() -> Self? {
        let bundle = Bundle.main
        let views = bundle.loadNibNamed(String(describing: self), owner: nil, options: nil)
        guard let view = views?.first as? Self else { return nil }
        return view
    }
}

extension UIImageView {
    
    func load(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UserDefaults {
    private enum Keys {
        static let favorites = "favorites"
    }
    
    static var savedfavorites: [CountryData] {
        get {
            guard let data = UserDefaults.standard.data(forKey: Keys.favorites) else {return []}
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([CountryData].self, from: data)
                print("Retrieved")
                print(countries)
                return countries
            } catch {
                return []
            }
        }
        set {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(newValue)
                UserDefaults.standard.set(data, forKey: Keys.favorites)
                print("Saved")
            } catch {
                print("Unable to Encode countires (\(error))")
            }        }
    }
    
    static func addToFavorites(_ country: CountryData) {
        var currentFavorites = UserDefaults.savedfavorites
        currentFavorites.append(country)
        UserDefaults.savedfavorites = currentFavorites
    }
    
    static func isFavorite(_ country: CountryData?) -> Bool {
        let favorites = UserDefaults.savedfavorites
        guard let country = country else  {return false}
        return favorites.contains(country)
    }
}
