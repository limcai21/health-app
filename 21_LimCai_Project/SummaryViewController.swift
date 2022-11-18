//
//  SummaryViewController.swift
//  21_LimCai_Project
//
//  Created by limcai on 4/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
        
    @IBOutlet weak var heightOutput: UILabel!
    @IBOutlet weak var weightOutput: UILabel!
    @IBOutlet weak var ageOutput: UILabel!
    @IBOutlet weak var genderOutput: UILabel!
    @IBOutlet weak var bmiOutput: UILabel!
    @IBOutlet weak var dailyCaloriesOutput: UILabel!
    @IBOutlet weak var activityLevelOutput: UILabel!
    
    class userDetails {
        var height: String
        var weight: String
        var age: Int
        var gender: String
        var date: String
        var pa: Double
        var bmi: Double
        var dci: Int

        init(height: String, weight: String, age: Int, gender: String, date: String, pa: Double, bmi: Double, dci: Int) {
            self.height = height
            self.weight = weight
            self.age = age
            self.gender = gender
            self.date = date
            self.pa = pa
            self.bmi = bmi
            self.dci = dci
        }

    }
    
    var userDetailArray: [userDetails] = []
    
    var height: String = ""
    var weight: String = ""
    var age: Int = 0
    var gender: String = ""
    var date: String = ""
    var pa: Double?
    var bmi: Double = 0.0
    var dci: Int = 0
    
    var userInformation = UserDefaults.standard
    
    
    @IBAction func restartBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    
    @IBAction func profileIcon(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(cancelAction)
        alert.addAction(UIAlertAction(title: "Profile", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Logout", style: .default, handler: { action in
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)
        let counter = UserDefaults.standard.dictionary(forKey: "\(username)Counter")?["counter"]
        let newCounter = counter as! Int - 1
        let data = UserDefaults.standard.dictionary(forKey: "\(username)Details")
        
        heightOutput.text = (data!["height\(newCounter)"] as! String) + " m"
        weightOutput.text = (data!["weight\(newCounter)"] as! String) + " kg"
        ageOutput.text = (data!["age\(newCounter)"] as! String)
        genderOutput.text = (data!["gender\(newCounter)"] as! String)
        bmiOutput.text = (data!["bmi\(newCounter)"] as! String)
        dailyCaloriesOutput.text = (data!["dci\(newCounter)"] as! String) + " kcal"
        
        let genderResultOutput = (data!["gender\(newCounter)"] as! String)
        let paResultOutput = (data!["pa\(newCounter)"] as! String)
        var paTitle = ""
        
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
        
        activityLevelOutput.text = paTitle

    }
}
