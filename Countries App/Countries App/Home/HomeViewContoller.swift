//
//  HomeViewContoller.swift
//  Countries App
//
//  Created by Tshedza Musandiwa on 2022/01/18.
//

import Foundation
import UIKit

class LocationManager{
    
    static let shared = LocationManager()
    
    var locationGranted = true
    //Initializer access level change now
    private init(){}
    
    func requestForLocation(){
        //Code Process
        locationGranted = true
        print("Location granted")
    }
    
}
//Access class function in a single line
//LocationManager.shared.requestForLocation()


class HomeViewContoller: UIViewController  {
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAllCountries()
        print(LocationManager.shared.locationGranted)
        let n = Int.random(in: 0...249)
        print("Random Number = \(n)")
    }
}
