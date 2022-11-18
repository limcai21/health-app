//
//  ProfileViewController.swift
//  21_LimCai_Project
//
//  Created by limcai on 9/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var usernameOutput: UILabel!
    @IBOutlet weak var changePP: UIButton!
    
    @IBOutlet weak var resultDate: UILabel!
    @IBOutlet weak var resultBMI: UILabel!
    @IBOutlet weak var resultDCI: UILabel!
    @IBOutlet weak var resultStatus: UIView!
    
    
    
    let defaultImage = UIImage(named: "blank pp")
    
    @IBAction func changePPBtn(_ sender: Any) {

        // Select Photo From Photo Library
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        
        let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)

        let userDetails = UserDefaults.standard.object(forKey: "\(username)Details") as? [String: String] ?? [String: String]()
               
        let rows = userDetails.count / 8
        let counter = UserDefaults.standard.dictionary(forKey: "\(username)Counter")?["counter"]
        let newCounter = (counter as? Int ?? 0) - 1
        
        resultStatus.layer.cornerRadius = resultStatus.frame.width / 2
        
        
        if (rows == 0) {
            resultDate.text = "You Have Nothing Here"
            resultBMI.text = "No Data"
            resultDCI.text = "No Data"
            resultStatus.backgroundColor = UIColor.black
        }
        
        
        else {
            resultBMI.text = (userDetails["bmi\(newCounter)"]!)
            resultDCI.text = (userDetails["dci\(newCounter)"]!) + " kcal"
            resultDate.text = (userDetails["date\(newCounter)"]!)
            
            let bmiChecking = Double(userDetails["bmi\(newCounter)"]!)!
            
            if (bmiChecking <= 18.5) {
                resultStatus.backgroundColor = UIColor.blue
            }
            
            else {
                if (bmiChecking >= 25.0 ) {
                    if (bmiChecking <= 29.9) {
                        resultStatus.backgroundColor = UIColor.orange
                    }
                    
                    else {
                        resultStatus.backgroundColor = UIColor.red
                    }
                }
                
                else {
                    resultStatus.backgroundColor = UIColor(named: "Green")
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = navigationController?.navigationBar
        navigationBar?.layoutMargins.left = 30
        navigationBar?.layoutMargins.right = 30
        
        profilePic.layer.cornerRadius = profilePic.frame.height / 2

        let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)
        usernameOutput.text = username

        let data = UserDefaults.standard.object(forKey: "\(username)PP") as? NSData

        if data == nil {
            print("No Profile Picture")
        }
        
        else {
            profilePic.image = UIImage(data: data! as Data)
        }
    }

}
    
    
    
    




extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\(info)")
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profilePic.image = image
            let imageData:NSData = image.pngData()! as NSData
            
            let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)

            UserDefaults.standard.set(imageData, forKey: "\(username)PP")
        }
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
