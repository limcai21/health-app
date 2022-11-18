//
//  SignUpController.swift
//  21_LimCai_Project
//
//  Created by CCIAD3 on 4/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class SignUpController: UIViewController, UITextFieldDelegate {
        
    @IBOutlet weak var registerUsername: UITextField!
    @IBOutlet weak var registerPassword: UITextField!
    @IBOutlet weak var registerRetypePassword: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var registerBtn: UIButton!
    
    var userInfo = UserDefaults.standard
    
    @IBAction func registerBtn(_ sender: Any) {

        var dict = userInfo.dictionary(forKey: "info")!

        let checkUsername = registerUsername.text
        let checkPassword = registerPassword.text
        let checkRetypePassword = registerRetypePassword.text
        
        if (checkUsername != "") && (checkPassword != "") && (checkRetypePassword != "") {
            
            if (checkPassword != checkRetypePassword) {
                errorMessage.isHidden = false
                errorMessage.text = "Password Does Not Match"
            }
            
            else {
                let databaseUsername = dict[checkUsername!] as? String

                if (databaseUsername != nil) {
                    errorMessage.isHidden = false
                    errorMessage.text = "Username Has Been Taken. Pick A New One"
                }
                
                else {
                    errorMessage.isHidden = true
                    dict[checkUsername!] = checkPassword
                    userInfo.set(dict, forKey: "info")
                                    
                    let alert = UIAlertController(title: "All Set!", message: "Time For You To Login", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Let's Go", style: .cancel, handler: { action in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    
                    self.present(alert, animated: true)
                }
            }
        }
        
        else {
            errorMessage.isHidden = false
            errorMessage.text = "Fields Cannot Be Empty"
        }
        
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            registerBtn.sendActions(for: .touchUpInside)
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerUsername.delegate = self
        registerPassword.delegate = self
        registerRetypePassword.delegate = self
        
        self.hideKeyboardWhenTappedAround() 
        
        errorMessage.isHidden = true
        
        registerView.layer.cornerRadius = 30
        registerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
	
        registerView.layer.shadowOffset = CGSize(width: -10, height: 0)
        registerView.layer.shadowRadius = 30
        registerView.layer.shadowOpacity = 0.3
    
        
    }
}
