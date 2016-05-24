//
//  recordTableViewCell.swift
//  numbersTable
//
//  Created by 1181432 on 28/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class recordTableViewCell: UITableViewCell {

    @IBOutlet weak var recordImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var gradientImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientImage.image = UIImage(named: "gradient")
        titleLabel.textColor = UIColor.whiteColor()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
     //   titleLabel.textColor = UIColor.greenColor()
        // Configure the view for the selected state
    }

   
}
