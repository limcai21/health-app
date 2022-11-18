//
//  ChangePasswordViewController.swift
//  21_LimCai_Project
//
//  Created by limcai on 15/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var newRetypePassword: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var changePassword: UIButton!
    
    
    
    @IBAction func changePasswordBtn(_ sender: Any) {
        let oldPasswordInput = oldPassword.text
        let newPasswordInput = newPassword.text
        let newRetypePasswordInput = newRetypePassword.text
        
        let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)

        let currentPassword = UserDefaults.standard.dictionary(forKey: "info")!["\(username)"] as! String
        
        print(currentPassword)
        
        if (oldPasswordInput == "") || (newPasswordInput == "") || (newRetypePasswordInput == "") {
            errorMessage.isHidden = false
            errorMessage.text = "Invalid Inputs"
        }
        
        else {
            if (currentPassword != oldPasswordInput) {
                errorMessage.isHidden = false
                errorMessage.text = "Incorrect Old Password"
            }
            
            else {
                if (newPasswordInput != newRetypePasswordInput) {
                    errorMessage.isHidden = false
                    errorMessage.text = "New Password Are Not The Same"
                }
                
                else {
                    errorMessage.isHidden = true
                    UserDefaults.standard.set([username:newPasswordInput], forKey: "info")
                    oldPassword.text = ""
                    newPassword.text = ""
                    newRetypePassword.text = ""
                    let alert = UIAlertController(title: "Password Changed", message: "You Will Now Be Logout", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                    }))
                    
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    
    
    

    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            changePassword.sendActions(for: .touchUpInside)
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorMessage.isHidden = true
        
        oldPassword.delegate = self
        newPassword.delegate = self
        newRetypePassword.delegate = self
    }
    
}
