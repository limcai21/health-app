//
//  DailyCaloriesViewController.swift
//  21_LimCai_Project
//
//  Created by CCIAD3 on 4/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class DailyCaloriesViewController: UIViewController {
    
    @IBOutlet weak var caloriesOutput: UILabel!
    
    var dci: Int = 0

    @IBAction func nextBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toSummary", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        caloriesOutput.text = String(dci)
        
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
