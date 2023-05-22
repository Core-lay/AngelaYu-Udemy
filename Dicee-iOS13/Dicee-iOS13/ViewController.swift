//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var diceImageView1: UIImageView!
    
    @IBOutlet var diceImageView2: UIImageView!
    
    let diceArray = [
    
    UIImage(named: "DiceOne")!,
    UIImage(named: "DiceTwo")!,
    UIImage(named: "DiceThree")!,
    UIImage(named: "DiceFour")!,
    UIImage(named: "DiceFive")!,
    UIImage(named: "DiceSix")!,
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func rollDicePressed(_ sender: UIButton) {
         
        
        diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray.randomElement()
        
        
        
        
        
            }
    
}

