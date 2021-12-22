//
//  WeatherManager.swift
//  Clima
//
//  Created by Rishav Gupta on 09/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation


struct WeatherManager {
    let weatherURL: String = "http://api.openweathermap.org/data/2.5/weather?appid=aff032acfe3743859fbbf730d5714b0d&units=metric"
    
    func fetchWeather(cityName: String) {
        // \() is String Interpolation
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
