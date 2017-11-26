//
//  CheckoutItemCell.swift
//  WalmartBucket
//
//  Created by Abid Amirali on 11/26/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

class CheckoutItemCell: UITableViewCell {

    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
