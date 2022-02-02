//
//  CountriesDetailsView.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/23.
//

import UIKit

class CountriesDetailsView: UIView, NibLoadable {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var detailStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styling()
    }

    func styling() {
        self.layer.cornerRadius = 10
        self.backgroundColor =  .white
        headerLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    func setupView(details: CountryDetails) {
        headerLabel.text = details.header
        addDetails(details.details)
    }
    
    func addDetails(_ details: [String]) {
        for detail in details {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            label.text = detail
            detailStackView.addArrangedSubview(label)
        }
    }
}
