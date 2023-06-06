//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by mac on 4/6/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bmiValue: String?
    var color: UIColor?
    var advice: String?

    @IBOutlet var bmiLabel: UILabel!
    @IBOutlet var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text =  bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
}
