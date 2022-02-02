//
//  FavoriteViewController.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/18.
//

import Foundation
import UIKit

class FavoriteViewContoller: UIViewController  {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    var delegate: MainTabBarDelegate?
    
    var viewModel = FavoritesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.resetFavorites()
        favoritesTableView.reloadData()
    }
}

extension FavoriteViewContoller: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoriteListCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAVORITE_CELL", for: indexPath) as! CountryTableViewCell
        guard let view = CountryView.loadView() else { return UITableViewCell() }
        view.setupView(countryName: viewModel.favoritesList[indexPath.row].name ?? "", urlString: viewModel.favoritesList[indexPath.row].flags?.png ?? "")
        cell.contentView.addSubview(view)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry =  viewModel.favoritesList[indexPath.row]
        delegate?.transitionToHomeScreen(with: selectedCountry)
    }
}
