//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let eggTimes = [
        "Soft" : 3,
        "Medium": 7,
        "Hard": 12]
    
    @IBOutlet var titleLabel: UILabel!
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()

    @IBOutlet var progressBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
                
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
         totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text =  hardness
        
       timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            progressBar.progress = Float(secondsPassed) / Float (totalTime)
            
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    }
    
    

