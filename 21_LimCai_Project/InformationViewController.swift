//
//  InformationViewController.swift
//  21_LimCai_Project
//
//  Created by CCIAD3 on 4/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var informationNextBtn: UIButton!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var ageOutputLabel: UILabel!

    
    class userDetails {
        var height: Double
        var weight: Double
        var age: Int
        var gender: String
        var date: String
        var pa: Double

        init(height: Double, weight: Double, age: Int, gender: String, date: String, pa: Double) {
            self.height = height
            self.weight = weight
            self.age = age
            self.gender = gender
            self.date = date
            self.pa = pa
        }

    }

    var userDetailArray: [userDetails] = []
    

    @IBAction func ageSliderAction(_ sender: Any) {
        ageOutputLabel.text = String(Int(ageSlider.value))
    }
    
    
    @IBAction func nextBtn(_ sender: Any) {
        let height = heightInput.text
        let weight = weightInput.text
        let age = Int(ageSlider.value)
        let gender = genderSegmentControl.titleForSegment(at: genderSegmentControl.selectedSegmentIndex)!
        let pa = 0.0
        
        
        if (height != "") && (weight != "") {
            if let number = Double(height!), let number2 = Double(weight!) {
                if (Double(height!)! < 0.63) || (Double(height!)! > 2.72) {
                    let alert = UIAlertController(title: "Wait A Minute", message: "Are you sure that your height?\nPlease Enter Height In Metres", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
                
                else {
                
                    if (Double(weight!)! < 2.1) || (Double(weight!)! > 635.0) {
                        let alert = UIAlertController(title: "Wait A Minute", message: "Are you sure that your weight?\nPlease Enter Height In Kg", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                    }
                    
                    else {
                        if let vc = storyboard?.instantiateViewController(identifier: "ActivityIntensityStoryboardID") as? ActivityIntensityViewController {
                            
                            let date = Date()
                            let dateformatter = DateFormatter()
                            dateformatter.timeStyle = .none
                            dateformatter.dateStyle = .medium
                            let dateOnly = dateformatter.string(from: date)

                            // Passing data into ActivityIntensityViewController
                            let data = ActivityIntensityViewController.userDetails.init(height: Double(height!)!, weight: Double(weight!)!, age: age, gender: gender, date: dateOnly, pa: pa, bmi: 0.0, dci: 0)
                            vc.userDetailArray.append(data)
                            
                            heightInput.text = ""
                            weightInput.text = ""
                            
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        
                    }
                }
            }
            
            else {
                let alert = UIAlertController(title: "Wow...", message: "Did you just come up with your own numbering system?\nInvalid Numbers", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }
        
        else {
            let alert = UIAlertController(title: "Attention", message: "You Have Not Enter All The Required Information To Continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        let navigationBar = navigationController?.navigationBar
        navigationBar?.layoutMargins.left = 30
        navigationBar?.layoutMargins.right = 30
        
        ageSlider.value = 18
        ageOutputLabel.text = String(Int(ageSlider.value))
        
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
}

