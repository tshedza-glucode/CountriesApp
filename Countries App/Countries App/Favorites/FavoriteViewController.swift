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
    
    @IBOutlet weak var stackView: UIStackView!
    var viewModel = FavoritesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundC.png") ?? UIImage())
        setupView()
    }
    
    func showNoFavoriteMessage() {
        guard let view = CountriesDetailsView.loadView() else { return }
        view.setupView(details: viewModel.noFavoriteMessage)
        view.backgroundColor = .white
        stackView.addArrangedSubview(view)
    }
    
    func setupView() {
        viewModel.resetFavorites()
        if viewModel.favoriteListCount == 0 {
            clearStackView()
            showNoFavoriteMessage()
            favoritesTableView.isHidden = true
        } else {
            clearStackView()
            favoritesTableView.isHidden = false
            favoritesTableView.reloadData()
        }
    }
    
    func clearStackView() {
        for view in stackView.subviews {
            view.removeFromSuperview()
        }
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
