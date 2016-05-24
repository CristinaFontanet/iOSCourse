//
//  AttributeTableViewCell.swift
//  Users
//
//  Created by 1181432 on 29/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class AttributeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var attributeTitle: UILabel!
    @IBOutlet weak var attributeValue: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
