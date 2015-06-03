//
//  customCell.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-06-01.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var txtUser: UILabel!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtLocation: UILabel!

    @IBOutlet weak var txtspots: UILabel!
    @IBOutlet weak var txtGameType: UILabel!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
