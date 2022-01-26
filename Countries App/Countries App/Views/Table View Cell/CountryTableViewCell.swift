//
//  CountryTableViewCell.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryView: CountryView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
