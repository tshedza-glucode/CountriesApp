//
//  MainTabBarController.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/27.
//

import UIKit

protocol MainTabBarDelegate {
    func   transitionToHomeScreen(with selectedCountry: CountryData?)
}

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addSelectionDelegate()
    }
    
    func addSelectionDelegate() {
        if let searchNav = viewControllers?[1] as? UINavigationController {
            guard let searchController = searchNav.viewControllers.first as? SearchViewContoller else { return }
            searchController.delegate = self
        }
        if let favoriteNav = viewControllers?[2] as? UINavigationController {
            guard let favoriteController = favoriteNav.viewControllers.first as? FavoriteViewContoller else { return }
            favoriteController.delegate = self
        }
    }
}

extension MainTabBarController: MainTabBarDelegate {
    func transitionToHomeScreen(with selectedCountry: CountryData?) {
        if let homeNav = viewControllers?[0] as? UINavigationController {
            guard let homeViewController = homeNav.viewControllers.first as? HomeViewContoller else { return }
            homeViewController.update(with: selectedCountry)
            self.selectedIndex = 0
        }
    }
}
