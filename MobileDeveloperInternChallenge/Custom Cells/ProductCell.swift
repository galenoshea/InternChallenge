//
//  ProductCell.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation
import UIKit

//Mark: Custom Product Cell which links properties with Storybaord
class ProductCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellInventory: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellBody: UILabel!
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
