//
//  SettingTableViewCell.swift
//  21_LimCai_Project
//
//  Created by xc50a8 on 2021-08-14.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleOutput: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let view = UIView(frame: bounds)
        view.backgroundColor = UIColor.white
        self.backgroundView = view
        // Configure the view for the selected state
    }

}
