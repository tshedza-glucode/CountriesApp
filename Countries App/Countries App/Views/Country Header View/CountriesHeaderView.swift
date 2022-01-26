//
//  CountriesHeaderView.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/21.
//

import UIKit



class CountriesHeaderView: UIView, NibLoadable {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styling()
    }

    func styling() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        countryNameLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    func setupView(header: CountryHeader) {
        flagImageView.load(urlString: header.flagImageURL)
        countryNameLabel.text = header.countryName
    }
}


