//
//  ViewController.swift
//  21_LimCai_Project
//
//  Created by CCIAD3 on 2/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    @IBOutlet weak var loginErrorMsg: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    var userInfo = UserDefaults.standard

    @IBAction func loginBtn(_ sender: Any) {
                
        let usernameInput = usernameLogin.text
        let passwordInput = passwordLogin.text
                
        if (usernameInput != "") && (passwordInput != "") {
            if let userInfo = (userInfo.dictionary(forKey: "info")) {
                for (i, j) in userInfo {
                    if (i == usernameInput) && ((j as! String) == passwordInput) {
                        loginErrorMsg.isHidden = true
                        usernameLogin.text = ""
                        passwordLogin.text = ""
                        print("Login Successfully")
                        UserDefaults.standard.set(["username":i], forKey: "userLogonDetails")
                        self.performSegue(withIdentifier: "toProfile", sender: nil)
                        break
                    }
                    
                    else {
                        loginErrorMsg.isHidden = false
                        loginErrorMsg.text = "Invalid Username Or Password"
                    }
                }
            }
        }
        
        else {
            loginErrorMsg.isHidden = false
            loginErrorMsg.text = "Invalid Username Or Password"
        }
    }
    
    



    @IBAction func registerBtn(_ sender: Any) {
        usernameLogin.text = ""
        passwordLogin.text = ""
        loginErrorMsg.isHidden = true
        self.performSegue(withIdentifier: "signInToRegister", sender: nil)
    }
 
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            loginBtn.sendActions(for: .touchUpInside)
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLogin.delegate = self
        passwordLogin.delegate = self
        
        self.hideKeyboardWhenTappedAround()

        let navigationBar = navigationController?.navigationBar
        navigationBar?.layoutMargins.left = 30
        navigationBar?.layoutMargins.right = 30
        
        loginErrorMsg.isHidden = true

        guard let _ = userInfo.dictionary(forKey: "info") else {
            userInfo.set(["admin": "1234"], forKey: "info")
            return
        }
        
        print(UserDefaults.standard.dictionary(forKey: "info")!)
        
        /*
        // Remove Everything
        UserDefaults.standard.removeObject(forKey: "info")
        UserDefaults.standard.removeObject(forKey: "adminDetails")
        UserDefaults.standard.removeObject(forKey: "adminCounter")
        */
        
    }
}





extension UIButton {
    open override func draw(_ rect: CGRect) {
        //provide custom style
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
