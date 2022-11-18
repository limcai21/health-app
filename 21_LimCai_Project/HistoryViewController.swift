//
//  HistoryViewController.swift
//  21_LimCai_Project
//
//  Created by limcai on 7/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit



class HistoryViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let username = (UserDefaults.standard.dictionary(forKey: "userLogonDetails")?["username"] as! String)

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userDetails = UserDefaults.standard.object(forKey: "\(username)Details") as? [String: String] ?? [String: String]()
        
        let rows = userDetails.count / 8
        
        if (rows == 0) {
            return 1
        }
        
        else {
            return (userDetails.count / 8)

        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userDetails = UserDefaults.standard.object(forKey: "\(username)Details") as? [String: String] ?? [String: String]()
        
        let rows = userDetails.count / 8
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView

        
        if (rows == 0) {
            cell.date.text = "You Have Nothing Here"
            cell.bmiResult.text = "No Data"
            cell.dciResult.text = "No Data"
            cell.bmiStatus.backgroundColor = UIColor.black
            cell.rightArrow.isHidden = true
        }
        
        
        else {
            cell.rightArrow.isHidden = false
            cell.date.text = (userDetails["date\(indexPath.row)"])
            cell.bmiResult.text = (userDetails["bmi\(indexPath.row)"])
            cell.dciResult.text = "\(userDetails["dci\(indexPath.row)"]!) kcal"
            
            let bmiChecking = Double(userDetails["bmi\(indexPath.row)"]!)!
            
            if (bmiChecking <= 18.5) {
                cell.bmiStatus.backgroundColor = UIColor.blue
            }
            
            else {
                if (bmiChecking >= 25.0 ) {
                    if (bmiChecking <= 29.9) {
                        cell.bmiStatus.backgroundColor = UIColor.orange
                    }
                    
                    else {
                        cell.bmiStatus.backgroundColor = UIColor.red
                    }
                }
                
                else {
                    cell.bmiStatus.backgroundColor = UIColor(named: "Green")
                }
            }
            
        }
        cell.layoutMargins.left = 100

        return cell
    }

    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetails = UserDefaults.standard.object(forKey: "\(username)Details") as? [String: String] ?? [String: String]()
        
        let rows = userDetails.count / 8
        
        
        if let vc = storyboard?.instantiateViewController(identifier: "moreInformationStoryboardID") as? DetailHistoryViewController {
            if (rows != 0) {
                let userDetails = UserDefaults.standard.object(forKey: "\(username)Details") as? [String: String] ?? [String: String]()
              
                vc.dateResultOutput = (userDetails["date\(indexPath.row)"]!)
                vc.bmiResultOutput = (userDetails["bmi\(indexPath.row)"]!)
                vc.dciResultOutput = (userDetails["dci\(indexPath.row)"]!)
                vc.ageResultOutput = (userDetails["age\(indexPath.row)"]!)
                vc.paResultOutput = (userDetails["pa\(indexPath.row)"]!)
                vc.genderResultOutput = (userDetails["gender\(indexPath.row)"]!)
                vc.heightResultOutput = (userDetails["height\(indexPath.row)"]!)
                vc.weightResultOutput = (userDetails["weight\(indexPath.row)"]!)
                         
                tableView.deselectRow(at: indexPath, animated: true)
                
                self.navigationController?.pushViewController(vc, animated: true)
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
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

}
