//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        The textfield should report back to the VC, self refers to the current view controller. The VC gets notified by the textfield and that is done by setting the VC as the delegate.
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    
    // This is the code for go/return button pressed on keyboard and it is possible due to UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // for collapsing the keyboard
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    // For clearing the text field after pressing search
    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        optionally unwrap the optional string of searchTextField.text
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        // Use searchTextField.text to get the weather for that city.
        // This can be written in the searchPressed function
        searchTextField.text = ""
        
    }
    
    
}

