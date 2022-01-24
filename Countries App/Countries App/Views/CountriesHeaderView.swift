//
//  CountriesHeaderView.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/21.
//

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
     //   flagImageView.image =  UIImage(named: "SAFlag")
        countryNameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        countryNameLabel.text = "South Africa"
    }
    
    func setupView(imageName: String, countryName: String) {
        
      //  flagImageView.imag
        flagImageView.image =  UIImage(named: imageName)
        countryNameLabel.text = countryName
    }
}


