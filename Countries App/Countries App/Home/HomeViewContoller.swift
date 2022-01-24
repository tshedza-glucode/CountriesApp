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
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.spacing = 15.0
        scrollView.backgroundColor = .gray
        addHeaderView()
        addDetailsView()
        addDetailsView()
        addDetailsView()
        addDetailsView()
        addDetailsView()
        addDetailsView()
    }
    
    func addHeaderView() {
        guard let view = CountriesHeaderView.loadView() else { return }
        view.setupView(imageName: "SAFlag", countryName: "SA")
        stackView.addArrangedSubview(view)
    }
    
    func addDetailsView() {
        guard let view = CountriesDetailsView.loadView() else { return }
        view.setupView(headerTitle: "Header", details:["SA", "Zim", "ALG"] )
        stackView.addArrangedSubview(view)
    }
}
