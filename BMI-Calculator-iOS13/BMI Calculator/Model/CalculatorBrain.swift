//
//  SliderModel.swift
//  BMI Calculator
//
//  Created by mac on 3/6/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var  bmi: BMI?
    
    func getBMIValue() -> String {
        
        let bmiToOneDecimel  = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToOneDecimel
    }
    
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi  = BMI(value: bmiValue, advice: "Eat more pies", color: .blue)
            
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a flea", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Go for a walk", color: .red)
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
        func getColor() -> UIColor {
            return bmi?.color ??  UIColor.gray
        }
}
   

