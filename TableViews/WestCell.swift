//
//  AnimalCell.swift
//  TableViews
//
//  Created by Jaxon Stevens on 1/17/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

class WestCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set the cell custom cell border color
        bgView.layer.borderColor = UIColor(red:0.13, green:0.76, blue:0.84, alpha:1.00).cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
