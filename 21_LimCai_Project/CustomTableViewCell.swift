//
//  CustomTableViewCell.swift
//  21_LimCai_Project
//
//  Created by limcai on 8/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bmiResult: UILabel!
    @IBOutlet weak var dciResult: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var bmiStatus: UIView!
    @IBOutlet weak var rightArrow: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 15
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 7.5, left: 30, bottom: 7.5, right: 30))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
