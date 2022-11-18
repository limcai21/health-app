//
//  ChangeUsernameViewController.swift
//  21_LimCai_Project
//
//  Created by CCIAD3 on 16/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class ChangeUsernameViewController: UIViewController {

    @IBOutlet weak var newUsername: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)
    


    /*
    @IBAction func changeBtn(_ sender: Any) {
        let userInfo = UserDefaults.standard
        var dict = userInfo.dictionary(forKey: "info")!
        
        let newUsernameInput = newUsername.text
        
        if (newUsernameInput != "") {
            if (dict[newUsernameInput!] == nil) {
                
                errorMessage.isHidden = true
                
                let currentPassword = UserDefaults.standard.dictionary(forKey: "info")?["\(username)"]
                
                dict[username] = nil
                userInfo.set(dict, forKey: "info")
                
                // Current Data
                let currentDetails = UserDefaults.standard.dictionary(forKey: "\(username)Details")
                let currentCounter = UserDefaults.standard.dictionary(forKey: "\(username)Counter")
                let currentPP = UserDefaults.standard.dictionary(forKey: "\(username)PP")
                
                print(currentDetails)
                
                UserDefaults.standard.set(currentDetails,forKey: "\(newUsernameInput)Details")
                
                /*
                UserDefaults.standard.set(currentCounter, forKey: "\(newUsernameInput)Counter")
                UserDefaults.standard.set(currentPP, forKey: "\(newUsernameInput)PP")
                */
                
                print(UserDefaults.standard.dictionary(forKey: "\(newUsernameInput)Details"))

                
                dict[newUsernameInput!] = currentPassword
                userInfo.set(dict, forKey: "info")
                
                UserDefaults.standard.removeObject(forKey: "\(username)Details")
                UserDefaults.standard.removeObject(forKey: "\(username)Counter")
                UserDefaults.standard.removeObject(forKey: "\(username)PP")
                

                let alert = UIAlertController(title: "Your Username Is Now Change", message: "Please Login Again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
                    self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true)

            }
                
            else {
                errorMessage.isHidden = false
                errorMessage.text = "Username Is Already Taken. Choose Another One"
            }
        }
        
        else {
            errorMessage.isHidden = false
            errorMessage.text = "Invalid Fields"
        }
        
        
    }
    
    
    
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorMessage.isHidden = true
    }
}
