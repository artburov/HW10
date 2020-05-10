//
//  SettingsTableViewCell.swift
//  HW10
//
//  Created by Admin on 09.05.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
}
