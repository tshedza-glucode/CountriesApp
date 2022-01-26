//
//  CountryView.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/24.
//

import UIKit

class CountryView: UIView, NibLoadable {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styling()
    }
    
    func styling() {
        self.layer.cornerRadius = 5
    }
    
    func setupView(countryName: String, urlString: String) {
        flagImageView.load(urlString: urlString)
        countryNameLabel.text = countryName
    }
}
