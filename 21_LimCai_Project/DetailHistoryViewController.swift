//
//  DetailHistoryViewController.swift
//  21_LimCai_Project
//
//  Created by limcai on 8/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class DetailHistoryViewController: UIViewController {

    @IBOutlet weak var bmiResult: UILabel!
    @IBOutlet weak var dciResult: UILabel!
    @IBOutlet weak var dateResult: UILabel!
    @IBOutlet weak var ageResult: UILabel!
    @IBOutlet weak var paResult: UILabel!
    @IBOutlet weak var genderResult: UILabel!
    @IBOutlet weak var weightResult: UILabel!
    @IBOutlet weak var heightResult: UILabel!
    @IBOutlet weak var bmiStatus: UILabel!
    @IBOutlet weak var bmiStatusView: UIView!
    @IBOutlet weak var bgColour: UIView!
    
    var bmiResultOutput = ""
    var dciResultOutput = ""
    var dateResultOutput = ""
    var ageResultOutput = ""
    var paResultOutput = ""
    var genderResultOutput = ""
    var weightResultOutput = ""
    var heightResultOutput = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        bmiStatusView.layer.cornerRadius = bmiStatusView.frame.height / 2
        
        var paTitle = ""
        
        enum PALevelMen: Double {
            case sedentary = 1.0;
            case lowActive = 1.12;
            case active = 1.27;
            case veryActive = 1.54;
        }
        
        enum PALevelFemale: Double {
            case sedentary = 1.0;
            case lowActive = 1.14;
            case active = 1.27;
            case veryActive = 1.45;
        }
        
        if (genderResultOutput == "Male") {
            if (Double(paResultOutput) == 1.0) {
                paTitle = "Sedentary"
            }
            
            if (Double(paResultOutput) == 1.12) {
                paTitle = "Low Active"
            }
            
            if (Double(paResultOutput) == 1.27) {
                paTitle = "Active"
            }
            
            if (Double(paResultOutput) == 1.54) {
                paTitle = "Very Active"
            }
        }
        
        else {
            if (Double(paResultOutput) == 1.0) {
                paTitle = "Sedentary"
            }
            
            if (Double(paResultOutput) == 1.14) {
                paTitle = "Low Active"
            }
            
            if (Double(paResultOutput) == 1.27) {
                paTitle = "Active"
            }
            
            if (Double(paResultOutput) == 1.45) {
                paTitle = "Very Active"
            }
        }
        
        bmiResult.text = bmiResultOutput
        dciResult.text = dciResultOutput
        dateResult.text = dateResultOutput
        ageResult.text = ageResultOutput
        paResult.text = paTitle
        genderResult.text = genderResultOutput
        weightResult.text = weightResultOutput + " kg"
        heightResult.text = heightResultOutput + " m"
        
        
        let bmiChecking = Double(bmiResultOutput)!
        
        if (bmiChecking <= 18.5) {
            bmiStatusView.backgroundColor = UIColor.blue
            bmiStatus.text = "Underweight"
        }
        
        else {
            if (bmiChecking >= 25.0 ) {
                if (bmiChecking <= 29.9) {
                    bmiStatusView.backgroundColor = UIColor.orange
                    bmiStatus.text = "Overweight"
                }
                
                else {
                    bmiStatusView.backgroundColor = UIColor.red
                    bmiStatus.text = "Obese"
                }
            }
            
            else {
                bmiStatusView.backgroundColor = UIColor(named: "Green")
                bmiStatus.text = "Normal"
            }
        }
    }
}
