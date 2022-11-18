//
//  SettingsViewController.swift
//  21_LimCai_Project
//
//  Created by xc50a8 on 2021-08-14.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)
    
    enum SettingSection: Int, CaseIterable, CustomStringConvertible {
        case Profile = 0
        case Others = 1
        
        var description: String {
            switch self {
            case .Profile: return "Profile"
            case .Others: return "Others"
            }
        }
    }
    
    enum ProfileOption: Int, CaseIterable, CustomStringConvertible {
        case ChangePassword
        case ClearHistory
        case DeleteAccount
        
        var description: String {
            switch self {
                case .ChangePassword: return "Change Password"
                case .ClearHistory: return "Clear History"
                case .DeleteAccount: return "Delete Account"
            }
        }
        
        var icon: String {
            switch self {
                case .ChangePassword: return "changePassword"
                case .ClearHistory: return "clearHistory"
                case .DeleteAccount: return "deleteAccount"
            }
        }
    }

    enum OthersOption: Int, CaseIterable, CustomStringConvertible {
        case Logout
        
        var description: String {
            switch self {
            case .Logout: return "Logout"
            }
        }
        
        var icon: String {
            switch self {
                case .Logout: return "logout"
            }
        }
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {  
        return SettingSection.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SettingSection(rawValue: section) else { return 0 }
        
        switch section {
            case .Profile: return ProfileOption.allCases.count
            case .Others: return OthersOption.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingTableViewCell
        
        
        guard let section = SettingSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
            case .Profile:
                let profile = ProfileOption(rawValue: indexPath.row)
                cell.titleOutput?.text = profile?.description
                cell.icon.image = UIImage(named: (profile?.icon)!)
            case .Others:
                let others = OthersOption(rawValue: indexPath.row)
                cell.titleOutput?.text = others?.description
                cell.icon.image = UIImage(named: (others?.icon)!)
        }
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        enum SettingSection: Int, CaseIterable, CustomStringConvertible {
            case Profile = 0
            case Others = 1
            
            var description: String {
                switch self {
                case .Profile: return "Profile"
                case .Others: return "Others"
                }
            }
        }
        
        
        let view = UIView()
        view.backgroundColor = UIColor(named: "Pri Colour")
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = .black
        title.text = SettingSection(rawValue: section)?.description
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        return view
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSection = indexPath.section
        let selectedRow = indexPath.row
        
        tableView.deselectRow(at: indexPath, animated: true)

        if (selectedSection == 0) {
            if (selectedRow == 0) {
                self.performSegue(withIdentifier: "toChangePassword", sender: nil)
            }
            
            
            if (selectedRow == 1) {
                let vc = storyboard?.instantiateViewController(identifier: "ConfirmationStoryboardID") as? ConfirmationViewController
                    
                vc!.comingFrom = "Clear History"
                vc!.textHead = "Are You Sure You Clear Your History?"
                vc!.buttonText = "Clear"
                vc!.title = "Clear History"
                
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            
            
            if (selectedRow == 2) {
                let vc = storyboard?.instantiateViewController(identifier: "ConfirmationStoryboardID") as? ConfirmationViewController
                    
                vc!.comingFrom = "Delete Account"
                vc!.textHead = "Are You Sure You Delete Your Account?"
                vc!.buttonText = "Delete"
                vc!.title = "Delete Account"
                
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
        
        
        
        
        if (selectedSection == 1) {
            if (selectedRow == 0) {
                let vc = storyboard?.instantiateViewController(identifier: "ConfirmationStoryboardID") as? ConfirmationViewController
                    
                vc!.comingFrom = "Logout"
                vc!.textHead = "Are You Sure You Want To Logout?"
                vc!.buttonText = "Logout"
                vc!.title = "Logout"
                
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = navigationController?.navigationBar
        navigationBar?.layoutMargins.left = 30
        navigationBar?.layoutMargins.right = 30
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()

    }
}
