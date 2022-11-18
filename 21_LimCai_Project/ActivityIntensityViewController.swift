//
//  ActivityIntensityViewController.swift
//  21_LimCai_Project
//
//  Created by CCIAD3 on 4/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class ActivityIntensityViewController: UIViewController {
        
    @IBOutlet weak var imageOutput: UIImageView!
    @IBOutlet weak var sedentaryBtnStyle: UIButton!
    @IBOutlet weak var lowActiveBtnStyle: UIButton!
    @IBOutlet weak var activeBtnStyle: UIButton!
    @IBOutlet weak var veryActiveBtnStyle: UIButton!
    @IBOutlet weak var meaningTitle: UILabel!
    @IBOutlet weak var meaningDesc: UILabel!

    class userDetails {
        var height: Double
        var weight: Double
        var age: Int
        var gender: String
        var date: String
        var pa: Double
        var bmi: Double
        var dci: Int

        init(height: Double, weight: Double, age: Int, gender: String, date: String, pa: Double, bmi: Double, dci: Int) {
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
    
    var height: Double = 0.0
    var weight: Double = 0.0
    var age: Int = 0
    var gender: String = ""
    var date: String = ""
    var pa: Double?
    var bmi: Double = 0.0
    var dci: Int = 0
    
    
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
    
    
    
    @IBAction func sedentaryBtn(_ sender: Any) {
        meaningTitle.text = "Sedentary:"
        meaningDesc.text = "(of a person) tending to spend much time seated; somewhat inactive."
        
        if (gender == "Male") {
            imageOutput.image = UIImage(named: "Standing Male")
            pa = PALevelMen.sedentary.rawValue
            
        }
        
        else {
            imageOutput.image = UIImage(named: "Standing Female")
            pa = PALevelFemale.sedentary.rawValue

        }
         
        sedentaryBtnStyle.backgroundColor = UIColor(named: "Button Press Colour")
        lowActiveBtnStyle.backgroundColor = UIColor(named: "Button Colour")
        activeBtnStyle.backgroundColor = UIColor(named: "Button Colour")
        veryActiveBtnStyle.backgroundColor = UIColor(named: "Button Colour")
    }
    
    
    
    
    @IBAction func lowActiveBtn(_ sender: Any) {
        meaningTitle.text = "Low Active:"
        meaningDesc.text = "Walking slowly (strolling), mild stretching, sitting and playing with children, or light cleaning."
        
        if (gender == "Male") {
            imageOutput.image = UIImage(named: "Walking Male")
            pa = PALevelMen.lowActive.rawValue

        }
        
        else {
            imageOutput.image = UIImage(named: "Walking Female")
            pa = PALevelFemale.lowActive.rawValue
        }
         
        sedentaryBtnStyle.backgroundColor = UIColor(named: "Button Colour")
        lowActiveBtnStyle.backgroundColor = UIColor(named: "Button Press Colour")
        activeBtnStyle.backgroundColor = UIColor(named: "Button Colour")
        veryActiveBtnStyle.backgroundColor = UIColor(named: "Button Colour")
    }
    
    
    
    
    
    @IBAction func activeBtn(_ sender: Any) {
        meaningTitle.text = "Active:"
        meaningDesc.text = "Walking briskly, slow leisure cycling, leisure swimming tablet tennis, golf, tai chi, or heavy cleaning."
        
        if (gender == "Male") {
            imageOutput.image = UIImage(named: "Cycling Male")
            pa = PALevelMen.active.rawValue
        }
        
        else {
            imageOutput.image = UIImage(named: "Cycling Female")
            pa = PALevelFemale.active.rawValue
        }
         
        sedentaryBtnStyle.backgroundColor = UIColor(named: "Button Colour")
        lowActiveBtnStyle.backgroundColor = UIColor(named: "Button Colour")
        activeBtnStyle.backgroundColor = UIColor(named: "Button Press Colour")
        veryActiveBtnStyle.backgroundColor = UIColor(named: "Button Colour")
    }
    
    
    
    
    
    @IBAction func veryActive(_ sender: Any) {
        meaningTitle.text = "Very Active:"
        meaningDesc.text = "Aerobics, jogging, or soccer, tennis, basketball, lap swimming or other competitive sports."
        
        
        if (gender == "Male") {
            imageOutput.image = UIImage(named: "Running Male")
            pa = PALevelMen.veryActive.rawValue
        }
        
        else {
            imageOutput.image = UIImage(named: "Running Female")
            pa = PALevelFemale.veryActive.rawValue
        }
        
        sedentaryBtnStyle.backgroundColor = UIColor(named: "Button Colour")
        lowActiveBtnStyle.backgroundColor = UIColor(named: "Button Colour")
        activeBtnStyle.backgroundColor = UIColor(named: "Button Colour")
        veryActiveBtnStyle.backgroundColor = UIColor(named: "Button Press Colour")
    }

    
    @IBAction func nextBtn(_ sender: Any) {
        
        height = userDetailArray[0].height
        weight = userDetailArray[0].weight
        age = userDetailArray[0].age
        gender = userDetailArray[0].gender
        date = userDetailArray[0].date
        bmi = userDetailArray[0].bmi
        dci = userDetailArray[0].dci
                
        
        if let vc = storyboard?.instantiateViewController(identifier: "BMIStoryboardID") as? BMIResultViewController {
            
            let subHeight = pow(height, 2)
            bmi = weight / subHeight
            
            let finalBMI = String(format: "%.1f" , bmi)
    
            if (gender == "Male") {
                let dci = 864 - 9.72 * Double(age) + pa! * (14.2 * Double(weight) + 503 * Double(height))
                vc.dci = Int(dci)
            }
            
            else {
                let dci = 387 - 7.31 * Double(age) + pa! * (10.9 * Double(weight) + 660.7 * Double(height))
                vc.dci = Int(dci)
            }
            
            vc.bmi = finalBMI

            userDetailArray.append(userDetails.init(height: height, weight: weight, age: age, gender: gender, date: date, pa: pa!, bmi: bmi, dci: vc.dci))

            // To Be Used For TableViewPage
            let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)
                                    
            // Get current data 
            var counter = UserDefaults.standard.dictionary(forKey: "\(username)Counter")?["counter"]
            let dict = UserDefaults.standard.dictionary(forKey: "\(username)Details")
            
            if (counter == nil) {
                counter = 0
            }

            var summaryVC: SummaryViewController?
            let data = SummaryViewController.userDetails.init(height: String(height), weight: String(weight), age: age, gender: gender, date: date, pa: pa!, bmi: bmi, dci: vc.dci)
            summaryVC?.userDetailArray.append(data)
            
            print(dci)
            
            if (dict == nil) {
                let data = [
                    "height\(counter!)":String(height),
                    "weight\(counter!)":String(weight),
                    "age\(counter!)":String(age),
                    "gender\(counter!)":gender,
                    "date\(counter!)":date,
                    "pa\(counter!)":String(pa!),
                    "bmi\(counter!)":String(finalBMI),
                    "dci\(counter!)":String(vc.dci)
                ]
                
                UserDefaults.standard.set(data, forKey: "\(username)Details")

            }
            
            else {
                
                var data2 = UserDefaults.standard.dictionary(forKey: "\(username)Details")!

                // Set data
                data2["height\(counter!)"] = String(height)
                data2["weight\(counter!)"] = String(weight)
                data2["age\(counter!)"] = String(age)
                data2["gender\(counter!)"] = String(gender)
                data2["date\(counter!)"] = String(date)
                data2["pa\(counter!)"] = String(pa!)
                data2["bmi\(counter!)"] = String(finalBMI)
                data2["dci\(counter!)"] = String(vc.dci)
                
                UserDefaults.standard.set(data2, forKey: "\(username)Details")

            }
            

            // View Data

            let userDetails = UserDefaults.standard.object(forKey: "\(username)Details") as? [String: String] ?? [String: String]()

            print(userDetails)

            
            // Increase And Set Counter For Next Use a
            counter = counter as! Int + 1
            UserDefaults.standard.set(["counter":counter], forKey: "\(username)Counter")

            self.navigationController?.pushViewController(vc, animated: true)
            
        }
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
        
        self.hideKeyboardWhenTappedAround()
        
        height = userDetailArray[0].height
        weight = userDetailArray[0].weight
        age = userDetailArray[0].age
        gender = userDetailArray[0].gender
        date = userDetailArray[0].date
        pa = userDetailArray[0].pa

        sedentaryBtnStyle.backgroundColor = UIColor(named: "Button Press Colour")
        
        if (gender == "Male") {
            imageOutput.image = UIImage(named: "Standing Male")
            pa = 1.0
        }
        
        else {
            imageOutput.image = UIImage(named: "Standing Female")
            pa = 1.0
        }
    }
}

