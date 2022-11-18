//
//  ConfirmationViewController.swift
//  21_LimCai_Project
//
//  Created by limcai on 14/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var confirmTitle: UIButton!
    @IBOutlet weak var titleHead: UILabel!
    
    var comingFrom = ""
    var textHead = ""
    var buttonText = ""
    
    let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)

    @IBAction func confirmButton(_ sender: Any) {
        if (comingFrom == "Clear History") {
            UserDefaults.standard.removeObject(forKey: "\(self.username)Details")
            UserDefaults.standard.set(["counter":0], forKey: "\(self.username)Counter")
                                
            let alert = UIAlertController(title: "History is Cleared", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
        
        if (comingFrom == "Delete Account") {

            let userInfo = UserDefaults.standard
            var dict = userInfo.dictionary(forKey: "info")!

            dict[username] = nil
            userInfo.set(dict, forKey: "info")
            
            UserDefaults.standard.removeObject(forKey: "\(username)Details")
            UserDefaults.standard.removeObject(forKey: "\(username)Counter")
            UserDefaults.standard.removeObject(forKey: "\(username)PP")

            let alert = UIAlertController(title: "Your Account Is Now Deleted", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true)
        }
        
        if (comingFrom == "Logout") {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleHead.text = textHead
        confirmTitle.setTitle(buttonText, for: .normal)
        
    }
    

    

}
