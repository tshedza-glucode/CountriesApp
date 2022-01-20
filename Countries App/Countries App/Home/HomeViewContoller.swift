//
//  HomeViewContoller.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/18.
//

import Foundation
import UIKit


class HomeViewContoller: UIViewController  {
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let n = Int.random(in: 0...249)
        print("Random Number = \(n)")
        
        print(Service.shared.countriesList)
    }
}
