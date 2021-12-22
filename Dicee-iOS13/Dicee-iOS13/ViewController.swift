//
//  ViewController.swift
//  Dicee-iOS13
//

import UIKit

class ViewController: UIViewController {

    // IBOutlet allows me to reference a UI Element
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    // We don't want anything to happen when the view loads up
//    override func viewDidLoad() {
//        super.viewDidLoad()
        // Who.What = Value
        // alpha refers to opacity
//        diceImageView1.alpha = 1
//    }

    // Interface builder action, code that will be triggered when an action occurs on the UI element
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        // print("Button Touch Up Inside(Tapped)! ")
        
        let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        diceImageView1.image = diceArray[Int.random(in: 0...5)] // closed range operator ...
        // alternate way
        // diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray[Int.random(in: 0..<6)] // half open range operator ..<
        
    }
}

