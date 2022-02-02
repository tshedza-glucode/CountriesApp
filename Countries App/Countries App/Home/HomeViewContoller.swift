//
//  HomeViewContoller.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/18.
//

import Foundation
import UIKit

class HomeViewContoller: UIViewController  {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var favoritesButton: UIBarButtonItem!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.spacing = 15.0
        scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundC.png") ?? UIImage())
        favoritesButton.tintColor = .blue
        fetchData()
    }
    
    func fetchData() {
        showLoadingState()
        viewModel.fetchData { [weak self] error in
            if error == nil {
                self?.updateData()
            } else {
                self?.showFailureScreen()
            }
        }
    }
    
    func updateData() {
        favoritesButton.image = viewModel.rightBarButtonImage()
        clearStackView()
        addHeaderView()
        addGenralDetailsView()
        addLanguagesView()
        addBordersDetailsView()
    }
    
    func showLoadingState() {
        clearStackView()
        for _ in 0...4 {
            addLoadingView()
        }
    }
    
    func addLoadingView() {
        guard let view = SimpleGradientLoadingView.loadView() else { return }
        stackView.addArrangedSubview(view)
    }
    
    func clearStackView() {
        for view in stackView.subviews {
            view.removeFromSuperview()
        }
    }
    
    func addHeaderView() {
        guard let view = CountriesHeaderView.loadView() else { return }
        view.setupView(header: viewModel.countryHeader )
        stackView.addArrangedSubview(view)
    }
    
    func addGenralDetailsView() {
        guard let view = CountriesDetailsView.loadView() else { return }
        view.setupView(details: viewModel.generalDetails)
        stackView.addArrangedSubview(view)
    }
    
    func addLanguagesView() {
        guard let view = CountriesDetailsView.loadView() else { return }
        view.setupView(details: viewModel.languages)
        stackView.addArrangedSubview(view)
    }
    
    func addBordersDetailsView() {
        if !viewModel.borderDetails.details.isEmpty {
            guard let view = CountriesDetailsView.loadView() else { return }
            view.setupView(details: viewModel.borderDetails)
            stackView.addArrangedSubview(view)
        }
    }
    
    func showFailureScreen() {
        clearStackView()
        guard let view = CountriesDetailsView.loadView() else { return }
        view.setupView(details: viewModel.failureMessage)
        stackView.addArrangedSubview(view)
    }
    
    func update(with country: CountryData?) {
        viewModel.countryResponse = country
        updateData()
    }
    
    @IBAction private func addToFavoritesTapped(_ sender: Any) {
        viewModel.updateFavorites()
        favoritesButton.image = viewModel.rightBarButtonImage()
    }
}
