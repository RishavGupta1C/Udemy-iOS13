//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
//    let softTime = 5
//    let mediumTime = 8
//    let hardTime = 12
    
    var player: AVAudioPlayer!
    
    let eggTimes = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    
    var secondsRemaining = 60
    
    var totalTime = 0
    
    var timer = Timer()
    
    @IBOutlet weak var eggText: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        
        eggText.text = hardness.uppercased()
        
//        switch hardness.lowercased(){
//        case "soft":
//            print(softTime)
//        case "medium":
//            print(mediumTime)
//        case "hard":
//            print(hardTime)
//        default:
//            print("INVALID!")
//        }
//        if eggTimes[hardness] != nil{
//            print(eggTimes[hardness]!)
//        }else{
//            print("INVALID KEY!")
//        }
        
        totalTime = eggTimes[hardness] ?? 0
        secondsRemaining = eggTimes[hardness] ?? 0
        // We have to create new timer everytime we press the button
        if sender.currentTitle! == "STOP"{
            timer.invalidate()
            player.stop()
        }else{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
    }
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds") // String interpolation
            secondsRemaining -= 1
            progressBar.progress = Float(totalTime - secondsRemaining)/Float(totalTime)
        }else {
//            timer.invalidate()
            eggText.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
