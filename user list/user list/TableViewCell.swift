//
//  TableViewCell.swift
//  user list
//
//  Created by brn.developers on 6/26/18.
//  Copyright © 2018 brn.developers. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
